//
//  ViewController.swift
//  tableview
//
//  Created by Cumulations Technologies on 15/02/22.
//

import UIKit
struct Section {
    let letter : String
    let names : [String]
}
var arr:[String]=["Harry","Ross",
                 "Bruce","Cook",
                 "Carolyn","Morgan",
                 "Albert","Walker",
                 "Randy","Reed",
                 "Larry","Barnes",
                 "Lois","Wilson",
                 "Jesse","Campbell",
                 "Ernest","Rogers",
                 "Theresa","Patterson",
                 "Henry","Simmons",
                 "Michelle","Perry",
                 "Frank","Butler",
                 "Shirley"].sorted()
var sections = [Section]()
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let groupedDictionary = Dictionary(grouping: arr, by: {String($0.prefix(1))})
            let keys = groupedDictionary.keys.sorted()

            sections = keys.map{ Section(letter: $0, names: groupedDictionary[$0]!.sorted()) }
            self.tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let section = sections[indexPath.section]
        let username = section.names[indexPath.row]
        cell.textLabel?.text = username
        return cell
    }

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].names.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }


    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].letter
    }


}

