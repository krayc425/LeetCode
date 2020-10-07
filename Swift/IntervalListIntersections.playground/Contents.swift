class Solution {
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var i = 0, j = 0
        var res: [[Int]] = []
        while i < A.count && j < B.count {
            let start = max(A[i][0], B[j][0])
            let end = min(A[i][1], B[j][1])
            if start <= end {
                res.append([start, end])
            }
            if A[i][1] < B[j][1] {
                i += 1
            } else {
                j += 1
            }
        }
        return res
    }
}

Solution().intervalIntersection([[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]])
Solution().intervalIntersection([[5,10]], [[5,6]])
Solution().intervalIntersection([[3,5],[9,20]], [[4,5],[7,10],[11,12],[14,15],[16,20]])
