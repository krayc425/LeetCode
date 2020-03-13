class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var temp = nums[0]
        var is_first = 1
        var uniqueIndex = 0
        for i in 1..<nums.count {
            if nums[i] == temp {
                if is_first > 0 {
                    is_first -= 1
                    uniqueIndex += 1
                    nums[uniqueIndex] = nums[i]
                }
            } else {
                is_first = 1
                uniqueIndex += 1
                nums[uniqueIndex] = nums[i]
                temp = nums[i]
            }
        }
        return uniqueIndex + 1
    }
}

var arr = [0,0,0,0,0,1,1,1,1,2,2,3,3,4,5,6,7,8,8,8,9,9]
Solution().removeDuplicates(&arr)
