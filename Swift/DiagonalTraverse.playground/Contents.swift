class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty && !matrix.first!.isEmpty else {
            return []
        }
        let m = matrix.count
        let n = matrix[0].count
        var res: [Int] = []
        var beginX = 0
        var beginY = 0
        var endX = 0
        var endY = 0
        var count = 0
        while count < m + n - 1 {
            print(beginX, beginY, endX, endY)
            if count % 2 == 0 {
                for i in 0...(beginY - endY) {
                    res.append(matrix[endX - i][endY + i])
                }
            } else {
                for i in 0...(beginY - endY) {
                    res.append(matrix[beginX + i][beginY - i])
                }
            }
            if beginY < n - 1 {
                beginY += 1
            } else {
                beginX += 1
            }
            if endX < m - 1 {
                endX += 1
            } else {
                endY += 1
            }
            count += 1
        }
        return res
    }
}

Solution().findDiagonalOrder([[ 1, 2, 3 ],[ 4, 5, 6 ],[ 7, 8, 9 ]])
Solution().findDiagonalOrder([[ 1, 2, 3 ]])
