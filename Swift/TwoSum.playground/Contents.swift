/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numberIndexDict: [Int: Int] = [:]
        for i in 0..<nums.count {
            if numberIndexDict[target - nums[i]] == nil {
                numberIndexDict[target - nums[i]] = i
            }
            if numberIndexDict[nums[i]] != nil && numberIndexDict[nums[i]] != i {
                return [i, numberIndexDict[nums[i]]!].sorted()
            }
        }
        return []
    }
}

Solution().twoSum([2, 7, 11, 15], 9)
