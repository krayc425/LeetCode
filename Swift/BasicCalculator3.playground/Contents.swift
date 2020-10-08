class Solution {
    func calculate(_ s: String) -> Int {
        var stack: [Int] = []
        var lastOp: Character = "+"
        var currNum = 0
        var chars = Array(s + "+")
        for (idx, char) in chars.enumerated() {
            if chars[idx].isWhitespace {
                continue
            }
            if let num = char.wholeNumberValue {
                currNum = currNum * 10 + num
            } else {
                if char == "(" {
                    let startIdx = idx + 1
                    var leftCount = 1
                    var endIdx = startIdx
                    while chars[endIdx] != ")" || leftCount != 1 {
                        if chars[endIdx] == "(" {
                            leftCount += 1
                        } else if chars[endIdx] == ")" {
                            leftCount -= 1
                        }
                        endIdx += 1
                    }
                    currNum = calculate(String(chars[startIdx..<endIdx]))
                    for i in idx...endIdx {
                        chars[i] = " "
                    }
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
        }
        return stack.reduce(0, +)
    }
}

Solution().calculate(" 3*(5 + 2 )")
Solution().calculate("(2+6* 3+5- (3*14/7+2)*5)+3")
Solution().calculate("2*(5+5*2)/3+(6/2+8)")
