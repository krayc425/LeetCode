class Solution {
    func addDigits(_ num: Int) -> Int {
        var result = num
        while result >= 10 {
            var temp = 0
            while result > 0 {
                temp += result % 10
                result /= 10
            }
            result = temp
        }
        return result
    }
}

Solution().addDigits(38)
