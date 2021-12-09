//
//  TripPlanVC.swift
//  Assi6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TripPlanVC: UIViewController {

    private let myLabel1:UILabel={
        let label=UILabel()
        label.text="To :"
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize : 15)
        label.textColor = UIColor.gray
        return label
        
    }()
    private let myLabel2:UILabel={
        let label=UILabel()
        label.text="From :"
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize : 15)
         label.textColor = UIColor.gray
        return label
        
    }()
    private let ToTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "To :"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.cornerRadius = 15
        return textField
    }()
    private let FromTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "From :"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.cornerRadius = 15
        return textField
    }()
    private let myLabel7:UILabel={
        let label=UILabel()
        label.text="Start Date :"
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize : 15)
        label.textColor = UIColor.gray
        return label
        
    }()
    private let startDp:UIDatePicker={
        let datepicker=UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.timeZone = TimeZone(secondsFromGMT: 0)
        datepicker.addTarget(self, action: #selector(Ondatechange), for: .valueChanged)
        return datepicker
    }()
    
    @objc func Ondatechange(){
        print(startDp.date)
    }
    private let myLabel8:UILabel={
        let label=UILabel()
        label.text="Return Date :"
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize : 15)
        label.textColor = UIColor.gray
        return label
        
    }()
   
    private let returnDp:UIDatePicker={
        let datepicker=UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.timeZone = TimeZone(secondsFromGMT: 0)
        datepicker.addTarget(self, action: #selector(Ondatechange1), for: .valueChanged)
        return datepicker
    }()
    
    @objc func Ondatechange1(){
        print(returnDp.date)
    }
    
    private let mySegmentcontrol:UISegmentedControl = {
        let segmentctrl = UISegmentedControl()
        segmentctrl.insertSegment(withTitle: "One Way", at: 0, animated: true)
        segmentctrl.insertSegment(withTitle: "Round Trip", at: 1, animated: true)
        segmentctrl.selectedSegmentIndex = 0
        segmentctrl.addTarget(self, action: #selector(handleSegmentControl), for: .valueChanged)
        return segmentctrl
    }()
    
    @objc func handleSegmentControl(){
        print(mySegmentcontrol.selectedSegmentIndex)
    }
    
    private let myLabel3:UILabel={
        let label=UILabel()
        label.text="Budget :"
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize : 15)
        label.textColor = UIColor.gray
        return label
        
    }()
    private let myLabel4:UILabel={
        let label=UILabel()
        label.text=""
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize : 15)
        label.textColor = UIColor.black
        return label
        
    }()
    
    private let myslider:UISlider = {
        let  slider = UISlider()
        slider.minimumValue =  0
        slider.maximumValue = 1000000
        slider.addTarget(self, action: #selector(handleslider), for: .valueChanged)
        return slider
    }()
    
    @objc func handleslider(){
        myLabel4.text = String(myslider.value)
    }
    private let myLabel5:UILabel={
        let label=UILabel()
        label.text="No of Person :"
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize : 15)
        label.textColor = UIColor.gray
        return label
        
    }()
    
    private let myLabel6:UILabel={
        let label=UILabel()
        label.text=""
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize : 15)
        label.textColor = UIColor.black
        return label
        
    }()
    
    private let mystepper:UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(handlestepper), for: .valueChanged)
        
        return stepper
    }()
    
    @objc func handlestepper(){
        myLabel6.text = String(mystepper.value)
    }
    
    private let MyButton:UIButton={
        let button=UIButton()
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(OnSubmit), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 227/255, green: 102/255, blue: 89/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        return button
    }()
    @objc func OnSubmit(){
        UIView.animate(withDuration: 10.0){
            self.progressview.setProgress(1.0, animated: true)
        }
    }
    private let progressview: UIProgressView = {
        let pview = UIProgressView()
        pview.setProgress(0.0, animated: true)
        return pview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myLabel1)
        view.addSubview(myLabel2)
        view.addSubview(ToTextField)
        view.addSubview(FromTextField)
         view.addSubview(myLabel7)
        view.addSubview(startDp)
        view.addSubview(myLabel8)
        view.addSubview(returnDp)
        view.addSubview(mySegmentcontrol)
         view.addSubview(myLabel3)
        view.addSubview(myLabel4)
        view.addSubview(myslider)
        view.addSubview(myLabel5)
        view.addSubview(myLabel6)
        view.addSubview(mystepper)
        view.addSubview(MyButton)
        view.addSubview(progressview)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
    }
    
    override func viewDidLayoutSubviews() {
       
        myLabel1.frame = CGRect(x: 20, y: 30, width: 100, height: 40)
        myLabel2.frame = CGRect(x: myLabel1.right+30, y: 30, width: 100, height: 40)
        ToTextField.frame = CGRect(x: 20, y: myLabel1.bottom+5, width: 130, height: 40)
        FromTextField.frame = CGRect(x: ToTextField.right+10, y: myLabel2.bottom+5, width: 130, height: 40)
        myLabel7.frame = CGRect(x: 20, y: ToTextField.bottom+10, width: 100, height: 40)
        startDp.frame = CGRect(x: 20, y: myLabel7.bottom+5, width: view.width-80, height: 50)
        myLabel8.frame = CGRect(x: 20, y: startDp.bottom+10, width: 100, height: 40)
        returnDp.frame = CGRect(x: 20, y: myLabel8.bottom+5, width: view.width-80, height: 50)
        mySegmentcontrol.frame = CGRect(x: 20, y: returnDp.bottom+10, width: view.width-80, height: 50)
        myLabel3.frame = CGRect(x: 20, y: mySegmentcontrol.bottom+5, width: 100, height: 40)
        myLabel4.frame = CGRect(x: myLabel3.right+10, y: mySegmentcontrol.bottom+5, width: 100, height: 40)
        myslider.frame = CGRect(x: 20, y: myLabel3.bottom+5, width: view.width-80, height: 50)
        myLabel5.frame = CGRect(x: 20, y: myslider.bottom+5, width: 120, height: 40)
        myLabel6.frame = CGRect(x: myLabel5.right, y: myslider.bottom+5, width: 50, height: 40)
        mystepper.frame = CGRect(x: myLabel6.right, y: myslider.bottom+8, width: 100, height: 40)
        MyButton.frame = CGRect(x: 20, y: myLabel6.bottom+10, width: view.width-80, height: 50)
         progressview.frame = CGRect(x: 20, y: MyButton.bottom+15, width: view.width-40, height: 100)
    }
    
}
