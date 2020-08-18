class Solution {
    func commonChars(_ A: [String]) -> [String] {
        guard let first = A.first else {
            return []
        }
        var chars = Array(first)
        for i in 1..<A.count {
            var curr = A[i]
            for j in (0..<chars.count).reversed() {
                if let firstIndex = curr.firstIndex(of: chars[j]) {
                    curr.remove(at: firstIndex)
                } else {
                    chars.remove(at: j)
                }
            }
        }
        return chars.map { String($0) }
    }
}

Solution().commonChars(["cool","lock","cook"])
Solution().commonChars(["bella","label","roller"])
