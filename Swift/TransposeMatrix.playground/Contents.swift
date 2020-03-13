class Solution {
    func transpose(_ A: [[Int]]) -> [[Int]] {
        let m = A.count
        let n = A[0].count
        var res: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<m {
            for j in 0..<n {
                res[j][i] = A[i][j]
            }
        }
        return res
    }
}

Solution().transpose([[1,2,3],[4,5,6]])
