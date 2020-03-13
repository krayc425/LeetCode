class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [-1, -1]
        guard !nums.isEmpty else {
            return result
        }
        
        var low = 0
        var high = nums.count - 1
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        
        guard nums[low] == target else {
            return result
        }
        
        result[0] = low
        
        low = 0
        high = nums.count - 1
        while low < high {
            let mid = low + (high - low) / 2 + 1
            if nums[mid] > target {
                high = mid - 1
            } else {
                low = mid
            }
        }
        result[1] = high
        return result
    }
}

Solution().searchRange([5,7,7,7,7,8,8,10], 7)
