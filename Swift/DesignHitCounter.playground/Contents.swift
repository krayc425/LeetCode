class HitCounter {

    var dict: [Int: Int]
    
    /** Initialize your data structure here. */
    init() {
        dict = [:]
    }
    
    /** Record a hit.
        @param timestamp - The current timestamp (in seconds granularity). */
    func hit(_ timestamp: Int) {
        dict[timestamp, default: 0] += 1
    }
    
    /** Return the number of hits in the past 5 minutes.
        @param timestamp - The current timestamp (in seconds granularity). */
    func getHits(_ timestamp: Int) -> Int {
        var res = 0
        for i in (timestamp - 299)...timestamp {
            if let count = dict[i] {
                res += count
            }
        }
        return res
    }

}

/**
 * Your HitCounter object will be instantiated and called as such:
 * let obj = HitCounter()
 * obj.hit(timestamp)
 * let ret_2: Int = obj.getHits(timestamp)
 */
