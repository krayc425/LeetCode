class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var cur = 0
        var max = Int.min
        for i in 0..<nums.count {
            cur += nums[i]
            if cur > max {
                max = cur
            }
            if cur < 0 {
                cur = 0
            }
        }
        return max
    }
}


Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
