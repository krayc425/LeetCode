class MaxStack {
    
    var stack: [Int]
    var maxStack: [Int]

    /** initialize your data structure here. */
    init() {
        stack = []
        maxStack = []
    }
    
    func push(_ x: Int) {
        stack.append(x)
        maxStack.append(max(maxStack.last ?? Int.min, x))
    }
    
    func pop() -> Int {
        maxStack.removeLast()
        return stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func peekMax() -> Int {
        return maxStack.last!
    }
    
    func popMax() -> Int {
        let maxElement = maxStack.last!
        var tmp: [Int] = []
        // 用 popLast, 如果正好比较到maxElement就不用加入tmp了，达到了popMax的效果
        while let last = stack.popLast() {
            maxStack.removeLast()
            if last == maxElement {
                break
            } else {
                tmp.append(last)
            }
        }
        while let last = tmp.popLast() {
            self.push(last)
        }
        return maxElement
    }
}
