class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 1 else {
            return [nums]
        }
        var res: [[Int]] = []
        nums.forEach { num in
            permute(nums.filter { $0 != num }).forEach {
                res.append([num] + $0)
            }
        }
        return res
    }
}

Solution().permute([1,2,3,4,5])
