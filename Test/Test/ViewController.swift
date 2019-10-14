//
//  ViewController.swift
//  Test
//
//  Created by Дария Мухатова on 10/10/2019.
//  Copyright © 2019 Дария Мухатова. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
   
    
    
    var todos:[Todo] = []
    
    var todo: Todo?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        downloadTodos()
    }
    
    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        
        cell.titleLabel.text = todos[indexPath.row].title
        cell.titleLabel.numberOfLines = 0
        return cell
    }

    
    

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todo = todos[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? SecondViewController
        vc?.todo = todo
    }


    func downloadTodos() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        var request = try! URLRequest(url: url, method: .get)
        
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        Alamofire.request(request).responseData(completionHandler: { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                let decoder = JSONDecoder()
                let todos = try! decoder.decode([Todo].self, from: data)
                self.todos = todos
                self.tableView.reloadData()
                
            }
        })
        
    }
    
    
    
}
