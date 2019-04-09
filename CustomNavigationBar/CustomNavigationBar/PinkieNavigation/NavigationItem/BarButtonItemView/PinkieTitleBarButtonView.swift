//
//  PinkieTitleBarButtonView.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkieTitleBarButtonView: PinkieBarButtonView {

    var title: String
    var block: (() -> Void)?
    var titleLabel: UILabel!
    var button: UIButton!
    var width: Double!
    var clickEnable = true
    
    init(title: String, block: (() -> Void)?) {
        self.title = title
        self.block = block
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.calculateWidth()
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
        self.width = Double(rect.width) + 8.0 + 8.0
    }
    
    func createUI() {
        self.createTitleLabel()
        self.createButton()
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
        
        var rect = self.titleLabel.frame
        rect.size = CGSize(width: self.width - 8.0, height: 24.0)
        rect.origin.x = 8
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
    
    override func reset(title: String) {
        self.title = title
        self.calculateWidth()
        self.titleLabel.text = title
    }
    
    override func reset(image: UIImage, title: String) {
        self.reset(title: title)
    }
}
