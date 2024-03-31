//
//  SecondaryViewController.swift
//  UniversalApp
//
//  Created by ravindu jayasekara on 2024-03-28.
//

import UIKit

class SecondaryViewController: UIViewController {

    let childItems: [String] = ["Comeon", "Ravubdy", "Yes baby"]
    let childItems1: [String] = ["Comeon", "Ravubdy", "Yes baby", "5"]
    var itemArray: [String] = [String]()
    var itemType: String?
    
    let uiView: UITableView = {
       let view = UITableView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Came here")
        uiView.delegate = self
        uiView.dataSource = self
        uiView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
        safeArea = view.safeAreaLayoutGuide
        print("Reloading \(itemType)")
        view.addSubview(uiView)
        let viewConstraints = [
            uiView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            uiView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            uiView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            uiView.rightAnchor.constraint(equalTo: safeArea.rightAnchor)
        ]
        NSLayoutConstraint.activate(viewConstraints)
        if let itemT = itemType {
            switch itemT {
            case "c1":
                itemArray = childItems
            case "c2":
                itemArray = childItems1
            default:
                itemArray = []
            }
        }
        print(itemArray)
    }
}

extension SecondaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Pressed")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SecondaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        cell.label.text = itemArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
}
