class Solution {
    func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        var res = 0
        var temp = arr.prefix(k)
        var sum = arr.prefix(k).reduce(0, +)
        for i in k...arr.count {
            if sum >= k * threshold {
                res += 1
            }
            if i == arr.count {
                break
            }
            sum -= temp.removeFirst()
            sum += arr[i]
            temp.append(arr[i])
        }
        return res
    }
}

Solution().numOfSubarrays([2,2,2,2,5,5,5,8], 3, 4)
