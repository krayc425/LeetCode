class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var res: [Int] = []
        for num in nums {
            if nums[abs(num) - 1] < 0 {
                res.append(num)
            }
            nums[abs(num) - 1] *= -1
        }
        return res
    }
}

Solution().findDuplicates([4,3,2,7,8,2,3,1])
