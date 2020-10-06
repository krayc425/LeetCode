class Solution {
    func maxWidthRamp(_ A: [Int]) -> Int {
        guard A.count > 1 else {
            return 0
        }
        // Sort by value first, index second
        let a = A.enumerated().sorted { (lhs, rhs) -> Bool in
            if (lhs.element != rhs.element) {
                return lhs.element < rhs.element
            }
            return lhs.offset < rhs.offset
        }
        var minIndex = Int.max
        var res = 0
        for i in 1..<a.count {
            minIndex = min(minIndex, a[i - 1].offset)
            res = max(res, a[i].offset - minIndex)
        }
        return max(0, res)
    }
}
