class Solution {
    func numberOfMatches(_ n: Int) -> Int {
        var res = 0
        var n = n
        while n > 1 {
            if n % 2 == 0 {
                res += (n / 2)
                n /= 2
            } else {
                res += ((n - 1) / 2)
                n = (n + 1) / 2
            }
        }
        return res
    }
}
