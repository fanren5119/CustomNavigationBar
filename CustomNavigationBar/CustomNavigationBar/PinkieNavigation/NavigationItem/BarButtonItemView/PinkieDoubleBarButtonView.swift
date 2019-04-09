//
//  PinkieDoubleBarButtonView.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkieDoubleBarButtonView: PinkieBarButtonView {

    var imageName: String
    var title: String
    var image: UIImage?
    var block: (() -> Void)?
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var button: UIButton!
    var width: Double!
    var clickEnable = true
    
    init(imageName: String, title: String, block: (() -> Void)?) {
        self.imageName = imageName
        self.title = title
        self.block = block
        self.image = UIImage(named: self.imageName)
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func calculateWidth() {
        let string = NSString(string: self.title)
        let size = CGSize(width: 150.0, height: CGFloat.greatestFiniteMagnitude)
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        let rect = string.boundingRect(with: size, options: .usesLineFragmentOrigin , attributes: attribute, context: nil)
        self.width = Double(rect.width) + 27.0
    }
    
    func createUI() {
        self.createImageView()
        self.createTitleLabel()
        self.createButton()
    }
    
    func createImageView() {
        self.imageView = UIImageView(image: self.image)
        self.addSubview(self.imageView)
    }
    
    func createTitleLabel() {
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        self.titleLabel.text = self.title
        self.addSubview(self.titleLabel)
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
        
        var imageRect = self.imageView.frame
        imageRect.size = self.image?.size ?? CGSize(width: 0, height: 0)
        imageRect.origin.x = max((27.0 - imageRect.width) / 2.0, 0)
        imageRect.origin.y = (self.frame.height - imageRect.height) / 2.0
        self.imageView.frame = imageRect
        
        var rect = self.titleLabel.frame
        rect.size = CGSize(width: self.width - 27, height: 24.0)
        rect.origin.x = 27
        rect.origin.y = (self.frame.height - 24.0) / 2.0
        self.titleLabel.frame = rect
        
        self.button.frame = self.bounds
    }
    
    override func viewWidth() -> Double {
        return self.width
    }
    
    override func setEnable(enable: Bool) {
        self.clickEnable = enable
    }
    
    override func setTintColor(color: UIColor?) {
        self.titleLabel.textColor = color ?? UIColor.white
    }
    
    override func reset(image: UIImage, title: String) {
        self.image = image
        self.title = title
        self.calculateWidth()
        self.imageView.image = image
        self.titleLabel.text = title
    }
}
