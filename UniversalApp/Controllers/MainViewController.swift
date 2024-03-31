//
//  MainViewController.swift
//  UniversalApp
//
//  Created by ravindu jayasekara on 2024-03-28.
//

import UIKit

class MainViewController: UIViewController {
    
    let items: [String] = ["c1", "c2", "c3"]
    
    let uiView: UITableView = {
       let view = UITableView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    var safeArea: UILayoutGuide!
    
    @objc func updateUi(item: String){
        print("Pressed")
//        if #available(iOS 14.0, *) {
//            self.splitViewController?.show(.secondary)
//        } else {
//            // Fallback on earlier versions
//        }
//        splitViewController?.setViewController(<#T##vc: UIViewController?##UIViewController?#>, for: <#T##UISplitViewController.Column#>)
        let secondaryVC = SecondaryViewController()
        secondaryVC.itemType = item
        splitViewController?.showDetailViewController(secondaryVC, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiView.dataSource = self
        uiView.delegate = self
        uiView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
        print("Came here")
        safeArea = view.safeAreaLayoutGuide
        view.addSubview(uiView)

        let viewConstraints = [
            uiView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            uiView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            uiView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            uiView.rightAnchor.constraint(equalTo: safeArea.rightAnchor)
        ]
        NSLayoutConstraint.activate(viewConstraints)
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Pressed")
        tableView.deselectRow(at: indexPath, animated: true)
        updateUi(item: items[indexPath.row])
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        print(items[indexPath.row])
        cell.label.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
