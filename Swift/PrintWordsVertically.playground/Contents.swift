import Foundation

class Solution {
    func printVertically(_ s: String) -> [String] {
        let words: [[Character]] = s.split(separator: " ").map { Array($0) }
        let maxLength = words.map { $0.count }.max()!
        var res: [String] = []
        for i in 0..<maxLength {
            var temp = ""
            var lastChar = 0
            for word in words {
                if i >= word.count {
                    temp.append(" ")
                } else {
                    temp.append(word[i])
                    lastChar = temp.count - 1
                }
            }
            res.append(String(temp.prefix(through: temp.index(temp.startIndex, offsetBy: lastChar))))
        }
        return res
    }
}

Solution().printVertically("how are you")
Solution().printVertically("TO BE OR NOT TO BE")
