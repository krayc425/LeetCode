class Solution {
    func prevPermOpt1(_ A: [Int]) -> [Int] {
        var res = A
        for i in stride(from: res.count - 1, to: 0, by: -1) {
            if res[i - 1] > res[i] {
                var maxSmallerThanPrev = Int.min
                var maxSmallerThanPrevIdx = 0
                for j in i..<res.count {
                    if res[j] < res[i - 1] && res[j] > maxSmallerThanPrev {
                        maxSmallerThanPrev = res[j]
                        maxSmallerThanPrevIdx = j
                    }
                }
                if maxSmallerThanPrev != Int.min {
                    res.swapAt(maxSmallerThanPrevIdx, i - 1)
                    return res
                }
            }
        }
        return res
    }
}

Solution().prevPermOpt1([90,27,11,12,57,87])
Solution().prevPermOpt1([3,2,1])
Solution().prevPermOpt1([1,1,5])
Solution().prevPermOpt1([1,9,4,6,7])
Solution().prevPermOpt1([3,1,1,3])
