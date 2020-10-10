class Solution {
    func countArrangement(_ N: Int) -> Int {
        var count = 0
        var visited = Array(repeating: false, count: N + 1)
        helper(1, N, &visited, &count)
        return count
    }
    
    func helper(_ index: Int, _ n: Int, _ visited: inout [Bool], _ count: inout Int) {
        if index > n {
            count += 1
            return
        }
        for i in 1...n {
            if !visited[i] && (index % i == 0 || i % index == 0) {
                visited[i] = true
                helper(index + 1, n, &visited, &count)
                visited[i] = false
            }
        }
    }
}

Solution().countArrangement(10)
