class Solution {
    
    let digits: [Character] = ["0","1","2","3","4","5","6","7","8","9"]
    
    func openLock(_ deadends: [String], _ target: String) -> Int {
        var step = 0
        let deadends = Set(deadends)
        var queue: [String] = ["0000"]
        var visited: Set<String> = Set(arrayLiteral: "0000")
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let curr = queue.removeFirst()
                if deadends.contains(curr) {
                    continue
                }
                if curr == target {
                    return step
                }
                for i in 0..<target.count {
                    let up = turnUp(curr, i)
                    if !visited.contains(up) {
                        queue.append(up)
                        visited.insert(up)
                    }
                    let down = turnDown(curr, i)
                    if !visited.contains(down) {
                        queue.append(down)
                        visited.insert(down)
                    }
                }
            }
            step += 1
        }
        return -1
    }
    
    func turnUp(_ s: String, _ pos: Int) -> String {
        var char = Array(s)
        char[pos] = digits[(digits.firstIndex(of: char[pos])! + 1) % digits.count]
        return String(char)
    }
    
    func turnDown(_ s: String, _ pos: Int) -> String {
        var char = Array(s)
        char[pos] = digits[(digits.firstIndex(of: char[pos])! + digits.count - 1) % digits.count]
        return String(char)
    }
    
}

Solution().openLock(["0201","0101","0102","1212","2002"], "0202")
