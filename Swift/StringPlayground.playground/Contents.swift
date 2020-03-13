//: Playground - noun: a place where people can play

import UIKit

extension String {
    
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            
            return String(self[startIndex..<endIndex])
        }
    }
    
}

var str = "Hello, pla1yground"

var anotherStr = "playground, Hel1lo"

func isTransformed(_ str1: String, _ str2: String) -> Bool {
    if str1.count != str2.count {
        return false
    }
    var dict: [Character: Int] = [:]
    str1.forEach {
        dict[$0] = (dict[$0] ?? 0) + 1
    }
    str2.forEach {
        dict[$0] = (dict[$0] ?? 0) - 1
    }
    return dict.values.filter { $0 != 0 }.count == 0
}

func isRotated(_ str1: String, _ str2: String) -> Bool {
    return (str2 + str2).contains(str1)
}

func revert(_ str: String) -> String {
    return String(str.reversed()).split(separator: " ").map { String($0.reversed()) }.reduce("") { $0 + " " + $1 }
}

func revert2(_ str: String, _ n: Int) -> String {
    let firstStr = String(str[0..<n].reversed())
    let secondStr = String(str[n..<str.count].reversed())
    return String((firstStr + secondStr).reversed())
}

isTransformed(str, anotherStr)

isRotated("1234777", "7123477")

revert("pig snake dog I'm a  student")

revert2("ABCDE", 2)
