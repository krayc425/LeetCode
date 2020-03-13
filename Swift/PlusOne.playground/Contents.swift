class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        if digits.count == 0 {
            return []
        }
        if digits == [0] {
            return [1]
        }
        var result: [Int] = []
        var reversed: [Int] = digits.reversed()
        reversed[0] += 1
        var carry = 0
        for num in reversed {
            var temp = carry + num
            if temp >= 10 {
                carry = 1
                temp -= 10
            } else {
                carry = 0
            }
            result.append(temp)
        }
        if carry == 1 {
            result.append(carry)
        }
        return result.reversed()
    }
}

Solution().plusOne([9,9,9,9,9,9,9])
