class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        var visited: [[Int]: Int] = [:]
        return helper(nums, &visited, 0, 0, S)
    }
    
    func helper(_ nums: [Int], _ visited: inout [[Int]: Int], _ start: Int, _ sum: Int, _ S: Int) -> Int {
        if start == nums.count {
            return sum == S ? 1 : 0
        }
        if let memo = visited[[start, sum]] {
            return memo
        }
        let c1 = helper(nums, &visited, start + 1, sum + nums[start], S)
        let c2 = helper(nums, &visited, start + 1, sum - nums[start], S)
        visited[[start, sum]] = c1 + c2
        return c1 + c2
    }
}

Solution().findTargetSumWays([1, 1, 1, 1, 1], 3)
