class Solution {
    func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
        let mins = matrix.map { $0.min()! }
        var res: [Int] = []
        for i in 0..<matrix[0].count {
            var currMax = Int.min
            for j in 0..<matrix.count {
                let curr = matrix[j][i]
                if curr > currMax {
                    currMax = curr
                }
            }
            if mins.contains(currMax) {
                res.append(currMax)
            }
        }
        return res
    }
}

Solution().luckyNumbers([[1,10,4,2],[9,3,8,7],[15,16,17,12]])
