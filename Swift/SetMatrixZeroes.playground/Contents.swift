class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return
        }
        let m = matrix.count
        let n = matrix[0].count
        var col0 = 1    // 第0列是不是0
        for i in 0..<m {
            if matrix[i][0] == 0 && col0 == 1 {  // 如果第一列有0，设col0为0
                col0 = 0
            }
            for j in 1..<n {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in stride(from: m - 1, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 1, by: -1) {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
            if col0 == 0 {
                matrix[i][0] = 0
            }
        }
    }
}

var arr = [
    [1,1,1],
    [0,1,1],
    [1,1,1]
]
Solution().setZeroes(&arr)
print(arr)
