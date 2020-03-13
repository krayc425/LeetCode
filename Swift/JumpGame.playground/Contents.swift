class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else {
            return false
        }
        var maxIdx = 0
        for (idx, val) in nums.enumerated() {
            if idx > maxIdx {
                return false
            }
            maxIdx = max(maxIdx, idx + val)
        }
        return true
    }
}

Solution().canJump([0,1])
