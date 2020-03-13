class Solution {
    
    var numStack: [Int] = []
    
    func evalRPN(_ tokens: [String]) -> Int {
        for token in tokens {
            if let num = Int(token) {
                numStack.append(num)
            } else {
                let op1 = numStack.removeLast()
                let op2 = numStack.removeLast()
                numStack.append(operate(op1, op2, token))
            }
        }
        return numStack.last!
    }
    
    func operate(_ op1: Int, _ op2: Int, _ operator: String) -> Int {
        switch `operator` {
        case "+":
            return op2 + op1
        case "-":
            return op2 - op1
        case "*":
            return op2 * op1
        case "/":
            return Int(op2 / op1)
        default:
            return 0
        }
    }
    
}

Solution().evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])
