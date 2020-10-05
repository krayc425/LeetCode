class Solution {
    func numberOfSteps (_ num: Int) -> Int {
        var res = 0
        var num = num
        while num > 0 {
            if num % 2 == 0 {
                num /= 2
            } else {
                num -= 1
            }
            res += 1
        }
        return res
    }
}

Solution().numberOfSteps(0)
Solution().numberOfSteps(123)
Solution().numberOfSteps(1_000_000)
