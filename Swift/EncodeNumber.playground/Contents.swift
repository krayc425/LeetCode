class Solution {
    func encode(_ num: Int) -> String {
        var num = num + 1
        var res = ""
        while num > 0 {
            res += String(num % 2)
            num /= 2
        }
        return String(res.reversed().dropFirst())
    }
}

Solution().encode(0)
