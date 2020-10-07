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
        var sortedInterval = schedule.reduce([], +).sorted(by: { $0.start < $1.start })
        guard sortedInterval.count > 1 else {
            return []
        }
        var res: [Interval] = []
        var first = 0
        for i in 1..<sortedInterval.count {
            if sortedInterval[i].start <= sortedInterval[first].end {
                sortedInterval[first].end = max(sortedInterval[first].end, sortedInterval[i].end)
                sortedInterval[i].end = Int.min
            } else {
                first = i
            }
        }
        sortedInterval = sortedInterval.filter { $0.end != Int.min }
        for i in 0..<sortedInterval.count - 1 {
            res.append(Interval(sortedInterval[i].end, sortedInterval[i + 1].start))
        }
        return res
    }
}

//Solution().employeeFreeTime([[Interval(1,3),Interval(6,7)],[Interval(2,4)],[Interval(2,5),Interval(9,12)]])
Solution().employeeFreeTime([[Interval(1, 2), Interval(5, 6)],[Interval(1, 3)],[Interval(4, 10)]])
