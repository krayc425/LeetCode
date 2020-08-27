class Solution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        guard let first = nums.first, !first.isEmpty else {
            return nums
        }
        let oldR = nums.count
        let oldC = first.count
        guard oldC * oldR == r * c else {
            return nums
        }
        var res: [[Int]] = Array(repeating: Array(repeating: 0, count: c), count: r)
        for i in 0..<(oldR * oldC) {
            res[i / c][i % c] = nums[i / oldC][i % oldC]
        }
        return res
    }
}

Solution().matrixReshape([[1,2],[3,4]], 1, 4)
