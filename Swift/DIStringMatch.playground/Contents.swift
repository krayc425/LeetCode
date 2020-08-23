class Solution {
    func diStringMatch(_ S: String) -> [Int] {
        guard !S.isEmpty else {
            return []
        }
        var res: [Int] = Array(repeating: 0, count: S.count + 1)
        var low = 0
        var high = S.count
        for (idx, chr) in S.enumerated() {
            if chr == "I" {
                res[idx] = low
                low += 1
            } else if chr == "D" {
                res[idx] = high
                high -= 1
            }
        }
        res[S.count] = low
        return res
    }
}
