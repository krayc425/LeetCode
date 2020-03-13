class Solution {
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        guard A.count >= 3 else {
            return -1
        }
        var low = 0
        var high = A.count - 1
        while low < high {
            let mid = low + (high - low) / 2
            if A[mid] < A[mid + 1] {    // 找到第一个 A[mid] >= A[mid + 1] 的
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}
