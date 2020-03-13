class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        let count = popped.count
        var tmp: [Int] = []
        var i = 0
        for num in pushed {
            tmp.append(num)
            // 一旦栈顶的值 == 当前pop的值，就开始pop，不然以后再没机会pop了
            while i < count && !tmp.isEmpty && tmp.last! == popped[i] {
                tmp.removeLast()
                i += 1
            }
        }
        return i == count
    }
}
