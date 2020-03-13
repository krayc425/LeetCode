class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        guard !intervals.isEmpty else {
            return true
        }
        let intervals = intervals.sorted { $0[0] < $1[0] }
        for i in 0..<intervals.count - 1 {
            if intervals[i + 1][0] - intervals[i][1] < 0 {
                return false
            }
        }
        return true
    }
}
