class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        var i = 0
        while i <= n - i - 1 {
            let end = n - i - 1
            for j in 0..<end-i {
                let t = matrix[i][i + j]
                matrix[i][i + j] = matrix[end - j][i]
                matrix[end - j][i] = matrix[end][end - j]
                matrix[end][end - j] = matrix[i + j][end]
                matrix[i + j][end] = t
            }
            i += 1
        }
    }
}

var arr = [[2,29,20,26,16,28],[12,27,9,25,13,21],[32,33,32,2,28,14],[13,14,32,27,22,26],[33,1,20,7,21,7],[4,24,1,6,32,34]]
Solution().rotate(&arr)
