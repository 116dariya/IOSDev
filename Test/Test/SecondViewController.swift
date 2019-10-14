//
//  SecondViewController.swift
//  Test
//
//  Created by Дария Мухатова on 10/10/2019.
//  Copyright © 2019 Дария Мухатова. All rights reserved.
//

import Foundation

import UIKit
import Alamofire


class SecondViewController: UIViewController {
    
    @IBOutlet weak var bodyLabel: UILabel!

    
    
    
    var todo: Todo!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadTodo(id: todo.id)
    }
    
    
    func downloadTodo(id: Int) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/" + String(id) + "/")!
        
        var request = try! URLRequest(url: url, method: .get)
        
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        Alamofire.request(request).responseData(completionHandler: { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                let decoder = JSONDecoder()
                let todo = try! decoder.decode(Todo.self, from: data)
                self.todo = todo
                self.bodyLabel.text = self.todo?.title
                self.bodyLabel.numberOfLines = 0
                self.bodyLabel.textColor = UIColor.red
                //self.bodyLabel.numberOfLines = 0
               // self.bodyLabel.textAlignment = NSTextAlignment.center
            }
        })
    }
    
}
