//
//  ELSegmentView.swift
//  ElSegmentDemo
//
//  Created by Lyons Eric on 2017/3/27.
//  Copyright © 2017年 Lyons Eric. All rights reserved.
//

import UIKit
import SnapKit

class ELSegmentView: UIView {
    public var titles:[String]!
    private var lineOffsetConstraint: Constraint?
    private var selectBtnIndex = 0
    private var buttonArry: [UIButton] = []
    private let lineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.black
        view.isOpaque = false
        return view
    }()
    init(titles: [String]?) {
        super.init(frame: .zero)
        self.titles = titles ?? ["日排行","周排行","月排行","总排行"]
        installUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func installUI() {
        //添加 button 约束
        for (index, title) in titles!.enumerated() {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
            
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttonDidSelected(_:)), for: .touchUpInside)
            self.addSubview(button)
            buttonArry.append(button)
        }
        var lastButton: UIButton? = nil
        //btn垂直约束
        buttonArry.forEach { (btn) in
            if let last = lastButton {
                btn.snp.makeConstraints({ (make) in
                    make.centerY.equalTo(last)
                })
            } else {
                btn.snp.makeConstraints({ (make) in
                    make.top.equalTo(self).offset(30)
                })
            }
            lastButton = btn
        }
        // btn 水平约束
        self.distributeSpacingHorizontally(with: buttonArry)
        //添加 Views
        self.addSubview(lineView)
        //分割线约束
        lineView.snp.makeConstraints { (make) in
            let width = buttonArry[0].bounds.width
            make.width.equalTo(width)
            make.height.equalTo(2)
            make.top.equalTo(buttonArry[0].snp.bottom)
            make.bottom.equalTo(self)
            self.lineOffsetConstraint = make.left.equalTo(buttonArry[0].snp.left).constraint
        }
    }
    
    func buttonDidSelected(_ btn: UIButton) {
        selectBtnIndex = btn.tag
        //线段跟随btn移动更新约束
        self.lineOffsetConstraint?.deactivate()
        lineView.snp.makeConstraints { (make) in
            self.lineOffsetConstraint = make.left.equalTo(buttonArry[selectBtnIndex].snp.left).constraint
        }
        self.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
        
    }
}
