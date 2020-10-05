class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var temp: [String] = []
        helper(&temp, "", 0, 0, n)
        return temp
    }
    
    func helper(_ temp: inout [String], _ curr: String, _ left: Int, _ right: Int, _ n: Int) {
        if curr.count == n * 2 {
            temp.append(curr)
            return
        }
        if left < n {
            helper(&temp, curr + "(", left + 1, right, n)
        }
        if right < left {
            helper(&temp, curr + ")", left, right + 1, n)
        }
    }
}

Solution().generateParenthesis(3)
