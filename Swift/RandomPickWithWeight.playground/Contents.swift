class Solution {

    var total: Int
    var preSum: [Int]
    
    init(_ w: [Int]) {
        total = 0
        preSum = []
        for num in w {
            total += num
            preSum.append(total)
        }
    }
    
    func pickIndex() -> Int {
        let target = Int.random(in: 0..<total)
        var l = 0
        var r = preSum.count - 1
        while l < r {
            let mid = l + (r - l) / 2
            if preSum[mid] <= target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }
    
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */
