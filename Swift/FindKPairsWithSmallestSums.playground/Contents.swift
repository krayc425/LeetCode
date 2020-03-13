struct Pair {
    var x: Int
    var y: Int
    var sum: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
        self.sum = x + y
    }
}

class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var tmp: [Pair] = []
        for i in nums1 {
            for j in nums2 {
                tmp.append(Pair(i, j))
            }
        }
        tmp.sort { (p1, p2) -> Bool in
            p1.sum < p2.sum
        }
        var res: [[Int]] = []
        for i in 0..<min(k, tmp.count) {
            let pair = tmp[i]
            res.append([pair.x, pair.y])
        }
        return res
    }
}
