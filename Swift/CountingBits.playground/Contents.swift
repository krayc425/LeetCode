class Solution {
    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else {
            return [0]
        }
        var res: [Int] = Array(repeating: 0, count: num + 1)
        for i in 1...num {
            res[i] = res[i >> 1] + i & 1
        }
        return res
    }
}

Solution().countBits(0)
Solution().countBits(605)
