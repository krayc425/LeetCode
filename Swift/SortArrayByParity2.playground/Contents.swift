class Solution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var odd = 1
        var even = 0
        var res = [Int](repeating: 0, count: A.count)
        for num in A {
            if num & 1 == 1 {
                res[odd] = num
                odd += 2
            } else {
                res[even] = num
                even += 2
            }
        }
        return res
    }
}
