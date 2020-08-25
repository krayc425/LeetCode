class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        guard !s.isEmpty && k > 1 else {
            return s
        }
        var stack: [Int] = []
        var sArray = Array(s)
        var j = 0
        for i in 0..<s.count {
            sArray[j] = sArray[i]
            if j == 0 || sArray[j] != sArray[j - 1] {
                stack.append(1)
            } else {
                let last = stack.removeLast() + 1
                if last == k {
                    j -= k
                } else {
                    stack.append(last)
                }
            }
            j += 1
        }
        return String(sArray[0..<j])
    }

    func removeDuplicates_TLE(_ s: String, _ k: Int) -> String {
        guard !s.isEmpty && k > 1 else {
            return s
        }
        var stack: [Character] = []
        for char in s {
            if stack.count >= k - 1 {
                let lastKMinus1 = stack.dropFirst(stack.count - k + 1)
                if lastKMinus1.filter({ $0 == char }).count == k - 1 {
                    stack.removeLast(k - 1)
                    continue
                }
            }
            stack.append(char)
        }
        var res = ""
        for char in stack {
            res += String(char)
        }
        return res
    }
}

Solution().removeDuplicates("deeedbbcccbdaa", 3)
Solution().removeDuplicates("pbbcggttciiippooaais", 2)
Solution().removeDuplicates("abcdc", 2)
