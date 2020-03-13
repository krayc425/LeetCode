class Solution {
    func numSquares(_ n: Int) -> Int {
        var res: [Int] = [0] + Array(repeating: n, count: n)
        var squares: [Int] = [0]
        for i in 1...n {
            let cnt = squares.count
            if cnt * cnt == i {
                squares.append(i)
            }
            for square in squares where i >= square {
                res[i] = min(res[i], res[i - square] + 1)
            }
        }
        return res[n]
    }
}

Solution().numSquares(13)
