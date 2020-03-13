class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard s.count > 0 else {
            return true
        }
        var res = [true] + Array(repeating: false, count: s.count)
        let set = Set(wordDict)
        let arr = Array(s)
        for i in 1...s.count {
            for j in 0..<i {
                if res[j] && set.contains(String(Array(arr[j..<i]))) {
                    res[i] = true
                    break
                }
            }
        }
        return res[s.count]
    }
    
    func wordBreak_bt(_ s: String, _ wordDict: [String]) -> Bool {
        guard s.count > 0 else {
            return true
        }
        var res: Bool = false
        process(&res, s, wordDict)
        return res
    }
    
    func process(_ res: inout Bool, _ s: String, _ wordDict: [String]) {
        if res {
            return
        }
        for str in wordDict where str.count <= s.count {
            if s.hasPrefix(str) {
                if s == str {
                    res = true
                    return
                } else {
                    process(&res, substring(s, from: str.count), wordDict)
                }
            }
        }
    }
    
    func substring(_ s: String, from index: Int) -> String {
        if s.count > index {
            let startIndex = s.index(s.startIndex, offsetBy: index)
            let subString = s[startIndex...]
            return String(subString)
        } else {
            return s
        }
    }
}

Solution().wordBreak("carss", ["car","ca","rs"])
