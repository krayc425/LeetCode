class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count == nums.count
    }
}

print(Solution().containsDuplicate([1,2,3,1]))
