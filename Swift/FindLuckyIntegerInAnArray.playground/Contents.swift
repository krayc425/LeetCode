class Solution {
    func findLucky(_ arr: [Int]) -> Int {
        guard !arr.isEmpty else {
            return -1
        }
        var dict: [Int: Int] = [:]
        for num in arr {
            dict[num, default: 0] += 1
        }
        var res = -1
        for (k, v) in dict {
            if k == v {
                res = max(res, k)
            }
        }
        return res
    }
}

Solution().findLucky([2,2,3,4])
Solution().findLucky([1,2,2,3,3,3])
Solution().findLucky([2,2,2,3,3])
Solution().findLucky([5])
Solution().findLucky([7,7,7,7,7,7,7])
