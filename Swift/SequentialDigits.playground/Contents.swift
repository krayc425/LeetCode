class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var res: [Int] = []
        let power = getPower(low)
        for i in 0...9 {
            helper(i, power, low, high, &res)
        }
        return res.sorted()
    }
    
    func helper(_ num: Int, _ power: Int, _ low: Int, _ high: Int, _ res: inout [Int]) {
        var num = num
        guard num != 0 else {
            return
        }
        for _ in 0..<power {
            if num % 10 != 9 {
                num = num * 10 + (num % 10 + 1)
            } else {
                return
            }
        }
        if num >= low && num <= high {
            res.append(num)
        }
        helper(num, 1, low, high, &res)
    }
    
    func getPower(_ num: Int) -> Int {
        var num = num
        var pow = 0
        while num >= 10 {
            num /= 10
            pow += 1
        }
        return pow
    }
}

Solution().sequentialDigits(10, 300020)
