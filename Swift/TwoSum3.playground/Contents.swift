class TwoSum {
    
    var arr: [Int]

    /** Initialize your data structure here. */
    init() {
        arr = []
    }
    
    /** Add the number to an internal data structure.. */
    func add(_ number: Int) {
        for i in 0..<arr.count {
            if arr[i] > number {
                arr.insert(number, at: i)
                return
            }
        }
        arr.append(number)
    }
    
    /** Find if there exists any pair of numbers which sum is equal to the value. */
    func find(_ value: Int) -> Bool {
        var head = 0
        var rear = arr.count - 1
        while head < rear {
            let sum = arr[head] + arr[rear]
            if sum == value {
                return true
            } else if sum < value {
                head += 1
            } else {
                rear -= 1
            }
        }
        return false
    }
    
}


let obj = TwoSum()
obj.add(3)
obj.add(2)
obj.add(1)
print(obj.find(2))


