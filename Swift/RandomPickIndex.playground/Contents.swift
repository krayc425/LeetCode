class Solution {

    var dict: [Int: [Int]] = [:]
    
    init(_ nums: [Int]) {
        for (idx, num) in nums.enumerated() {
            dict[num, default: []].append(idx)
        }
    }
    
    func pick(_ target: Int) -> Int {
        return dict[target]!.randomElement()!
    }
    
}
