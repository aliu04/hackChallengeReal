//
//  ProfileViewController.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-28.
//

import UIKit

class ProfileViewController: UIViewController, EditDelegate {
    func saveName(name: String) {
        modelName.text = name
    }
    
    func saveAge(ageLabel: String) {
        modelAgeNumber.text = ageLabel
    }
    
    func saveBio(bio: String) {
        modelDesc.text = bio
    }
    
    
    func save() {
        print()
    }
    
    var homeButton = UIButton()
    var notifButton = UIButton()
    var profileButton = UIButton()
    
    var editButton = UIButton()
    
    let bgGreen = UIColor(red: 0.867, green: 0.898, blue: 0.714, alpha: 1.0)
    let lighterGreen = UIColor(red: 0.914, green: 0.929, blue: 0.788, alpha: 1.0)
    let darkGreen = UIColor(red: 0.157, green: 0.212, blue: 0.094, alpha: 1.0)
    let borderColor = CGColor(red: 0.678, green: 0.757, blue: 0.502, alpha: 1.0)
    
    var modelDescriptionBox = UIView(frame: .zero)

    
    var modelPic = UIImageView()
    var modelDesc = UITextView()
    var modelName = UILabel()
    var modelAgeLabel = UILabel()
    var modelAgeNumber = UILabel()

    
    var modelDog = Dog(id: 4, age: 3, bio: "hasdlfkjasdf", name: "Winter", images: [Image(url: "", created_at: "")])


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgGreen
        title = "Profile"
        self.navigationItem.hidesBackButton = true
        
        homeButton.contentMode = .scaleAspectFill
        homeButton.setImage(UIImage(named: "home"), for: .normal)
        homeButton.backgroundColor = lighterGreen
        homeButton.layer.borderWidth = 1
        homeButton.layer.borderColor = borderColor
        homeButton.addTarget(self, action: #selector(popDetailedView), for:.touchUpInside)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeButton)
        
        profileButton.contentMode = .scaleAspectFill
        profileButton.setImage(UIImage(named: "profile"), for: .normal)
        profileButton.backgroundColor = lighterGreen
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = borderColor
        profileButton.addTarget(self, action: #selector(practice), for:.touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)
        
        notifButton.contentMode = .scaleAspectFill
        notifButton.setImage(UIImage(named: "notifications"), for: .normal)
        notifButton.backgroundColor = lighterGreen
        notifButton.layer.borderWidth = 1
        notifButton.layer.borderColor = borderColor
        notifButton.addTarget(self, action: #selector(openNotifs), for:.touchUpInside)
        notifButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notifButton)
        
        homeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp_bottomMargin)
            make.left.equalTo(view.snp.left)
            make.height.equalTo(60)
            make.width.equalTo(view.snp.width).multipliedBy(0.333)
        }
        profileButton.snp.makeConstraints { (make) in
            make.top.equalTo(homeButton.snp.top)
            make.bottom.equalTo(homeButton.snp.bottom)
            make.left.equalTo(homeButton.snp.right)
            make.width.equalTo(view.snp.width).multipliedBy(0.333)
        }
        notifButton.snp.makeConstraints { (make) in
            make.top.equalTo(homeButton.snp.top)
            make.bottom.equalTo(homeButton.snp.bottom)
            make.left.equalTo(profileButton.snp.right)
            make.width.equalTo(view.snp.width).multipliedBy(0.333)
        }
    
        modelPic.image = UIImage(named: modelDog.images[0].url)
        modelPic.contentMode = .scaleAspectFit
        modelPic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modelPic)


        modelDescriptionBox.backgroundColor = .white
        modelDescriptionBox.layer.cornerRadius = 15
        view.addSubview(modelDescriptionBox)

        
        modelName.text = modelDog.name
        modelName.font = .systemFont(ofSize: 25, weight: .bold)
        modelName.textColor = .black
        modelName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modelName)
        
        modelDesc.text = modelDog.bio
        modelDesc.textColor = .black
        modelDesc.textAlignment = .left
        //dogDesc.layer.cornerRadius = 15
        modelDesc.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modelDesc)
        
        modelAgeLabel.text = "Age: "
        modelAgeLabel.font = .systemFont(ofSize: 20, weight: .bold)
        modelAgeLabel.textColor = .black
        modelAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modelAgeLabel)
        
        modelAgeNumber.text = String(modelDog.age)
        modelAgeNumber.font = .systemFont(ofSize: 18, weight: .bold)
        modelAgeNumber.textColor = .black
        modelAgeNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modelAgeNumber)
        
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.black, for: .normal)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.addTarget(self, action: #selector(openEditPage), for: .touchUpInside)
        view.addSubview(editButton)
        
        
        let padding = 15
        
        modelPic.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp_topMargin).offset(padding)
            make.left.equalTo(view.snp_leftMargin)
            make.right.equalTo(view.snp_rightMargin)
            make.height.equalTo(200)
        }
        modelDescriptionBox.snp.makeConstraints { (make) in
            make.bottom.equalTo(homeButton.snp.top).offset(-padding)
            make.left.equalTo(view.snp_leftMargin).offset(padding)
            make.right.equalTo(view.snp_rightMargin).offset(-padding)
            make.top.equalTo(modelPic.snp_bottomMargin).offset(20)
        }
        modelName.snp.makeConstraints { (make) in
            make.top.equalTo(modelDescriptionBox.snp_topMargin).offset(10)
            make.leftMargin.equalTo(modelDescriptionBox.snp_leftMargin).offset(padding)
        }
        modelAgeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(modelName.snp_bottomMargin).offset(padding)
            make.leftMargin.equalTo(modelName.snp_leftMargin)
        }
        modelAgeNumber.snp.makeConstraints { (make) in
            make.centerY.equalTo(modelAgeLabel.snp.centerY)
            make.left.equalTo(modelAgeLabel.snp.right).offset(5)
        }
        modelDesc.snp.makeConstraints { (make) in
            make.bottom.equalTo(modelDescriptionBox.snp_bottomMargin).offset(-10)
            make.left.equalTo(modelAgeLabel.snp.left)
            make.right.equalTo(view.snp_rightMargin).offset(-padding)
            make.top.equalTo(modelAgeLabel.snp_bottomMargin).offset(20)
        }
        
        editButton.snp.makeConstraints { (make) in
            make.top.equalTo(modelName.snp.top)
            make.bottom.equalTo(modelName.snp.bottom)
            make.right.equalTo(modelDescriptionBox.snp.rightMargin).offset(-padding)
        }
        
    }

    @objc func popDetailedView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func openEditPage() {
        present(EditViewController(dog: modelDog, delegate: self), animated: true)
    }

    @objc func openNotifs() {
        navigationController?.pushViewController(NotificationViewController(), animated: true)
    }
    
    @objc func practice() {
        var modelImage = Image(url: "https://hack-challenge-bucket.s3.us-east-1.amazonaws.com/Y3ZXT4MV7FDAPDAB.jpg", created_at: "2022-12-02 03:14:05.279571")
        
        NetworkManager.createDog(age: 5, bio: "likes to bark", name: "asdfasdf", images: []) { dog in
            self.modelDog = dog
        }
    }
}

