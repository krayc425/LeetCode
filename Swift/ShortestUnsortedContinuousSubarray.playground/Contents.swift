class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var l = 0
        var r = nums.count - 1
        while l < nums.count - 1 && nums[l] <= nums[l + 1] {
            l += 1
        }
        if l >= r {
            return 0
        }
        while r > 0 && nums[r] >= nums[r - 1] {
            r -= 1
        }
        var maxV = Int.min
        var minV = Int.max
        for i in l...r {
            maxV = max(maxV, nums[i])
            minV = min(minV, nums[i])
        }
        while l > 0 && nums[l - 1] > minV {
            l -= 1
        }
        while r < nums.count - 1 && nums[r + 1] < maxV {
            r += 1
        }
        return r - l + 1
    }
}

Solution().findUnsortedSubarray([7,6,5,4,3,2,5])
