class Solution {

    func partition(_ s: String) -> [[String]] {
        var result: [[String]] = []
        var temp: [String] = []
        helper(&result,
               temp: &temp,
               start: 0,
               end: s.count,
               string: s)
        return result
    }
    
    func helper(_ res: inout [[String]],
                temp: inout [String],
                start: Int, end: Int,
                string: String) {
        guard start <= end else {
            return
        }
        guard !string.isEmpty else {
            if !temp.isEmpty {
                res.append(temp)
            }
            return
        }
        for i in 0..<string.count {
            let firstSubString = string.subString(end: i)
            let secondSubString = string.subString(start: i + 1)
            if isPalindrome(firstSubString) {
                temp.append(firstSubString)
                helper(&res,
                       temp: &temp,
                       start: i + 1,
                       end: end,
                       string: secondSubString)
                temp.removeLast()
            }
        }
    }
    
    func isPalindrome(_ s: String) -> Bool {
        return String(s.reversed()) == s
    }

}

extension String {
    
    func subString(start: Int) -> String {
        return String(self[index(startIndex, offsetBy: start)...])
    }
    
    func subString(end: Int) -> String {
        return String(self[startIndex...index(startIndex, offsetBy: end)])
    }
    
    func subString(start: Int, end: Int) -> String {
        return String(self[index(startIndex, offsetBy: start)..<index(startIndex, offsetBy: end)])
    }
    
}

Solution().partition("abaaabbb")
