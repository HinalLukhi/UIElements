//
//  SignIn.swift
//  Assi6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class SignIn: UIViewController {

    private let myactivityIndicatorView:UIActivityIndicatorView = {
        let aiview = UIActivityIndicatorView()
        aiview.color = .blue
        aiview.hidesWhenStopped = true
        return aiview
    }()
    
    private let myLabel:UILabel={
        let label=UILabel()
        label.text="Travello"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.numberOfLines = 2
        //label.backgroundColor = .white
        return label
        
    }()
    private let myView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    private let unameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter UserName"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.cornerRadius = 15
        return textField
    }()
    private let pwdTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.isSecureTextEntry = true
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    private let LogInButton:UIButton={
        let button=UIButton()
        button.setTitle("LogIn", for: .normal)
        button.addTarget(self, action: #selector(OnLoginClicked), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 227/255, green: 102/255, blue: 89/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         view.backgroundColor = UIColor(patternImage: UIImage(named: "m1")!)
        view.addSubview(myLabel)
        view.addSubview(myView)
        myView.addSubview(unameTextField)
        myView.addSubview(pwdTextField)
        myView.addSubview(myactivityIndicatorView)
        myView.addSubview(LogInButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myLabel.frame = CGRect(x: 30, y: 150, width: view.width-80, height: 50)
        myView.frame = CGRect(x: 0, y: 300, width: view.width, height: 300)
        unameTextField.frame = CGRect(x: 40, y: 30, width: view.width-80, height: 40)
        pwdTextField.frame = CGRect(x: 40, y: unameTextField.bottom+30, width: view.width-80, height: 40)
        LogInButton.frame = CGRect(x: 40, y: pwdTextField.bottom+30, width: view.width-80, height: 40)
        myactivityIndicatorView.frame = CGRect(x: 110, y: LogInButton.bottom+10, width: 170, height: 70)
    }
    
    @objc  private func OnLoginClicked()
    {
        print(myactivityIndicatorView.isAnimating)
        DispatchQueue.main.async {
            self.myactivityIndicatorView.isHidden = !self.myactivityIndicatorView.isHidden
            self.myactivityIndicatorView.isHidden ? self.myactivityIndicatorView.stopAnimating() : self.myactivityIndicatorView.startAnimating()
            if !self.myactivityIndicatorView.isHidden {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
                    self.myactivityIndicatorView.stopAnimating()
                    self.myactivityIndicatorView.isHidden = true
                    let vc = HomeVC()
                    self.navigationController?.pushViewController(vc, animated: true)

                }
            }
            
        }
        
        
    }
    


}
