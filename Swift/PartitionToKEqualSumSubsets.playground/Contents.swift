class Solution {
    
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let sum = nums.reduce(0, +)
        guard sum % k == 0 else {
            return false
        }
        var visited: [Bool] = Array(repeating: false, count: nums.count)
        return helper(nums.sorted().reversed(), k, sum / k, 0, 0, &visited)
    }
    
    func helper(_ nums: [Int], _ k: Int, _ target: Int, _ start: Int, _ curSum: Int, _ visited: inout [Bool]) -> Bool {
        if k == 1 {
            return true
        }
        if curSum > target {
            return false
        }
        if curSum == target {
            return helper(nums, k - 1, target, 0, 0, &visited)
        }
        for i in start..<nums.count where !visited[i] {
            visited[i] = true
            if helper(nums, k, target, i + 1, curSum + nums[i], &visited) {
                return true
            }
            visited[i] = false
        }
        return false
    }
    
}
