//
//  MainViewController.swift
//  UniversalApp
//
//  Created by ravindu jayasekara on 2024-03-28.
//

import UIKit

class MainViewController: UIViewController {
    var uiView:UIView!
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Came here")
        safeArea = view.safeAreaLayoutGuide
        
        //UIView
        uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints=false
        uiView.backgroundColor = .red
        let uiViewConstraints = [
            uiView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            uiView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0),
            uiView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 0),
            uiView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(uiViewConstraints)
        
//        let label = UILabel()
//        label.text = "Ravindu"
//        label.translatesAutoresizingMaskIntoConstraints=false
//        
//        let labelConstraints = [
//            label.topAnchor.constraint(equalTo: uiView.topAnchor),
//            label.bottomAnchor.constraint(equalTo: uiView.bottomAnchor),
//            label.leftAnchor.constraint(equalTo: uiView.leftAnchor),
//            label.rightAnchor.constraint(equalTo: uiView.rightAnchor)
//        ]
//        NSLayoutConstraint.activate(labelConstraints)
//        uiView.addSubview(label)
        view.addSubview(uiView)
        // Do any additional setup after loading the view.
    }
    
}
