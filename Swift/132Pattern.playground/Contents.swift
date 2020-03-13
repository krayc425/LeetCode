class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else {
            return false
        }
        var stack: [Int] = []
        var third: Int = Int.min
        for i in (0..<nums.count).reversed() {
            if nums[i] < third {
                return true     // 此时，nums[i] < third 而且 third < stack 中所有元素
            }
            while !stack.isEmpty && stack.last! < nums[i] {
                third = stack.removeLast()
            }
            stack.append(nums[i])
        }
        return false
    }
}

Solution().find132pattern([1,0,1,-4,-3])
