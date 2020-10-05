class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        var stack: [String] = []
        let preorder = preorder.split(separator: ",")
        for node in preorder {
            while !stack.isEmpty && stack.last! == "#" {
                stack.removeLast()
                if stack.isEmpty {
                    return false
                }
                stack.removeLast()
            }
            stack.append(String(node))
        }
        return stack.count == 1 && stack[0] == "#"
    }
}

Solution().isValidSerialization("9,3,4,#,#,1,#,#,2,#,6,#,#")
Solution().isValidSerialization("9,#,#,1")
