let matrix = [[1,6,3,6],
              [3,2,6,8],
              [1,4,6,3],
              [2,1,6,1]]

func minimumPath(in matrix: [[Int]]) -> Int {
    let m = matrix.count
    let n = matrix[0].count
    
    var newMatrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    var sum = 0
    for i in 0..<n {
        sum += matrix[0][i]
        newMatrix[0][i] = sum
    }
    sum = 0
    for i in 0..<m {
        sum += matrix[i][0]
        newMatrix[i][0] = sum
    }
    
    for i in 1..<m {
        for j in 1..<n {
            newMatrix[i][j] = min(newMatrix[i - 1][j], newMatrix[i][j - 1])
                                + matrix[i][j]
        }
    }
    return newMatrix[m - 1][n - 1]
}

minimumPath(in: matrix)
