class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty && k >= 0 else {
            return 0
        }
        var dict: [Int: Int] = [:]
        for num in nums {
            dict[num, default: 0] += 1
        }
        var res = 0
        for (num, count) in dict {
            if k == 0 {
                if count > 1 {
                    res += 1
                }
            } else {
                if dict[num - k] != nil {
                    res += 1
                }
            }
        }
        return res
    }
}

Solution().findPairs([-2,-1,-3], 1)
