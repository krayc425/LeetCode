class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        return binarySearch(nums, 0, nums.count - 1)
    }
    
    func binarySearch_recursive(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        if l == r {
            return l
        } else {
            let mid = l + (r - l) / 2
            if nums[mid] > nums[mid + 1] {
                return binarySearch_recursive(nums, 1, mid)
            } else {
                return binarySearch_recursive(nums, mid + 1, r)
            }
        }
    }
    
    func binarySearch(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        var l = l
        var r = r
        while l < r {
            let mid = l + (r - l) / 2
            if nums[mid] > nums[mid + 1] {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }
}

Solution().findPeakElement([1,5,3,2,1,4,2,1,2,3])
