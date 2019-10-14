//
//  Calculator.swift
//  IOSLab1
//
//  Created by Дария Мухатова on 06/10/2019.
//  Copyright © 2019 Дария Мухатова. All rights reserved.
//

import Foundation

extension String {
    func split(separators: String) -> [String] {
        return components(separatedBy: CharacterSet(charactersIn: separators))
    }
    
}

class Calculator {
    
    var fullExp : String = ""
    
 
    func add( expr : String) -> Void {
        fullExp.append(expr)
        print("ADD: /n")
        print(fullExp)
    }
    
    func deleteAll() -> Bool {
        print("DELETE: /n")
        if fullExp.isEmpty {
            print("EMPTY")
            return false
        }
        fullExp.removeAll()
        print(fullExp)
        return true
    }
    
    func deleteLast() -> Bool {
        print("REMOVE: /n")
        if fullExp.isEmpty {
            print("EMPTY")
            return false
        }
        _ = fullExp.popLast()
        print(fullExp)
        return true
    }
    

    
    func calculate(expr : String) -> Double {
        
        let exprArr = expr.split(separators: "+-*/")
        print(exprArr)
        
        return operation(arr: exprArr,str: expr)
        
    }

    func operation(arr : [String] ,str: String) -> Double {
        
        let type : Character = find(str: str)
        
        switch type {
        case "+":
            return Double(Int(arr[0])! + Int(arr[1])!)
        case "-":
            return Double(Int(arr[0])! - Int(arr[1])!)
        case "*":
           return Double(Int(arr[0])! * Int(arr[1])!)
        case "/":
            print(Double(Int(arr[0])! / Int(arr[1])!))
            return Double(Int(arr[0])! % Int(arr[1])!)
        default:
            return 0.0
        }
 
    }
    
    func find(str: String) -> Character{
        if str.contains("+") {
            return "+"
        }
        else if str.contains("-") {
            return "-"
        }
        else if str.contains("*") {
            return "*"
        }
        else if str.contains("/") {
            return "/"
        }
        else {
            return "0"
        }
    }
}

