class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        guard !arr.isEmpty else {
            return -1
        }
        var dict: [Int: Int] = [:]
        for num in arr {
            dict[num, default: 0] += 1
        }
        let sortedArr = dict.values.sorted().reversed()
        var count = 0
        var remainedCount = arr.count
        for value in sortedArr {
            count += 1
            remainedCount -= value
            if remainedCount <= arr.count / 2 {
                return count
            }
        }
        return -1
    }
}

Solution().minSetSize([100,100,1,3])
