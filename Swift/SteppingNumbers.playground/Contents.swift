class Solution {
    func countSteppingNumbers(_ low: Int, _ high: Int) -> [Int] {
        var res: [Int] = []
        for i in 0...9 {
            helper(i, low, high, &res)
        }
        return res.sorted()
    }
    
    func helper(_ num: Int, _ low: Int, _ high: Int, _ res: inout [Int]) {
        if num >= low && num <= high {
            res.append(num)
        }
        guard num > 0 && num <= high else {
            return
        }
        let base = num * 10
        let mod = num % 10
        if mod == 0 {
            helper(base + (mod + 1), low, high, &res)
        } else if mod == 9 {
            helper(base + (mod - 1), low, high, &res)
        } else {
            helper(base + (mod + 1), low, high, &res)
            helper(base + (mod - 1), low, high, &res)
        }
    }
    
    // --------------------------------------------------------------
    
    func countSteppingNumbers_TLE(_ low: Int, _ high: Int) -> [Int] {
        return Array(low...high).filter { isSteppingNumbers($0) }
    }
    
    func isSteppingNumbers(_ n: Int) -> Bool {
        var res = true
        var n = n
        var temp = n % 10
        while n / 10 > 0 {
            n /= 10
            let temp2 = n % 10
            if abs(temp2 - temp) != 1 {
                res = false
                break
            }
            temp = temp2
        }
        return res
    }
}

Solution().countSteppingNumbers(0, 1000000000)
