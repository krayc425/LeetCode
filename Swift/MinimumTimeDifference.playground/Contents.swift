class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        var times: [Int] = []
        for tp in timePoints {
            let pair = tp.split(separator: ":")
            let time = Int(pair[0])! * 60 + Int(pair[1])!
            times.append(time)
        }
        times.sort()
        var minTime = 24 * 60
        for i in 0..<times.count - 1 {
            minTime = min(minTime, times[i + 1] - times[i])
        }
        minTime = min(minTime, times[0] + 24 * 60 - times[times.count - 1])
        return minTime
    }
}
