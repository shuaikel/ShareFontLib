//
//  ViewController.swift
//  PPLSShareFont
//
//  Created by hushuaike on 05/12/2025.
//  Copyright (c) 2025 hushuaike. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var systemTitleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.systemPink
        lab.text = "123456789"
        lab.font = UIFont.systemFont(ofSize: 18)
        return lab
    }()
    
    private lazy var titleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.systemPink
        lab.text = "123456789"
        lab.font = UIFont(name: "AlimamaFangYuanTiVF-Thin", size: 18)
        return lab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        view.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(244)
            make.height.equalTo(44)
        }
        
        view.addSubview(systemTitleLab)
        systemTitleLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(244)
            make.height.equalTo(44)
            make.bottom.equalTo(titleLab.snp.top).offset(-20)
        }
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

