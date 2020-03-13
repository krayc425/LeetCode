import Foundation

class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        if num <= 1 {
            return false
        }
        var result = 1
        var i = 2
        while i <= num / i {
            if num % i == 0 {
                result += i + num / i
            }
            i += 1
        }
        return result == num
    }
}

Solution().checkPerfectNumber(16)
