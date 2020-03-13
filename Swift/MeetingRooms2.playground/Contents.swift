class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        guard !intervals.isEmpty else {
            return 0
        }
        var res = 0
        var curr = 0
        let starts = intervals.map { $0[0] }.sorted { $0 < $1 }
        let ends = intervals.map { $0[1] }.sorted { $0 < $1 }
        let n = intervals.count
        var i = 0, j = 0
        while i < n && j < n {
            if starts[i] < ends[j] {
                curr += 1
                i += 1
            } else {
                curr -= 1
                j += 1
            }
            res = max(res, curr)
        }
        return res
    }
}

Solution().minMeetingRooms([[0, 30],[5, 10],[15, 20]])
Solution().minMeetingRooms([[7,10],[2,4]])
Solution().minMeetingRooms([[1,5],[8,9],[8,9]])
