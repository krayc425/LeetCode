class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else {
            return []
        }
        if intervals.count == 1 {
            return [intervals[0]]
        }
        var results: [[Int]] = []
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var left: Int = intervals[0][0]
        var right: Int = intervals[0][1]
        for interval in intervals.dropFirst() {
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
