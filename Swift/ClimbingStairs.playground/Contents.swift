class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        var arr = [1, 2]
        for i in 2..<n {
            arr.append(arr[i - 2] + arr[i - 1])
        }
        return arr.last!
    }
}
