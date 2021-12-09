//
//  HomeVC.swift
//  Assi6
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    private let tblView = UITableView()
    
    public var cityArray = ["Berlin","Moscow","Rio","Tokyo","Denver","Oslo","Nairobi","Helsinki"]
    
    private let myLabel:UILabel={
        let label=UILabel()
        label.text="Home"
        label.textAlignment = .center
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 3
        //label.backgroundColor = .white
        return label
        
    }()
    
    private let toolbar:UIToolbar = {
        let toolbar = UIToolbar()
        
       let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let search = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handlesearch))
       
        toolbar.items = [space,search]

        return toolbar
    }()
    @objc func handlesearch(){
        print("Search Called ")
       
    }
    private let MyButton:UIButton={
        let button=UIButton()
        button.setTitle("Plan Your Trip \u{00BB}", for: .normal)
        button.addTarget(self, action: #selector(OnbtnClick), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 227/255, green: 102/255, blue: 89/255, alpha: 1.0)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .white
        view.addSubview(toolbar)
        toolbar.addSubview(myLabel)
        view.addSubview(MyButton)
        view.addSubview(tblView)
        setuptableview()
    }
    
    
  
    
    override func viewDidLayoutSubviews() {
        let toolbarHGeight:CGFloat = view.safeAreaInsets.top + 40.0
        toolbar.frame = CGRect(x: 0, y: 5, width: view.frame.size.width, height:toolbarHGeight)
        MyButton.frame = CGRect(x: 10, y: toolbar.bottom+10, width: 200, height: 100)
        
        tblView.frame = CGRect(x: 0, y: MyButton.bottom+10, width: view.width, height: view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)
        myLabel.frame = CGRect(x: 130, y: 10, width: 100, height: 40)
    }
    
    @objc func OnbtnClick()
    {
        let vc = TripPlanVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension HomeVC : UITableViewDelegate,UITableViewDataSource
{
    private func setuptableview()
    {
        tblView.dataSource = self
        tblView.delegate = self
        tblView.register(CityCell.self, forCellReuseIdentifier: "citycell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citycell", for: indexPath) as! CityCell
        cell.setupCityCellWith(title: cityArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
