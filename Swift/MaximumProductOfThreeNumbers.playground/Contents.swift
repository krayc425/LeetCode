class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        guard nums.count > 3 else {
            return nums.reduce(1, *)
        }
        var min1 = Int.max
        var min2 = Int.max
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        for num in nums {
            if num <= min1 {
                min2 = min1
                min1 = num
            } else if num <= min2 {
                min2 = num
            }
            if num >= max1 {
                max3 = max2
                max2 = max1
                max1 = num
            } else if num >= max2 {
                max3 = max2
                max2 = num
            } else if num >= max3 {
                max3 = num
            }
        }
        return max(max1 * max2 * max3, min1 * min2 * max1)
    }
}

Solution().maximumProduct([8,8,8,8])
Solution().maximumProduct([1,2,3,4])
Solution().maximumProduct([-4,-3,-2,-1,60])
Solution().maximumProduct([-4,-3,-2,-1,0])
