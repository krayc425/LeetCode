class Solution {
    func jump(_ nums: [Int]) -> Int {
        var last = 0    // 已经可以达到的最大距离
        var curr = 0    // 当前可以到达的最大距离
        var res = 0
        for (idx, val) in nums.enumerated() {
            if idx > last {
                res += 1
                last = curr
            }
            curr = max(curr, idx + val)
        }
        return res
    }
}
