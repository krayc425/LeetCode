class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var res = 0
        var curr = 0
        for num in nums {
            if num == 1 {
                curr += 1
                res = max(res, curr)
            } else {
                curr = 0
            }
        }
        return res
    }
}
