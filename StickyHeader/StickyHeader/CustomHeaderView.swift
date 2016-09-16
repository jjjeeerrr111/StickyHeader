//
//  CustomHeaderView.swift
//  StickyHeader
//
//  Created by Jeremy Sh on 2016-09-16.
//  Copyright © 2016
//

import UIKit

class CustomHeaderView: UIView {

    var imageView:UIImageView!
    var colorView:UIView!
    var bgColor = UIColor(red: 235/255, green: 96/255, blue: 91/255, alpha: 1)
    var titleLabel = UILabel()
    var articleIcon:UIImageView!
    
    
    init(frame:CGRect,title: String) {
        self.titleLabel.text = title.uppercaseString
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.backgroundColor = UIColor.whiteColor()
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        
        let constraints:[NSLayoutConstraint] = [
            imageView.topAnchor.constraintEqualToAnchor(self.topAnchor),
            imageView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor),
            imageView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor),
            imageView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor),
            colorView.topAnchor.constraintEqualToAnchor(self.topAnchor),
            colorView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor),
            colorView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor),
            colorView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor)
        ]
        NSLayoutConstraint.activateConstraints(constraints)
        
        imageView.image = UIImage(named: "testBackground")
        imageView.contentMode = .ScaleAspectFill
        
        colorView.backgroundColor = bgColor
        colorView.alpha = 0.6
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        let titlesConstraints:[NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor),
            titleLabel.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 28),
        ]
        NSLayoutConstraint.activateConstraints(titlesConstraints)
        
        titleLabel.font = UIFont.systemFontOfSize(15)
        titleLabel.textAlignment = .Center
        
        articleIcon = UIImageView()
        articleIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(articleIcon)
        
        let imageConstraints:[NSLayoutConstraint] = [
            articleIcon.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor),
            articleIcon.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor, constant: 6),
            articleIcon.widthAnchor.constraintEqualToConstant(40),
            articleIcon.heightAnchor.constraintEqualToConstant(40)
        ]
        NSLayoutConstraint.activateConstraints(imageConstraints)
        
        articleIcon.image = UIImage(named: "article")

    }
    
    func decrementColorAlpha(offset: CGFloat) {
        if self.colorView.alpha <= 1 {
            let alphaOffset = (offset/500)/85
            self.colorView.alpha += alphaOffset
        }
    }
    
    
    func decrementArticleAlpha(offset: CGFloat) {
        if self.articleIcon.alpha >= 0 {
            let alphaOffset = max((offset - 65)/85.0, 0)
            self.articleIcon.alpha = alphaOffset
        }
    }
    func incrementColorAlpha(offset: CGFloat) {
        if self.colorView.alpha >= 0.6 {
            let alphaOffset = (offset/200)/85
            self.colorView.alpha -= alphaOffset
        }
    }
    func incrementArticleAlpha(offset: CGFloat) {
        if self.articleIcon.alpha <= 1 {
            let alphaOffset = max((offset - 65)/85, 0)
            self.articleIcon.alpha = alphaOffset
        }
    }

}
