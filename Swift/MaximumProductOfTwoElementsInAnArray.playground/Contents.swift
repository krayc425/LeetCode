class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count >= 2 else {
            return 0
        }
        var max1 = Int.min
        var max2 = Int.min
        for num in nums {
            if num > max1 {
                max2 = max1
                max1 = num
            } else if num > max2 {
                max2 = num
            }
        }
        return (max1 - 1) * (max2 - 1)
    }
    
    func maxProduct_sorted(_ nums: [Int]) -> Int {
        let numsSorted: [Int] = nums.sorted().reversed()
        return (numsSorted[0] - 1) * (numsSorted[1] - 1)
    }
}

Solution().maxProduct([1,5,4,5])
