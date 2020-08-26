class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        guard !nums.isEmpty else {
            return 0.0
        }
        let n = nums.count
        guard k <= n else {
            return 0.0
        }
        if k == n {
            return Double(nums.reduce(0, +)) / Double(n)
        }
        var left = 0
        var right = k - 1
        var currSum = nums[left...right].reduce(0, +)
        var res = Int.min
        while true {
            res = max(res, currSum)
            currSum -= nums[left]
            left += 1
            right += 1
            if right == n {
                break
            }
            currSum += nums[right]
        }
        return Double(res) / Double(k)
    }
}

Solution().findMaxAverage([1,12,-5,-6,50,3], 4)
