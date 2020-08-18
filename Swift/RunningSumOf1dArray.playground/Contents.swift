class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        guard let first = nums.first else {
            return []
        }
        var res: [Int] = [first]
        for i in 1..<nums.count {
            res.append(res.last! + nums[i])
        }
        return res
    }
}

Solution().runningSum([1,1,1,1,1])
