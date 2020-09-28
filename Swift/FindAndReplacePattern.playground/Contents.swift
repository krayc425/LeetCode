class Solution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        let patternCode = generatePattern(pattern)
        return words.filter { generatePattern($0) == patternCode }
    }
    
    func generatePattern(_ s: String) -> [Int] {
        var code: [Int] = []
        var dict: [Character: Int] = [:]
        var codeNum = 1
        for char in s {
            if let value = dict[char] {
                code.append(value)
            } else {
                dict[char] = codeNum
                code.append(dict[char]!)
                codeNum += 1
            }
        }
        return code
    }
}

Solution().findAndReplacePattern(["abc","deq","mee","aqq","dkd","ccc"], "abb")
