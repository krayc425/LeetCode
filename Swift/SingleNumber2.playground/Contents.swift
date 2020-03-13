class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var digits: [Int] = Array<Int>(repeating: 0, count: 32)
        for i in 0..<32 {
            for num in nums {
                digits[i] += (num >> i) & 1;
            }
        }
        var res = 0
        for i in 0..<32 {
            res += (digits[i] % 3 == 0 ? 0 : 1) << i
        }
        return res
    }
}

Solution().singleNumber([-2,-2,1,1,-3,1,-3,-3,-4,-2])
