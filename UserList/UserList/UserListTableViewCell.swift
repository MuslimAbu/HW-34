//
//  UserListTableViewCell.swift
//  UserList
//
//  Created by Муслим on 14.02.2024.
//

import UIKit

final class UserListTableViewCell: UITableViewCell {
    
    static let reuseID = "UserListTableViewCell"
    
    private let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .boldSystemFont(ofSize: 20)
        return title
    }()
    
    private let subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.font = .italicSystemFont(ofSize: 18)
        return subTitle
    }()
    
    private let eMail: UILabel = {
        let eMail = UILabel()
        eMail.translatesAutoresizingMaskIntoConstraints = false
        return eMail
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setupTitleLayout()
        setupSubtitleLayout()
        setupEMailLayout()
    }
    
    private func setupTitleLayout(){
        addSubview(title)
        
        title.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
    }
    
    private func setupSubtitleLayout(){
        addSubview(subTitle)
        
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
    }
    
    private func setupEMailLayout(){
        addSubview(eMail)
        
        eMail.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 2).isActive = true
        eMail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
    }
    
    func configuere(name: String, userName: String, mail: String) {
        title.text = name
        subTitle.text = userName
        eMail.text = mail
    }
}
