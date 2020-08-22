class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        guard !A.isEmpty else {
            return []
        }
        var res: [[Int]] = []
        for row in A {
            res.append(row.reversed().map { $0 - 1 }.map { abs($0 )})
        }
        return res
    }
}

Solution().flipAndInvertImage([[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]])
