class Solution {
    func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
        if n == 1 {
            return [Int](0...9)
        }
        var queue = [Int](1...9)
        for _ in 1..<n {
            var nextQueue: [Int] = []
            for num in queue {
                let lastDigit = num % 10
                var nextDigits = [lastDigit + k]
                if k != 0 {
                    nextDigits.append(lastDigit - k)
                }
                for digit in nextDigits where digit >= 0 && digit < 10 {
                    nextQueue.append(num * 10 + digit)
                }
            }
            queue = nextQueue
        }
        return queue
    }
}

Solution().numsSameConsecDiff(3, 7)
//Solution().numsSameConsecDiff(9, 0)
