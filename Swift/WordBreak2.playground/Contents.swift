class Solution {
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var temp: [String: [String]] = [:]
        return process(s, wordDict, &temp)
    }

    func process(_ s: String, _ dict: [String], _ temp: inout [String: [String]]) -> [String] {
        if s.isEmpty {
            return [""]
        }
        if let val = temp[s] {
            return val
        }
        var res: [String] = []
        for word in dict {
            if s.hasPrefix(word) {
                let sub: [String] = process(String(s[word.endIndex...]), dict, &temp)
                for subWord in sub {
                    if subWord.isEmpty {
                        res.append(word)
                    } else {
                        res.append(word + " " + subWord)
                    }
                }
            }
        }
        temp[s] = res
        return res
    }
    
}
