class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [0:-1]       // count : index
        var count = 0
        var maxLen = 0
        for i in 0..<nums.count {
            count += (nums[i] == 0 ? -1 : 1)
            if let val = map[count] {
                maxLen = max(maxLen, i - val)
            } else {
                map[count] = i
            }
        }
        return maxLen
    }
}

Solution().findMaxLength([0,0,1,1,0,1,1])
