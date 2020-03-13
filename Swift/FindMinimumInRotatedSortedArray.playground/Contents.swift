class Solution {
    func findMin_cheat(_ nums: [Int]) -> Int {
        return nums.sorted(by: <)[0]
    }
    
    func findMin(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return min(nums[0], nums[1])
        }
        var low = 0
        var high = nums.count - 1
        var mid = 0
        while low < high {
            mid = low + (high - low) / 2
            if nums[mid] > nums[high] {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return nums[low]
    }
}

Solution().findMin([4,5,6,7,8,2,3])
