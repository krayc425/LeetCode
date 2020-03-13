class Solution {
    func threeSumMulti(_ A: [Int], _ target: Int) -> Int {
        guard A.count >= 3 else {
            return 0
        }
        var map: [Int: Int] = [:]
        let mod: Int = Int(1e9) + 7
        var res: Int = 0
        for i in 0..<A.count {
            for j in (i+1)..<A.count {
                let sum2Idx = A[i] + A[j]
                if let val = map[target - sum2Idx] {
                    res += val
                }
            }
            if let val = map[A[i]] {
                map[A[i]] = val + 1
            } else {
                map[A[i]] = 1
            }
        }
        return res % mod
    }
}
