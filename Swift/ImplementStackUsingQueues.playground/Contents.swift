
class MyStack {
    
    var queue: [Int]
    
    /** Initialize your data structure here. */
    init() {
        queue = []
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        let oldCount = queue.count
        queue.append(x)
        for _ in 0..<oldCount {
            let first = queue.removeFirst()
            queue.append(first)
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return queue.removeFirst()
    }
    
    /** Get the top element. */
    func top() -> Int {
        return queue[0]
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue.isEmpty
    }
}

let s = MyStack()
s.push(1)
s.push(2)
s.push(3)
s.top()
