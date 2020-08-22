class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        guard s > 0 && !nums.isEmpty else {
            return 0
        }
        var res = Int.max
        var sum = 0
        var left = 0
        for (idx, num) in nums.enumerated() {
            sum += num
            while sum >= s {
                res = min(res, idx - left + 1)
                sum -= nums[left]
                left += 1
            }
        }
        return res == Int.max ? 0 : res
    }
}
