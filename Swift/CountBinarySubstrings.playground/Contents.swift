class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        var groups: [Int] = []
        var temp = 0
        var prev: Character = " "
        for char in s {
            if prev == " " {
                prev = char
                temp += 1
            } else {
                if char == prev {
                    temp += 1
                } else {
                    groups.append(temp)
                    temp = 1
                    prev = char
                }
            }
        }
        groups.append(temp)
        var res = 0
        for i in 1..<groups.count {
            res += min(groups[i - 1], groups[i])
        }
        return res
    }
}

Solution().countBinarySubstrings("00110011")
Solution().countBinarySubstrings("001110000111110")
