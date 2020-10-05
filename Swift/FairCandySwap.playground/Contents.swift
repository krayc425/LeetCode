class Solution {
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        let sumA = A.reduce(0, +)
        let sumB = B.reduce(0, +)
        let delta = (sumA - sumB) / 2
        let setB = Set(B)
        for a in A {
            if setB.contains(a - delta) {
                return [a, a - delta]
            }
        }
        return []
    }
}

Solution().fairCandySwap([1,2,5], [2,4])
Solution().fairCandySwap([2], [1,3])
