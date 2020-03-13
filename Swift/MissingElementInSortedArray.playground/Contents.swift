class Solution {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        var low = 0
        var high = nums.count
        while low < high {
            let mid = low + (high - low) / 2
            if missingIdx(mid, nums) >= k {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return nums[0] + low + k - 1
    }
    
    private func missingIdx(_ idx: Int, _ nums: [Int]) -> Int {
        return nums[idx] - nums[0] - idx
    }
}

Solution().missingElement([4,7,9,10], 3)
