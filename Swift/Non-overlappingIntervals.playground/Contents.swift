class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        return intervals.count - maxNonOverlapIntervals(intervals.sorted(by: { (i1, i2) -> Bool in
            i1[1] < i2[1]
        }))
    }
    
    func maxNonOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard let first = intervals.first else {
            return 0
        }
        var res = 1
        var end = first[1]
        for interval in intervals.dropFirst() {
            if interval[0] >= end {
                end = interval[1]
                res += 1
            }
        }
        return res
    }
}

Solution().eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])
Solution().eraseOverlapIntervals([[1,2],[1,2],[1,2]])
