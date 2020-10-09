class Solution {
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        guard !mat.isEmpty && !mat.first!.isEmpty else {
            return []
        }
        let m = mat.count
        let n = mat[0].count
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var beginX = m - 1
        var beginY = 0
        var endX = m - 1
        var endY = 0
        var count = 0
        while count < m + n - 1 {
            var temp: [Int] = []
            for i in 0...(endX - beginX) {
                temp.append(mat[beginX + i][beginY + i])
            }
            temp.sort()
            for i in 0...(endX - beginX) {
                res[beginX + i][beginY + i] = temp[i]
            }
            if beginX > 0 {
                beginX -= 1
            } else {
                beginY += 1
            }
            if endY < n - 1 {
                endY += 1
            } else {
                endX -= 1
            }
            count += 1
        }
        return res
    }
}

Solution().diagonalSort([[37,98,82,45,42]])
Solution().diagonalSort([[3,3,1,1],[2,2,1,2],[1,1,1,2]])
