class Solution {
    func consecutiveNumbersSum(_ N: Int) -> Int {
        var res = 0
        var sum = 0
        var i = 1
        while true {
            if sum >= N {
                break
            }
            sum += i
            if (N - sum) % i == 0 {
                res += 1
            }
            i += 1
        }
        return res
    }
}
