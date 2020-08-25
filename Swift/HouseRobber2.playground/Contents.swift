class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        return max(helper([Int](nums[1...])), helper([Int](nums[0..<nums.count - 1])))
    }
    
    private func helper(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        var prev = nums[0]
        var curr = max(nums[0], nums[1])
        for i in 2..<nums.count {
            let temp = curr
            curr = max(curr, nums[i] + prev)
            prev = temp
        }
        return curr
    }
}
