class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        guard !arr.isEmpty && start >= 0 && start < arr.count else {
            return false
        }
        if arr[start] == 0 {
            return true
        }
        var queue: [Int] = [start]
        var visited: Set<Int> = Set(arrayLiteral: start)
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let first = queue.removeFirst()
                if arr[first] == 0 {
                    return true
                }
                let prev = first - arr[first]
                if prev >= 0 && !visited.contains(prev) {
                    queue.append(prev)
                    visited.insert(prev)
                }
                let next = first + arr[first]
                if next < arr.count && !visited.contains(next) {
                    queue.append(next)
                    visited.insert(next)
                }
            }
        }
        return false
    }
}
