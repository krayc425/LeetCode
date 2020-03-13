class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return [1]
        } else if rowIndex == 1 {
            return [1, 1]
        } else {
            var row: [Int] = [1, 1]
            var temp: [Int] = [1]
            for _ in 1..<rowIndex {
                for j in 0..<row.count - 1 {
                    temp.append(row[j + 1] + row[j])
                }
                temp.append(1)
                row = temp
                temp = [1]
            }
            return row
        }
    }
}

print(Solution().getRow(3))
