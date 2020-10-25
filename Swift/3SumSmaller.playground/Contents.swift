class Solution {
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        var res = 0
        let nums = nums.sorted()
        for i in 0..<nums.count - 2 {
            var k = nums.count - 1
            for j in i + 1..<nums.count - 1 {
                if j >= k {
                    break
                }
                while j < k && nums[i] + nums[j] + nums[k] >= target {
                    k -= 1
                }
                res += (k - j)
            }
        }
        return res
    }
}
