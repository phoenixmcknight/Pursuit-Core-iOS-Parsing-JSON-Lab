//
//  EndPointOneViewController.swift
//  parsing lab
//
//  Created by Phoenix McKnight on 8/27/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit
class EndPointOneViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    var endPointOne = [EndPointOne]() {
        didSet {
            tableViewEndOne.reloadData()
        }
    }
  
    
    @IBOutlet weak var tableViewEndOne: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        loadData()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return endPointOne.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewEndOne.dequeueReusableCell(withIdentifier: "endPointOne")
        cell?.textLabel?.text = endPointOne[indexPath.row].name
        return cell!
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "JSONONE", ofType: "json") else {
            fatalError("couldn't find json file")
        }
        print(pathToJSONFile)
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let randomFromJSON = try EndPointOne.getData(from: data)
            endPointOne = randomFromJSON
        } catch {
            print(error)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyBoard = storyboard?.instantiateViewController(withIdentifier: "DetailedViewControllerEndPointOne") as? DetailedViewControllerEndPointOne {
            storyBoard.passingInfo = endPointOne[indexPath.row]
            navigationController?.pushViewController(storyBoard, animated: true)
        }
    }
    func setUp() {
       tableViewEndOne.dataSource = self
        tableViewEndOne.delegate = self
    }
}
