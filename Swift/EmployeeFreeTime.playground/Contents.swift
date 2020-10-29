public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}


class Solution {
    func employeeFreeTime(_ schedule: [[Interval]]) -> [Interval] {
        let sortedInterval = schedule.reduce([], +).sorted(by: { $0.start < $1.start })
        guard sortedInterval.count > 1 else {
            return []
        }
        var mergedIntervals: [Interval] = []
        var left = sortedInterval[0].start
        var right = sortedInterval[0].end
        for interval in sortedInterval.dropFirst() {
            if interval.start <= right {
                right = max(right, interval.end)
            } else {
                mergedIntervals.append(Interval(left, right))
                left = interval.start
                right = interval.end
            }
        }
        mergedIntervals.append(Interval(left, right))
        var res: [Interval] = []
        for i in 0..<mergedIntervals.count - 1 {
            res.append(Interval(mergedIntervals[i].end, mergedIntervals[i + 1].start))
        }
        return res
    }
}

//Solution().employeeFreeTime([[Interval(1,3),Interval(6,7)],[Interval(2,4)],[Interval(2,5),Interval(9,12)]])
Solution().employeeFreeTime([[Interval(1, 2), Interval(5, 6)],[Interval(1, 3)],[Interval(4, 10)]])
