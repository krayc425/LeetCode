class Solution {
    func decodeString(_ s: String) -> String {
        var stack: [Character] = []
        var times: [Int] = []
        var temp: String = ""
        var prevIsNumber = false
        for char in s {
            if char.isLetter || char == "[" {
                stack.append(char)
                prevIsNumber = false
            } else if char.isNumber {
                if prevIsNumber {
                    times[times.count - 1] *= 10
                    times[times.count - 1] += char.wholeNumberValue!
                } else {
                    times.append(char.wholeNumberValue!)
                }
                prevIsNumber = true
            } else if char == "]" {
                while let last = stack.last {
                    if last == "[" {
                        stack.removeLast()
                        break
                    } else {
                        temp.append(stack.removeLast())
                    }
                }
                for _ in 0..<times.removeLast() {
                    for char in temp.reversed() {
                        stack.append(char)
                    }
                }
                temp = ""
                prevIsNumber = false
            }
        }
        var res = ""
        while !stack.isEmpty {
            res.append(stack.removeFirst())
        }
        return res
    }
}

Solution().decodeString("3[a2[c]]")
Solution().decodeString("10[leetcode]")
