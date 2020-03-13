class Solution {
    func readBinaryWatch(_ num: Int) -> [String] {
        var res: [String] = []
        for hour in 0...11 {
            for minute in 0...59 {
                if numOfOnes(in: hour) + numOfOnes(in: minute) == num {
                    res.append(String(hour) + (minute < 10 ? ":0" : ":") + String(minute))
                }
            }
        }
        return res
    }
    
    func numOfOnes(in num: Int) -> Int {
        var num = num
        var res = 0
        while num > 0 {
            res += 1
            num = ((num - 1) & num) >> 1
        }
        return res
    }
}

Solution().readBinaryWatch(1)
