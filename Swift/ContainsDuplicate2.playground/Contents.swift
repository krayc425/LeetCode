class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        if nums.count < 2 {
            return false
        }
        var valueToIdx: [Int: Int] = [:]
        for (idx, val) in nums.enumerated() {
            if let oldIdx = valueToIdx[val], idx - oldIdx <= k {
                return true
            } else {
                valueToIdx[val] = idx
            }
        }
        return false
    }
}

Solution().containsNearbyDuplicate([5,1,2,3,1,5], 1)
