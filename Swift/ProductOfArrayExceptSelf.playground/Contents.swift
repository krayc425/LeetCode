class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let count = nums.count
        guard count > 0 else {
            return []
        }
        if count == 1 {
            return nums
        }
        if count == 2 {
            return nums.reversed()
        }
        var res: [Int] = Array(repeating: 1, count: nums.count)
        var temp: [Int] = Array(repeating: 0, count: nums.count)
        temp[0] = nums[0]
        var temp2: [Int] = Array(repeating: 0, count: nums.count)
        temp2[count - 1] = nums[count - 1]
        for i in 1..<count {
            temp[i] = temp[i - 1] * nums[i]
            temp2[count - i - 1] = temp2[count - i] * nums[count - i - 1]
        }
        for i in 0..<count {
            if i == 0 {
                res[i] = temp2[i + 1]
            } else if i == count - 1 {
                res[i] = temp[i - 1]
            } else {
                res[i] = temp[i - 1] * temp2[i + 1]
            }
        }
        return res
    }
    
    func productExceptSelf_constant_space(_ nums: [Int]) -> [Int] {
        let count = nums.count
        guard count > 0 else {
            return []
        }
        if count == 1 {
            return nums
        }
        var res: [Int] = Array(repeating: 1, count: nums.count)
        res[0] = 1
        for i in 1..<count {
            res[i] = res[i - 1] * nums[i - 1]
        }
        var right = 1
        for i in (0..<count).reversed() {
            res[i] *= right
            right *= nums[i]
        }
        return res
    }
}

//Solution().productExceptSelf([2,3,4,5])
Solution().productExceptSelf_constant_space([4,5])
