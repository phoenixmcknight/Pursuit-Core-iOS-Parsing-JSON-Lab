//
//  EndPointThreeViewController.swift
//  parsing lab
//
//  Created by Phoenix McKnight on 8/27/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit



class EndPointThreeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var endPointThree = [EndPointThree]()
    
    
    @IBOutlet weak var tableViewEndThree: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        loadData()
        tableViewEndThree.reloadData()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return endPointThree.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableViewEndThree.dequeueReusableCell(withIdentifier: "endPointThree")
        cell?.textLabel?.text = endPointThree[indexPath.row].name.getName()
        cell?.detailTextLabel?.text = endPointThree[indexPath.row].email
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyBoard = storyboard?.instantiateViewController(withIdentifier: "DetailedViewControllerEndpointThree") as? DetailedViewControllerEndpointThree {
            storyBoard.passingInfo = endPointThree[indexPath.row]
            navigationController?.pushViewController(storyBoard, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "JSONTHREE", ofType: "json") else {
            fatalError("couldn't find json file")
        }
        print(pathToJSONFile)
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let randomFromJSON = try EndPointThree.getData(from: data)
            endPointThree = randomFromJSON
        } catch {
            print(error)
        }
    }
    

    func setUp() {
        tableViewEndThree.dataSource = self
        tableViewEndThree.delegate = self
    }
    
}
