class Solution {
    func splitArray(_ nums: [Int]) -> Bool {
        guard nums.count >= 7 else {
            return false
        }
        var prefixSum: [Int] = []
        var sum = 0
        for num in nums {
            sum += num
            prefixSum.append(sum)
        }
        let n = nums.count
        for j in 3..<n - 3 {
            var set = Set<Int>()
            for i in 1...j - 2 {
                if prefixSum[i - 1] == prefixSum[j - 1] - prefixSum[i] {
                    set.insert(prefixSum[i - 1])
                }
            }
            for k in j + 2...n - 2 {
                if prefixSum[k - 1] - prefixSum[j] == prefixSum[n - 1] - prefixSum[k] && set.contains(prefixSum[k - 1] - prefixSum[j]) {
                    return true
                }
            }
        }
        return false
    }
}
