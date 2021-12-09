//
//  ViewController.swift
//  Assi6
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let nextBtn:UIButton={
        let button=UIButton()
        button.setTitle("Next   \u{00BB}", for: .normal)
        button.addTarget(self, action: #selector(OnbtnClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 227/255, green: 102/255, blue: 89/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let myLabel:UILabel={
        let label=UILabel()
        label.text="Discover \n world with us .."
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.numberOfLines = 2
        //label.backgroundColor = .white
        return label
        
    }()
    
    private let pagectrl:UIPageControl={
        let  p1 = UIPageControl()
        p1.numberOfPages = 3
        p1.currentPage = 0
        p1.backgroundColor = .clear
        p1.currentPageIndicatorTintColor = .white
        p1.addTarget(self, action: #selector(onPageClick), for: .touchUpInside)
        return p1
    }()
    
    @objc func onPageClick()
    {
        if pagectrl.currentPage == 1 {
            let vc = FirstVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.setNavigationBarHidden(true, animated: true)
       view.addSubview(nextBtn)
        view.addSubview(myLabel)
        view.addSubview(pagectrl)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg5")!)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myLabel.frame = CGRect(x: 20, y: 400, width: 250, height: 100)
       nextBtn.frame = CGRect(x: 20, y: myLabel.bottom + 10, width: 200, height: 50)
        pagectrl.frame = CGRect(x: 130, y: nextBtn.bottom+20, width: 100, height: 50)
        
    }
    
    @objc func  OnbtnClick()
    {
        let vc = FirstVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

