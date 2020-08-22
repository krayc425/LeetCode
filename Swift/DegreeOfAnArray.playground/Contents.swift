class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var leftDict: [Int: Int] = [:]
        var rightDict: [Int: Int] = [:]
        var countDict: [Int: Int] = [:]
        for (idx, num) in nums.enumerated() {
            if leftDict[num] == nil {
                leftDict[num] = idx
            }
            rightDict[num] = idx
            countDict[num, default: 0] += 1
        }
        var res = nums.count
        let degree = countDict.values.max()!
        for (k, v) in countDict {
            if v == degree {
                res = min(res, rightDict[k]! - leftDict[k]! + 1)
            }
        }
        return res
    }
}

Solution().findShortestSubArray([1,2,2,3,1,4,2])
