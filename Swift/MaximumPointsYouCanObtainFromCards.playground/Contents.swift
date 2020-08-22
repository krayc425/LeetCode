class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        guard !cardPoints.isEmpty else {
            return 0
        }
        let sum = cardPoints.reduce(0, +)
        let count = cardPoints.count
        if count == k {
            return sum
        }
        var res = sum
        var left = 0
        var right = left + count - k - 1
        var currSum = cardPoints[left...right].reduce(0, +)
        while true {
            res = min(res, currSum)
            currSum -= cardPoints[left]
            left += 1
            right += 1
            if right == count {
                break
            }
            currSum += cardPoints[right]
        }
        return sum - res
    }
}

Solution().maxScore([1,2,3,4,5,6,1], 3)
Solution().maxScore([2,2,2], 2)
Solution().maxScore([9,7,7,9,7,7,9], 7)
Solution().maxScore([1,1001,1], 1)
Solution().maxScore([1,79,80,1,1,1,200,1], 3)
