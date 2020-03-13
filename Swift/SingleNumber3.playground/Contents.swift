class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var res = [0, 0]
        var tmp = 0
        for num in nums {
            tmp ^= num
        }
        tmp &= -tmp
        for num in nums {
            res[num & tmp > 0 ? 1 : 0] ^= num
        }
        return res
    }
}
