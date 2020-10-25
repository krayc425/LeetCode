class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        if numerator == 0 {
            return "0"
        }
        var res = ""
        if (numerator < 0 && denominator > 0) || (numerator > 0 && denominator < 0) {
            res.append("-")
        }
        let numerator = abs(numerator)
        let denominator = abs(denominator)
        res.append(String(numerator / denominator))
        var remainder = numerator % denominator
        if remainder == 0 {
            return res
        }
        res.append(".")
        var dict: [Int: Int] = [:]
        while remainder != 0 {
            remainder *= 10
            res.append(String(remainder / denominator))
            remainder %= denominator
            if let index = dict[remainder] {
                res.insert("(", at: res.index(res.startIndex, offsetBy: index))
                res.append(")")
                break
            } else {
                dict[remainder] = res.count
            }
        }
        return res
    }
}
