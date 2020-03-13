class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        let n = nums.count
        let s = nums.reduce(0, +)
        let m = nums.min()!
        return s - m * n
    }
}
