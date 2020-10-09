class Solution {
    func lastRemaining(_ n: Int) -> Int {
        var remainedCount = n
        var right = n
        var left = 1
        var fromLeft = true
        var i = 1
        while left != right {
            if remainedCount % 2 == 1 {
                right -= i
                left += i
            } else {
                if !fromLeft {
                    right -= i
                } else {
                    left += i
                }
            }
            remainedCount /= 2
            i *= 2
            fromLeft.toggle()
        }
        return left
    }
}

Solution().lastRemaining(9)
