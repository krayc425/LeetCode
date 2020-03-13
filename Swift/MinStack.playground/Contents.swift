class MinStack {
    
    var stack: [Int]
    var minStack: [Int]
    
    init() {
        stack = []
        minStack = []
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if let last = minStack.last, last <= x {
            minStack.append(last)
        } else {
            minStack.append(x)
        }
    }
    
    func pop() {
        guard !stack.isEmpty && !minStack.isEmpty else {
            return
        }
        stack.removeLast()
        minStack.removeLast()
    }
    
    func top() -> Int {
        if stack.isEmpty {
            return 0
        }
        return stack.last ?? 0
    }
    
    func getMin() -> Int {
        if minStack.isEmpty {
            return 0
        }
        return minStack.last ?? 0
    }
    
}


let obj = MinStack()
obj.push(1)
obj.push(3)
obj.push(2)
let ret_3: Int = obj.top()
let ret_4: Int = obj.getMin()
