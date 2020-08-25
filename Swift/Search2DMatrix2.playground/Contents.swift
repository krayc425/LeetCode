class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return false
        }
        var row = 0
        var column = matrix[0].count - 1
        while row < matrix.count && column >= 0 {
            if matrix[row][column] == target {
                return true
            } else if matrix[row][column] > target {
                column -= 1
            } else {
                row += 1
            }
        }
        return false
    }
}

let arr = [
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]
Solution().searchMatrix(arr, 10)
