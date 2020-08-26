class Solution {
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var res = Array(repeating: 0, count: n)
        for booking in bookings {
            res[booking[0] - 1] += booking[2]
            if booking[1] < n {
                res[booking[1]] -= booking[2]
            }
        }
        for i in 1..<n {
            res[i] += res[i - 1]
        }
        return res
    }
    
    func corpFlightBookings_TLE(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var res = Array(repeating: 0, count: n)
        for booking in bookings {
            for i in booking[0]...booking[1] {
                res[i - 1] += booking[2]
            }
        }
        return res
    }
}

Solution().corpFlightBookings([[1,2,10],[2,3,20],[2,5,25]], 5)
