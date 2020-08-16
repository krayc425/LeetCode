class ProductOfNumbers {

    var list: [Int]
    var prefix: [Int]
    var shouldReturnZeroIndex: Int
    
    init() {
        list = []
        prefix = []
        shouldReturnZeroIndex = -1
    }
    
    func add(_ num: Int) {
        list.append(num)
        if num == 0 {
            prefix = Array(repeating: 0, count: prefix.count)
            shouldReturnZeroIndex = prefix.count
            prefix.append(num)
        } else {
            if let last = prefix.last {
                prefix.append(last == 0 ? num : last * num)
            } else {
                prefix.append(num)
            }
        }
    }
    
    func getProduct(_ k: Int) -> Int {
        if k == prefix.count {
            return prefix.first! == 0 ? 0 : prefix.last!
        }
        if list.count - 1 - k < shouldReturnZeroIndex {
            return 0
        }
        if list.count - 1 - k == shouldReturnZeroIndex {
            return prefix.last!
        }
        return Int(prefix.last! / prefix[prefix.count - k - 1])
    }

}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * let obj = ProductOfNumbers()
 * obj.add(num)
 * let ret_2: Int = obj.getProduct(k)
 */
let obj = ProductOfNumbers()
obj.add(0)
obj.add(0)
obj.add(2)
obj.add(5)
obj.add(4)
print(obj.getProduct(2))
print(obj.getProduct(3))
print(obj.getProduct(4))
obj.add(8)
print(obj.getProduct(2))
