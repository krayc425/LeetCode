import Foundation

class Solution {
    func getFactors(_ n: Int) -> [[Int]] {
        guard n > 2 else {
            return []
        }
        var res: [[Int]] = []
        process(n, 2, [], &res)
        return res
    }
    
    func process(_ n: Int, _ start: Int, _ tmp: [Int], _ res: inout [[Int]]) {
        let sroot = Int(ceil(sqrt(Double(n))))
        guard start <= sroot else {
            return
        }
        for i in start...sroot where n % i == 0 && n / i >= i {
            res.append(tmp + [i, n / i])
            process(n / i, i, tmp + [i], &res)
        }
    }
}

Solution().getFactors(100)
