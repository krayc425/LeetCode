class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        } else {
            return getSum(a ^ b, (a & b) << 1)
        }
    }
}

/**
 * carry = a & b
 * sum of 2 bits = a ^ b
 * shift left carry until carry is 0 to calculate sum
 */
