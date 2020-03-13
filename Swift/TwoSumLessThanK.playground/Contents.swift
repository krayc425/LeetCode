class Solution {
    func twoSumLessThanK(_ A: [Int], _ K: Int) -> Int {
        let arr = A.sorted()
        var res = -1
        var l = 0
        var r = A.count - 1
        while l < r {
            let sum = arr[l] + arr[r]
            if sum < K {
                res = max(res, sum)
                l += 1
            } else {
                r -= 1
            }
        }
        return res
    }
}
