class Solution {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var res = 0
        var dict: [Int: Int] = [:]
        for t in time {
            let remained = t % 60
            res += dict[(60 - remained) % 60] ?? 0
            dict[remained, default: 0] += 1
        }
        return res
    }
}

Solution().numPairsDivisibleBy60([30,20,150,100,40])
Solution().numPairsDivisibleBy60([60,60,60])
