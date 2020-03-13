class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        guard !A.isEmpty else {
            return []
        }
        var A = A
        var l = 0
        var r = A.count - 1
        while l < r {
            while A[l] % 2 == 0 && l < A.count - 1 {
                l += 1
            }
            while A[r] % 2 == 1 && r > 0 {
                r -= 1
            }
            if l <= A.count - 1 && r >= 0 && l < r {
                A.swapAt(l, r)
            } else {
                break
            }
        }
        return A
    }
}

Solution().sortArrayByParity([1,3])
