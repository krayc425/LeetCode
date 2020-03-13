class Solution {
    func isUgly(_ num: Int) -> Bool {
        if num <= 0 {
            return false
        }
        if num == 1 {
            return true
        }
        var num = num
        while Double(num) / 5.0 == Double(num / 5) {
            num /= 5
        }
        while Double(num) / 3.0 == Double(num / 3) {
            num /= 3
        }
        while Double(num) / 2.0 == Double(num / 2) {
            num /= 2
        }
        return num == 1
    }
}

Solution().isUgly(125)
