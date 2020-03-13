class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var added: [Character] = []
        var dict: [Character: Character] = [:]
        let sarr = Array(s)
        let tarr = Array(t)
        for i in 0..<sarr.count {
            let schar = sarr[i]
            let tchar = tarr[i]
            if let val = dict[schar] {
                if val != tchar {
                    return false
                }
            } else {
                if !added.contains(tchar) {
                    added.append(tchar)
                    dict[schar] = tchar
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    func isIsomorphic_followup(_ words: [String]) -> [[String]] {
        var map: [[Int]: Set<String>] = [:]
        for word in words {
            var tmp: Int = 0
            var innerMap: [Character: Int] = [:]
            var innerArr: [Int] = []
            for char in word {
                if innerMap[char] == nil {
                    innerMap[char] = tmp
                    tmp += 1
                }
                innerArr.append(innerMap[char]!)
            }
            map[innerArr, default: Set<String>()].insert(word)
        }
        return map.values.map { Array($0) }
    }
}

Solution().isIsomorphic("paper", "title")
Solution().isIsomorphic_followup(["fff","abc","foo","haa","www","vvv","add","ggg","vgm"])
