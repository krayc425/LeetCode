import Foundation

class Solution {
    func sumFourDivisors(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var res = 0
        for num in nums {
            var divisors: [Int] = []
            let sqrtNum = Int(sqrt(Double(num)))
            for i in 1...sqrtNum {
                if num % i == 0 {
                    divisors.append(contentsOf: [i, num / i])
                }
            }
            let divisorsSet = Set(divisors)
            if divisorsSet.count == 4 {
                res += divisorsSet.reduce(0, +)
            }
        }
        return res
    }
}

Solution().sumFourDivisors([1,2,3,4,5,6,7,8,9,10])
