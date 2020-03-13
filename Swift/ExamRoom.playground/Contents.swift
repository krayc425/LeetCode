class ExamRoom {
    
    var seats: [Int]
    var capacity: Int

    init(_ N: Int) {
        capacity = N
        seats = []
    }
    
    func seat() -> Int {
        if seats.isEmpty {
            seats.append(0)
            return 0
        } else if seats.count == capacity {
            return -1
        } else {
            var maxGap = seats[0] - 0                   // first gap is the first seat's position - 0
            var insertIdx = 0                           // position's index in seats
            var position = 0                            // position in seats
            for i in 0..<seats.count - 1 {
                let currentGap = (seats[i + 1] - seats[i]) / 2
                if currentGap > maxGap {
                    maxGap = currentGap
                    insertIdx = i + 1                   // insert right after the current i
                    position = seats[i] + currentGap    // value of position is seats[i] + currentGap
                }
            }
            
            if (capacity - 1 - seats.last! > maxGap) {  // if the right-most seat has a bigger gap
                position = capacity - 1
                seats.append(capacity - 1)
            } else {
                seats.insert(position, at: insertIdx)   // else just insert the calculated position
            }
            
            return position
        }
    }
    
    func leave(_ p: Int) {
        seats.remove(at: seats.firstIndex(of: p)!)
    }
    
}

/**
 * Your ExamRoom object will be instantiated and called as such:
 * let obj = ExamRoom(N)
 * let ret_1: Int = obj.seat()
 * obj.leave(p)
 */
