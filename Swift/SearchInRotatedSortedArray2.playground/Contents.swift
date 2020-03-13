class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        guard !nums.isEmpty else {
            return false
        }
        var low = 0
        var high = nums.count - 1
        //
        // 找到由大变小的那个index [2,3,4,5,0,1]
        //                             👆
        while low < high {
            let mid = low + (high - low) / 2
            while low < high && nums[low] == nums[low + 1] {
                low += 1
            }
            while low < high && nums[high - 1] == nums[high] {
                high -= 1
            }
            if nums[low] < nums[mid] && nums[mid] < nums[high] {
                break
            }
            if nums[mid] > nums[high] {
                low = mid
            } else if nums[mid] < nums[low] {
                high = mid
            }
            if (abs(high - low) <= 1) {
                break
            }
        }
        let newNums = nums[low] < nums[high] ? nums : Array(nums[(low + 1)...] + nums[0...low])
        low = 0
        high = nums.count - 1
        // 二分查找
        while low <= high {
            let mid = low + (high - low) / 2
            if newNums[mid] > target {
                high = mid - 1
            } else if newNums[mid] < target {
                low = mid + 1
            } else {
                // 找到！
                return true
            }
        }
        return false
    }
}

Solution().search([1,1,3], 0)
