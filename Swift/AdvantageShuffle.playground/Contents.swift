class Solution {
    func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
        var sortedA = A.sorted()
        var res: [Int] = []
        for num in B {
            var left = 0
            var right = sortedA.count - 1
            while left < right {
                let mid = left + (right - left) / 2
                if sortedA[mid] <= num {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            res.append(sortedA[left] > num ? sortedA.remove(at: left) : sortedA.removeFirst())
        }
        return res
    }
}

Solution().advantageCount([2,7,11,15], [1,10,4,11])
Solution().advantageCount([12,24,8,32], [13,25,32,11])
Solution().advantageCount([2,0,4,1,2], [1,3,0,0,2])
