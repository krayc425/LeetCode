class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        guard seats.count >= 2 else {
            return -1
        }
        var res = Int.min
        var prev = -1
        for (idx, seat) in seats.enumerated() {
            if seat == 1 {
                res = max(res, prev == -1 ? (idx * 2) : (idx - prev))
                prev = idx
            } else if idx == seats.count - 1 {
                res = max(res, (idx - prev) * 2)
            }
        }
        return res / 2
    }
}

Solution().maxDistToClosest([0,1,0,0,0,1,0,1])
Solution().maxDistToClosest([1,0,0,0])
