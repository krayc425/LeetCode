class Solution {
    func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        var tx = tx
        var ty = ty
        while sx < tx && sy < ty {
            if tx < ty {
                ty %= tx
            } else {
                tx %= ty
            }
        }
        return (sx == tx && sy <= ty && (ty - sy) % sx == 0)
            || (sy == ty && sx <= tx && (tx - sx) % sy == 0)
    }
}

Solution().reachingPoints(9,10,9,19)
