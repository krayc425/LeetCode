
class MyQueue {
    
    var stackA: [Int]
    var stackB: [Int]
    
    /** Initialize your data structure here. */
    init() {
        stackA = []
        stackB = []
    }
    
    func aToB() {
        if stackB.isEmpty { // 反正每次Pop的时候都是从stackB里面出，直到B空了以后才可以继续从A往B里倒
            while !stackA.isEmpty {
                stackB.append(stackA.removeLast())
            }
        }
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stackA.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        aToB()
        return stackB.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        aToB()
        return stackB[stackB.count - 1]
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stackB.isEmpty && stackA.isEmpty
    }
    
}

let s = MyQueue()
s.push(1)
s.push(2)
s.push(3)
s.push(4)
s.pop()
s.peek()
s.push(5)
s.pop()
s.pop()
s.push(6)
