class Solution {
    func highFive(_ items: [[Int]]) -> [[Int]] {
        guard !items.isEmpty else {
            return []
        }
        var dict: [Int: [Int]] = [:]
        for item in items {
            dict[item[0], default: []].append(item[1])
        }
        var res: [[Int]] = []
        for (k, v) in dict {
            let five = v.sorted().reversed().prefix(5)
            let avg = five.reduce(0, +) / five.count
            res.append([k, avg])
        }
        res.sort { $0[0] < $1[0] }
        return res
    }
}

Solution().highFive([[1,91],[1,92],[2,93],[2,97],[1,60],[2,77],[1,65],[1,87],[1,100],[2,100],[2,76]])
