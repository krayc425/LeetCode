class Solution {
    func reverseString(_ s: inout [Character]) {
        var left = 0, right = s.count - 1
        while left < right {
            s.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}

var arr = ["H","a","n","n","a","h"].map { Character($0) }
Solution().reverseString(&arr)
