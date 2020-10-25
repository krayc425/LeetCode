class Solution {
    func minAreaRect(_ points: [[Int]]) -> Int {
        var res = Int.max
        let set = Set(points)
        for topRight in set {
            for bottomLeft in set {
                if topRight[0] > bottomLeft[0] && topRight[1] > bottomLeft[1]
                    && set.contains([bottomLeft[0], topRight[1]])
                    && set.contains([topRight[0], bottomLeft[1]]){
                    res = min(res, (topRight[0] - bottomLeft[0]) * (topRight[1] - bottomLeft[1]))
                }
            }
        }
        return res == Int.max ? 0 : res
    }
}
