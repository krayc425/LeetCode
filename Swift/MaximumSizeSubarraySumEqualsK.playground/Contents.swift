class Solution {
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        var prefix: [Int: Int] = [0: -1]
        var sum = 0
        var res = 0
        for (i, num) in nums.enumerated() {
            sum += num
            if let idx = prefix[sum - k] {
                res = max(res, i - idx)
            }
            if prefix[sum] == nil {
                prefix[sum] = i
            }
        }
        return res
    }
}

Solution().maxSubArrayLen([1, -1, 5, -2, 3], 3)
