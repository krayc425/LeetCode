class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return Int.min
        }
        let first = nums.first!
        var tmax = first
        var tmin = first
        var res = first
        for i in 1..<nums.count {
            let num = nums[i]
            let currMax = max(tmax * num, tmin * num, num)
            let currMin = min(tmax * num, tmin * num, num)
            res = max(currMax, res)
            tmax = currMax
            tmin = currMin
        }
        return res
    }
}

Solution().maxProduct([2,3,-2,4])
