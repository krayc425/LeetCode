class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var result = nums
        for i in 0..<nums.count {
            if i > 1 {
                result[i] += result[0..<i-1].max()!
            }
        }
        return result.max()!
    }
    
    func rob2(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        var prev = nums[0]                  // 前一个最大的
        var curr = max(nums[0], nums[1])    // 当前最大的
        for i in 2..<nums.count {           // 迭代，DP
            let temp = curr                 // 先保存之前最大的
            curr = max(curr, nums[i] + prev)// 看当前最大的，是原本最大和加了新值以后中的大者
            prev = temp                     // 更新以前
        }
        return curr
    }
}

print(Solution().rob([2,7,9,3,1]))
print(Solution().rob2([2,7,9,3,1]))
