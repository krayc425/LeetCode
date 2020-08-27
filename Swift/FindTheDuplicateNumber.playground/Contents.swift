class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        guard let first = nums.first else {
            return -1
        }
        var slow = first
        var fast = first
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
        slow = first
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }
}

Solution().findDuplicate([1,3,4,2,2])
