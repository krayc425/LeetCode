class Solution {
    func arrayNesting(_ nums: [Int]) -> Int {
        var visited: [Bool] = Array(repeating: false, count: nums.count)
        var res = Int.min
        for (idx, num) in nums.enumerated() {
            if !visited[idx] {
                var start = num
                var count = 0
                repeat {
                    start = nums[start]
                    count += 1
                    visited[start] = true
                } while start != num
                res = max(res, count)
            }
        }
        return res
    }
}
