class Solution {
    func transformArray(_ arr: [Int]) -> [Int] {
        guard arr.count >= 3 else {
            return arr
        }
        var oldArr = arr
        while true {
            var newArr = oldArr
            for i in 1..<arr.count - 1 {
                if newArr[i] < oldArr[i - 1] && newArr[i] < oldArr[i + 1] {
                    newArr[i] += 1
                }
                if newArr[i] > oldArr[i - 1] && newArr[i] > oldArr[i + 1] {
                    newArr[i] -= 1
                }
            }
            if oldArr == newArr {
                break
            } else {
                oldArr = newArr
            }
        }
        return oldArr
    }
}

Solution().transformArray([1,6,3,4,3,5])
