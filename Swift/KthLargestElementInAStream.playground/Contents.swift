class KthLargest {

    var arr: [Int] = [] // 从大到小排序的数组
    var k: Int
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            add(num)
        }
    }
    
    func add(_ val: Int) -> Int {
        var l = 0
        var r = arr.count - 1
        var idx = 0
        while l <= r {
            let mid = l + (r - l) / 2
            if arr[mid] == val {            // 找到相同数字
                idx = mid
                break
            } else if arr[mid] > val {      // 当前mid的数字比val大，说明要往右找
                l = mid + 1
                idx = l
            } else {                        // 当前mid的数字比val小，说明要往左找
                r = mid - 1
            }
        }
        arr.insert(val, at: idx)
        return arr.count >= k ? arr[k - 1] : 0
    }
    
}


let obj = KthLargest(3, [4,5,8,2])
print(obj.add(3))
print(obj.add(5))
print(obj.add(10))
print(obj.add(9))
print(obj.add(4))

