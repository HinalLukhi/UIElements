//
//  SecondVC.swift
//  Assi6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    private let myLabel:UILabel={
        let label=UILabel()
        label.text="Enjoy the trip with \nGood Moments.."
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 3
        //label.backgroundColor = .white
        return label
        
    }()
    private let SignUPbtn:UIButton={
        let button=UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(OnSignUp), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 227/255, green: 102/255, blue: 89/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let SignInbtn:UIButton={
        let button=UIButton()
        button.setTitle("Sign IN", for: .normal)
        button.addTarget(self, action: #selector(OnSignIn), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 227/255, green: 102/255, blue: 89/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        return button
    }()
    private let pagectrl:UIPageControl={
        let  p1 = UIPageControl()
        p1.numberOfPages = 3
        p1.currentPage = 2
        p1.backgroundColor = .clear
        p1.currentPageIndicatorTintColor = .black
        p1.addTarget(self, action: #selector(onPageClick), for: .touchUpInside)
        return p1
    }()
    
    @objc func onPageClick()
    {
        if pagectrl.currentPage == 0 {
            let vc = ViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        if pagectrl.currentPage == 2 {
            let vc = SecondVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = UIColor(patternImage: UIImage(named: "bg6")!)
        view.addSubview(myLabel)
         view.addSubview(SignUPbtn)
        view.addSubview(SignInbtn)
        view.addSubview(pagectrl)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myLabel.frame = CGRect(x: 30, y: 150, width: view.width-80, height: 100)
       SignUPbtn.frame = CGRect(x: 20, y: myLabel.bottom+150, width: view.width-50, height: 50)
        SignInbtn.frame = CGRect(x: 20, y: SignUPbtn.bottom+10, width: view.width-50, height: 50)
        
         pagectrl.frame = CGRect(x: 130, y: SignInbtn.bottom+50, width: 100, height: 50)
    }
    
    
    @objc func OnSignUp(){
        let vc = SignUp()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func OnSignIn(){
        let vc1 = SignIn()
        navigationController?.pushViewController(vc1, animated: true)
    }

}
