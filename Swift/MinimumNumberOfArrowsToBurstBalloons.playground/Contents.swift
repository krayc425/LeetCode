class Solution {
    // Count how many overlapped intervals in points
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let points = points.sorted { (p1, p2) -> Bool in
            p1[1] < p2[1]
        }
        guard let first = points.first else {
            return 0
        }
        var curr = 1
        var lastEnd = first[1]
        for point in points.dropFirst() {
            if point[0] > lastEnd {
                curr += 1
                lastEnd = point[1]
            }
        }
        return curr
    }
}

Solution().findMinArrowShots([[10,16],[2,8],[1,6],[7,12]])
Solution().findMinArrowShots([[1,2],[3,4],[5,6],[7,8]])
Solution().findMinArrowShots([[1,2],[2,3],[3,4],[4,5]])
Solution().findMinArrowShots([[3,9],[7,12],[3,8],[6,8],[9,10],[2,9],[0,9],[3,9],[0,6],[2,8]])
