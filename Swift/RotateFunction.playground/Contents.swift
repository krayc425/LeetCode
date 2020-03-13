class Solution {
    func maxRotateFunction(_ A: [Int]) -> Int {
        guard !A.isEmpty else {
            return 0
        }
        let cnt = A.count
        let arr = [Int](0..<cnt)
        var res = Int.min
        for i in 0..<cnt {
            res = max(res, multiple(arr, [Int](A[i...] + A[0..<i])))
        }
        return res
    }
    
    func multiple(_ arr1: [Int], _ arr2: [Int]) -> Int {
        guard arr1.count == arr2.count else {
            return 0
        }
        var res = 0
        for i in 0..<arr2.count {
            res += arr1[i] * arr2[i]
        }
        return res
    }
}

Solution().maxRotateFunction([4, 3, 2, 6])
