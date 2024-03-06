//
//  UserInfoViewController.swift
//  UserList
//
//  Created by Муслим on 15.02.2024.
//

import UIKit

final class UserInfoViewController: UIViewController {
    
    private let nameTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .boldSystemFont(ofSize: 40)
        return title
    }()
    
    private let subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.font = .italicSystemFont(ofSize: 36)
        return subTitle
    }()
    
    private let eMail: UILabel = {
        let eMail = UILabel()
        eMail.translatesAutoresizingMaskIntoConstraints = false
        eMail.font = .systemFont(ofSize: 36)
        return eMail
    }()
    
    private let phone: UILabel = {
        let phone = UILabel()
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.font = .systemFont(ofSize: 32)
        return phone
    }()
    
    private let website: UILabel = {
        let website = UILabel()
        website.translatesAutoresizingMaskIntoConstraints = false
        website.font = .italicSystemFont(ofSize: 32)
        return website
    }()
    
    init(name: String, username: String, mail: String, phon: String, site: String){
        nameTitle.text = name
        subTitle.text = username
        eMail.text = mail
        phone.text = phon
        website.text = site
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNameTitleLayout()
        setupSubtitleLayout()
        setupEMailLayout()
        setupPhoneLayout()
        setupWebsiteLayout()
    }
    
    func setupNameTitleLayout(){
        view.addSubview(nameTitle)
            
        nameTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4).isActive = true
        nameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
    }
        
    func setupSubtitleLayout(){
        view.addSubview(subTitle)
            
        subTitle.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 4).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
    }
        
    func setupEMailLayout(){
        view.addSubview(eMail)
            
        eMail.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 4).isActive = true
        eMail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
    }
        
    func setupPhoneLayout(){
        view.addSubview(phone)
            
        phone.topAnchor.constraint(equalTo: eMail.bottomAnchor, constant: 4).isActive = true
        phone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
    }
        
    func setupWebsiteLayout(){
        view.addSubview(website)
            
        website.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 4).isActive = true
        website.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
    }
}
