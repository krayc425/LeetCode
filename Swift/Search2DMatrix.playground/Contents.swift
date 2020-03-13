class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return false
        }
        if target < matrix[0][0] {
            return false
        }
        let m = matrix.count
        let n = matrix[0].count
        var i = 0, j = 0
        while i < m && j < n {
            let num = matrix[i][j]
            if num == target {
                return true
            } else {
                if i == m - 1 {
                    if num < target {
                        j += 1
                    } else {
                        return false
                    }
                } else {
                    if num < target {
                        if target >= matrix[i + 1][0] {
                            i = i + 1
                            j = 0
                        } else {
                            j += 1
                        }
                    } else {
                        return false
                    }
                }
            }
        }
        return false
    }
}

let matrix = [
  [1,  3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
print(Solution().searchMatrix(matrix, 111))
