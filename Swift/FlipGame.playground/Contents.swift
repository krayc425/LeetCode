class Solution {
    func generatePossibleNextMoves(_ s: String) -> [String] {
        guard s.count >= 2 else {
            return []
        }
        let array = Array(s)
        var res: [String] = []
        for i in 0..<s.count - 1 {
            if array[i] == "+" && array[i + 1] == "+" {
                res.append(array[0..<i] + "--" + array[(i+2)...])
            }
        }
        return res
    }
}

Solution().generatePossibleNextMoves("++++")
