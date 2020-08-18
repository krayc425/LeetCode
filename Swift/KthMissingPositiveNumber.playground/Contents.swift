class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var curr = 1
        var missed = 0
        while missed < k {
            if !arr.contains(curr) {
                missed += 1
            }
            if missed == k {
                break
            }
            curr += 1
        }
        return curr
    }
}

Solution().findKthPositive([1,2,3,4], 2)
