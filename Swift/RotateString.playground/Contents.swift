class Solution {
    func rotateString(_ A: String, _ B: String) -> Bool {
        if A.count != B.count {
            return false
        }
        if A.isEmpty && B.isEmpty {
            return true
        }
        return (A + A).contains(B)
    }
}
