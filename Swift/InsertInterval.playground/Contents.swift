class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard !intervals.isEmpty else {
            return [newInterval]
        }
        if newInterval[0] > intervals.last![1] {
            return intervals + [newInterval]
        }
        if newInterval[1] < intervals.first![0] {
            return [newInterval] + intervals
        }
        var res: [[Int]] = []
        var begin = 0
        while begin < intervals.count && intervals[begin][1] < newInterval[0] {
            res.append(intervals[begin])
            begin += 1
        }
        var new = newInterval
        while begin < intervals.count && intervals[begin][0] <= newInterval[1] {
            new[0] = min(intervals[begin][0], new[0])
            new[1] = max(intervals[begin][1], new[1])
            begin += 1
        }
        res.append(new)
        while begin < intervals.count {
            res.append(intervals[begin])
            begin += 1
        }
        return res
    }
}

Solution().insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])
