class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var results: [[Int]] = []
        guard !intervals.isEmpty else {
            return results
        }
        if intervals.count == 1 {
            results.append(intervals[0])
            return results
        }
        var intervals = intervals
        for var interval in intervals {
            interval.sort()
        }
        intervals.sort { $0[0] < $1[0] }
        var left: Int = intervals[0][0]
        var right: Int = intervals[0][1]
        for interval in intervals {
            if interval[0] <= right {
                right = max(right, interval[1])
            } else {
                results.append([left, right])
                left = interval[0]
                right = interval[1]
            }
        }
        results.append([left, right])
        return results
    }
}

print(Solution().merge([[3,5],[1,3],[2,7],[8,10],[11,18]]))
