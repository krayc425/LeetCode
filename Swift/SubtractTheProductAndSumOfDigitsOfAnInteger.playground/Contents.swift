class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        var product = 1
        var sum = 0
        var n = n
        while n > 0 {
            let d = n % 10
            product *= d
            sum += d
            n /= 10
        }
        return product - sum
    }
}
