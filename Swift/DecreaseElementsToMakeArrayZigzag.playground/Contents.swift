class Solution {
    func movesToMakeZigzag(_ nums: [Int]) -> Int {
        var res = [0, 0]
        let count = nums.count
        for i in 0..<count {
            let left = i > 0 ? nums[i - 1] : Int.max
            let right = i < count - 1 ? nums[i + 1] : Int.max
            res[i % 2] += max(0, nums[i] - min(left, right) + 1)
        }
        return res.min()!
    }
}

Solution().movesToMakeZigzag([9,6,1,6,2])
