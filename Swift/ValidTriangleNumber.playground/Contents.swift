class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        var count = 0
        let nums = nums.sorted()
        for k in (2..<nums.count).reversed() {
            var j = k - 1
            var i = 0
            while i < j {
                if nums[i] + nums[j] > nums[k] {
                    count += (j - i)
                    j -= 1
                } else {
                    i += 1
                }
            }
        }
        return count
    }
}

Solution().triangleNumber([2,2,2,3,4])
