class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        var low = 0
        var high = nums.count - 1
        while low < high {
            let mid = low + (high - low) / 2
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
        let oldLow = nums[low] < nums[high] ? -1 : low
        let newNums = nums[low] < nums[high] ? nums : Array(nums[(low+1)...] + nums[0...low])
        low = 0
        high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if newNums[mid] > target {
                high = mid - 1
            } else if newNums[mid] < target {
                low = mid + 1
            } else {
                return (mid + 2 * nums.count + oldLow + 1) % nums.count
            }
        }
        return -1
    }
}

Solution().search([1,2,3,4], 4)
