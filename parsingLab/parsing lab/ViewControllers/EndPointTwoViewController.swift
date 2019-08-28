//
//  ViewController.swift
//  parsing lab
//
//  Created by Phoenix McKnight on 8/27/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit

class EndPointTwoViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    var endPointTwo = [EndPointTwo]() {
        didSet {
            tableViewEndTwo.reloadData()
        }
    }
    
    @IBOutlet weak var tableViewEndTwo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
         loadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return endPointTwo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewEndTwo.dequeueReusableCell(withIdentifier: "endPointTwo")
        cell?.textLabel?.text = endPointTwo[indexPath.row].name.value
        cell?.backgroundColor = endPointTwo[indexPath.row].rgb.fraction.returnUIColor()
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "JSTWO", ofType: "json") else {
            fatalError("couldn't find json file")
        }
        print(pathToJSONFile)
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let randomFromJSON = try Colors.getData(from: data)
            endPointTwo = randomFromJSON
        } catch {
            print(error)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyBoard = storyboard?.instantiateViewController(withIdentifier: "DetailedViewControllerEndPointTwo") as? DetailedViewControllerEndPointTwo {
            storyBoard.passingInfo = endPointTwo[indexPath.row]
            navigationController?.pushViewController(storyBoard, animated: true)
        }
    }

    func setUp() {
        tableViewEndTwo.dataSource = self
        tableViewEndTwo.delegate = self
    }

}

