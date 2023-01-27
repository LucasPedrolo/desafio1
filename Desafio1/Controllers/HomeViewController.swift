//
//  HomeViewController.swift
//  Desafio1
//
//  Created by unicred on 26/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var profile: Profile? {
        didSet {
            myLabel.text = profile?.name
        }
    }
    var pokemon2 = ["pikachu", "charmander", "squirtle"]
    var indexCount = 0
    var pokemon: [Profile] = []
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView( frame: self.view.bounds, collectionViewLayout: layout)
        return collectionView
    }()
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    lazy var myButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat", size: 0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        goText()
        lista2 { response in
            self.pokemon = response
        }
    }
    
    func lista2(preencher: @escaping ([Profile]) -> ()){
        preencher([
            Profile(id: 1, name: "Pikachu"),
            Profile(id: 2, name: "Charmander"),
            Profile(id: 3, name: "Bulbasaur"),
            Profile(id: 4, name: "Squirtle")
        ])
    }
    
    func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 100))
    }
    
    func goText(){
        view.addSubview(myButton)
        myButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 585, left: 100, bottom: 200, right:100), size: .init(width: 150, height: 100))
    }
    
    func goLabel(){
        view.addSubview(myLabel)
        myLabel.anchor(top: nil, leading: myButton.leadingAnchor, bottom: myButton.bottomAnchor, trailing: myButton.trailingAnchor, padding: .init(top: 585, left: -20, bottom: 200, right: 100), size: .init(width: 150, height: 100))
    }
    
    @objc func actionButton(sender: UIButton) {
        goLabel()
        
        sender.isSelected = !sender.isSelected
        print("button", sender.isSelected)
        
        if (indexCount == pokemon2.count) {
            indexCount = 0;
        }
        
        myLabel.text = pokemon2[indexCount]
        indexCount+=1
    }
}
