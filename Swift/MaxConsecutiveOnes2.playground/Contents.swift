class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var res = 0
        var curr = 0
        var zero = -1
        var idx = 0
        while idx < nums.count {
            if nums[idx] == 1 {
                curr += 1
            } else {
                res = max(res, curr)
                curr = idx - zero
                zero = idx
            }
            idx += 1
        }
        return max(res, curr)
    }
}

Solution().findMaxConsecutiveOnes([1,0,1,1,0])
