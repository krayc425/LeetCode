class Solution {
    func alienOrder(_ words: [String]) -> String {
        var inDegree: [Character: Int] = [:]
        var orderMap: [Character: [Character]] = [:]
        for word in words {
            for char in word {
                inDegree[char] = 0
                orderMap[char] = []
            }
        }
        for i in 1..<words.count {
            let first = Array(words[i - 1])
            let second = Array(words[i])
            if first.count > second.count && words[i - 1].prefix(second.count) == words[i] {
                return ""
            }
            for j in 0..<first.count {
                let c1 = first[j]
                let c2 = second[j]
                if c1 != c2 {
                    if !orderMap[c1]!.contains(c2) {
                        orderMap[c1, default: []].append(c2)
                        inDegree[c2, default: 0] += 1
                    }
                    break
                }
            }
        }
        var queue: [Character] = []
        for (char, count) in inDegree {
            if count == 0 {
                queue.append(char)
            }
        }
        var res = ""
        while !queue.isEmpty {
            let char = queue.removeFirst()
            res.append(char)
            if let children = orderMap[char] {
                for child in children {
                    inDegree[child]! -= 1
                    if inDegree[child] == 0 {
                        queue.append(child)
                    }
                }
            }
        }
        return res.count == orderMap.count ? res : ""
    }
}

Solution().alienOrder(["abc","ab"])
Solution().alienOrder(["za","zb","ca","cb"])
Solution().alienOrder(["wrt","wrf","er","ett","rftt"])
