class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        return A.map { $0 * $0 }.sorted()
    }
    
    func sortedSquares_twopointers(_ A: [Int]) -> [Int] {
        guard !A.isEmpty else {
            return []
        }
        var m = 0
        var n = A.count - 1
        var res = Array(repeating: 0, count: n + 1)
        for i in (0..<A.count).reversed() {
            if abs(A[m]) >= abs(A[n]) {
                res[i] = A[m] * A[m]
                m += 1
            } else {
                res[i] = A[n] * A[n]
                n -= 1
            }
        }
        return res
    }
}

Solution().sortedSquares_twopointers([-7,-3,2,3,11])
