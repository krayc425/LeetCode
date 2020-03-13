class Solution {
    func integerBreak(_ n: Int) -> Int {
        guard (2...58).contains(n) else {
            return 0
        }
        var res = Array(repeating: 0, count: n + 1)
        for i in 2...n {
            for j in 1..<i {
                res[i] = max(res[i], j * max(res[i - j], i - j))
            }
        }
        return res.last!
    }
}

for i in 2...58 {
    print(Solution().integerBreak(i))
}
