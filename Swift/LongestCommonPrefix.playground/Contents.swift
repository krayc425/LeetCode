class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else {
            return ""
        }
        if strs.count == 1 {
            return strs.first!
        }
        let minLength = strs.map { $0.count }.min()!
        var i = 0
        var res = ""
        while i < minLength {
            let c = Array(strs[0])[i]
            var allSame = true
            for j in 1..<strs.count {
                if Array(strs[j])[i] != c {
                    allSame = false
                    break
                }
            }
            if allSame {
                res.append(c)
                i += 1
            } else {
                break
            }
        }
        return res
    }
}
