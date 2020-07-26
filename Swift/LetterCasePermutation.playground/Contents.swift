class Solution {

    func letterCasePermutation(_ S: String) -> [String] {
        var res: [String] = []
        helper(res: &res, string: S)
        return res
    }
    
    func helper(res: inout [String], string: String) {
        guard let first = string.first else {
            return
        }
        let oldRes = Array(res)
        if first.isNumber {
            if oldRes.isEmpty {
                res.append(String(first))
            } else {
                res.removeAll()
                for s in oldRes {
                    res.append(s + String(first))
                }
            }
        } else {
            if oldRes.isEmpty {
                res.append(first.uppercased())
                res.append(first.lowercased())
            } else {
                res.removeAll()
                for s in oldRes {
                    if "z" >= first && first >= "a" {
                        res.append(s + String(first.uppercased()))
                    } else {
                        res.append(s + String(first.lowercased()))
                    }
                    res.append(s + String(first))
                }
            }
        }
        helper(res: &res, string: String(string.dropFirst()))
    }

}

Solution().letterCasePermutation("1bA3sa")
