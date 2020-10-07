class Solution {
    func calculate(_ s: String) -> Int {
        var stack: [Int] = []
        var lastOp: Character = "+"
        var currNum = 0
        for char in s + "+" where !char.isWhitespace {
            if let num = char.wholeNumberValue {
                currNum = currNum * 10 + num
            } else {
                switch lastOp {
                case "+":
                    stack.append(currNum)
                case "-":
                    stack.append(-currNum)
                case "*":
                    stack.append(stack.removeLast() * currNum)
                case "/":
                    stack.append(stack.removeLast() / currNum)
                default:
                    break
                }
                currNum = 0
                lastOp = char
            }
        }
        return stack.reduce(0, +)
    }
}

Solution().calculate(" 3+5 / 2 ")
