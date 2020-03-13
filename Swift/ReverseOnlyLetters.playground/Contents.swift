class Solution {
    func reverseOnlyLetters(_ S: String) -> String {
        var res: String = ""
        var tmp: [Character] = []
        var tmp2: [(Character, Int)] = []
        var count = 0
        for c in S {
            if c.isLetter {
                tmp.append(c)
            } else {
                tmp2.append((c, count))
            }
            count += 1
        }
        print(tmp2)
        print(tmp)
        count = 0
        while !tmp.isEmpty {
            while let first = tmp2.first, first.1 == count {
                res.append(tmp2.removeFirst().0)
                count += 1
            }
            count += 1
            res.append(tmp.removeLast())
        }
        while !tmp2.isEmpty {
            res.append(tmp2.removeFirst().0)
        }
        return res
    }
}

Solution().reverseOnlyLetters("z<*zj")
