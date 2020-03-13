/**
 Given an array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, { $0 ^ $1 })
    }
}

print(Solution().singleNumber([1, 3, 5, 7, 2, 4, 6, 8, 9, 5, 2, 1, 3, 4, 7, 6, 8]))
