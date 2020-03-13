class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var res: [[Int]] = []
        let array = points.map { $0[0] * $0[0] + $0[1] * $0[1] }.sorted()
        let max = array[K - 1]
        for point in points {
            let dist = point[0] * point[0] + point[1] * point[1]
            if dist <= max {
                if res.count < K {
                    res.append(point)
                }
            }
        }
        return res
    }
}
