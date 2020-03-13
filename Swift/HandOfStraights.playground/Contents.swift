class Solution {
    func isNStraightHand(_ hand: [Int], _ W: Int) -> Bool {
        guard !hand.isEmpty && hand.count % W == 0 else {
            return false
        }
        if W == 1 {
            return true
        }
        var hand = hand.sorted()
        while !hand.isEmpty {
            let first = hand.first!
            for i in 0..<W {
                if !hand.contains(first + i) {
                    return false
                } else {
                    hand.remove(at: hand.firstIndex(of: first + i)!)
                }
            }
        }
        return true
    }
    
    func isNStraightHand_2(_ hand: [Int], _ W: Int) -> Bool {
        guard !hand.isEmpty && hand.count % W == 0 else {
            return false
        }
        if W == 1 {
            return true
        }
        var dict: [Int: Int] = [:]
        for i in hand {
            dict[i, default: 0] += 1
        }
        var handUnique = Array(Set(hand)).sorted()
        if handUnique.count < W {
            return false
        }
        for i in 0...handUnique.count - W {
            let count = dict[handUnique[i]]!
            if count == 0 {
                continue
            } else {
                dict[handUnique[i]]! -= count
                for j in (i + 1)..<(i + W) {
                    dict[handUnique[j]]! -= count
                    if handUnique[j] - handUnique[j - 1] != 1 {
                        return false
                    }
                    if dict[handUnique[j]]! < 0 {
                        return false
                    }
                }
            }
        }
        return dict.filter { $0.value > 0 }.count == 0
    }
}

//Solution().isNStraightHand([1,2], 2)
Solution().isNStraightHand_2([1,2], 2)
