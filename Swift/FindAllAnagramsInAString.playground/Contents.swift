class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard !s.isEmpty && !p.isEmpty else {
            return []
        }
        guard p.count <= s.count else {
            return []
        }
        var res: [Int] = []
        let pLen = p.count
        let sArray = Array(s).map { $0.numericValue }
        var sCountArray = Array(repeating: 0, count: 26)
        let pArray = Array(p).map { $0.numericValue }
        var pCountArray = Array(repeating: 0, count: 26)
        for i in 0..<pLen {
            pCountArray[pArray[i]] += 1
        }
        for i in 0..<s.count {
            sCountArray[sArray[i]] += 1
            if i >= pLen {
                sCountArray[sArray[i - pLen]] -= 1
            }
            if sCountArray == pCountArray {
                res.append(i - pLen + 1)
            }
        }
        return res
    }
}

extension Character {
    var numericValue: Int {
        return Int(self.unicodeScalars.first!.value) - Int(Unicode.Scalar("a").value)
    }
}

Solution().findAnagrams("cbaebabacd", "abc")
Solution().findAnagrams("abab", "ab")
