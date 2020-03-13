class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var result = 0
        guard nums.count > 0 else {
            return 0
        }
        var temp = nums[0]
        var uniqueIndex = 0
        for i in 1..<nums.count {
            if nums[i] == temp {
                result += 1
            } else {
                temp = nums[i]
                nums[uniqueIndex + 1] = temp
                uniqueIndex += 1
            }
        }
        return nums.count - result
    }
}

var test = [1,1,1,1,1,2,3,3,4,4,5,6,6,7,8,9,10,10,10]
print(Solution().removeDuplicates(&test))
