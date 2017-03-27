//
//  ViewController.swift
//  ElSegmentDemo
//
//  Created by Lyons Eric on 2017/3/24.
//  Copyright © 2017年 Lyons Eric. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let segmentView = ELSegmentView(titles: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(segmentView)
        segmentView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

