class Solution {
    func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
        var dict: [Int: Int] = [:]
        for barcode in barcodes {
            dict[barcode, default: 0] += 1
        }
        let sortKeys = dict.keys.sorted { dict[$0]! > dict[$1]! }
        var i = 0
        var ans = Array(repeating: 0, count: barcodes.count)
        for k in sortKeys {
            for _ in 0..<dict[k]! {
                ans[i] = k
                i += 2
                if i >= barcodes.count {
                    i = 1
                }
            }
        }
        return ans
    }
}

Solution().rearrangeBarcodes([1,1,1,1,2,2,2,3,3,4,4,4,4,4,4,4])
