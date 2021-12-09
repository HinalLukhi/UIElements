//
//  SignUp.swift
//  Assi6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class SignUp: UIViewController {
    
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
    private let ImagePicker : UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.allowsEditing = false
        return ip
    }()
    private let imgpickbtn:UIButton={
        let button=UIButton()
        button.setTitle("\u{002B} Select Picture", for: .normal)
        button.addTarget(self, action: #selector(OnPickClick), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    @objc func OnPickClick(){
        ImagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.ImagePicker,animated: true)
        }
    }
    private let imgview:UIImageView={
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.image = UIImage(named: "m1")
        img.layer.cornerRadius = 36
        return img
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
    private let emailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Email"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.cornerRadius = 15
        return textField
    }()
    private let mobileTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Mobile No"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.cornerRadius = 15
        return textField
    }()
    private let SignUpbtn:UIButton={
        let button=UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(OnSignUpClicked), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 227/255, green: 102/255, blue: 89/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "m1")!)
        ImagePicker.delegate = self
        view.addSubview(myLabel)
        view.addSubview(myView)
        myView.addSubview(imgpickbtn)
        myView.addSubview(imgview)
        myView.addSubview(unameTextField)
        myView.addSubview(pwdTextField)
        myView.addSubview(emailTextField)
        myView.addSubview(mobileTextField)
        myView.addSubview(SignUpbtn)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myLabel.frame = CGRect(x: 30, y: 100, width: view.width-80, height: 50)
        myView.frame = CGRect(x: 0, y:myLabel.bottom+50, width: view.width, height: 500)
        imgview.frame = CGRect(x: 130, y: 30, width: 100, height: 100)
        imgpickbtn.frame = CGRect(x: 90, y: imgview.bottom+5, width: 200, height: 30)
        unameTextField.frame = CGRect(x: 40, y: imgpickbtn.bottom+20, width: view.width-80, height: 40)
        pwdTextField.frame = CGRect(x: 40, y: unameTextField.bottom+10, width: view.width-80, height: 40)
        emailTextField.frame = CGRect(x: 40, y: pwdTextField.bottom+10, width: view.width-80, height: 40)
        mobileTextField.frame = CGRect(x: 40, y: emailTextField.bottom+10,width: view.width-80, height: 40)
        SignUpbtn.frame = CGRect(x: 40, y: mobileTextField.bottom+20, width: view.width-80, height: 50)
    }
    
    @objc  private func OnSignUpClicked()
    {
        
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
   
}
extension SignUp : UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            imgview.image = selectedImage
        }
        picker.dismiss(animated: true)
    }
}
