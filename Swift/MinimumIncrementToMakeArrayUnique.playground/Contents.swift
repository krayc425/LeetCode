class Solution {
    func minIncrementForUnique(_ A: [Int]) -> Int {
        guard !A.isEmpty && A.count > 1 && Set(A).count != A.count else {
            return 0
        }
        var sum = 0
        var low = 0
        var oldSum = 0
        let arr = A.sorted()
        for num in arr {
            low = max(low, num)
            sum += low
            oldSum += num
            low += 1
        }
        return sum - oldSum
    }
}
