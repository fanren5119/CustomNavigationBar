//
//  PinkieImageBarButtonView.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkieImageBarButtonView: PinkieBarButtonView {
    
    var imageName: String
    var image: UIImage?
    var imageView: UIImageView!
    var button: UIButton!
    var block: (() -> Void)?
    var clickEnable = true
    
    init(imageName: String, block: (() -> Void)?) {
        self.imageName = imageName
        self.image = UIImage(named: self.imageName)
        self.block = block
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        self.createImageView()
        self.createButton()
    }
    
    func createImageView() {
        self.imageView = UIImageView(image: self.image)
        self.addSubview(self.imageView)
    }
    
    func createButton() {
        self.button = UIButton(type: .custom)
        self.button.addTarget(self, action: #selector(respondsToButton), for: .touchUpInside)
        self.addSubview(self.button)
    }
    
    @objc func respondsToButton() {
        if self.clickEnable {
            self.block?()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = self.image?.size ?? CGSize(width: 0, height: 0)
        var rect = self.imageView.frame
        rect.size = size
        rect.origin.x = 8
        rect.origin.y = (self.frame.height - size.height) / 2.0
        self.imageView.frame = rect
        
        self.button.frame = self.bounds
    }
    
    
    override func viewWidth() -> Double {
        return Double(self.image?.size.width ?? 0.0) + 19.0
    }
    
    override func setEnable(enable: Bool) {
        self.clickEnable = enable
    }
    
    override func setTintColor(color: UIColor?) {
        
    }
    
    override func reset(image: UIImage) {
        self.image = image
        self.imageView.image = image
    }
    
    override func reset(image: UIImage, title: String) {
        self.reset(image: image)
    }
}
