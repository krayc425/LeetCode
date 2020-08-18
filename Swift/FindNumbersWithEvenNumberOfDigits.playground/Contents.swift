class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        return nums.filter { getDigits($0) % 2 == 0 }.count
    }
    
    func getDigits(_ num: Int) -> Int {
        var res = 0
        var num = num
        while num > 0 {
            res += 1
            num /= 10
        }
        return res
    }
}

Solution().findNumbers([12,345,2,6,7896])
