class Solution {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        let heaters = heaters.sorted()
        var result = 0
        
        for house in houses {
            // 计算当前house和最近的heater之间的距离
            let cur = abs(house - findClosestHeater(house: house, heaters: heaters))
            // 更新最大值
            result = max(result, cur)
        }
            
        return result
    }
    
    // 找到离这个house最近的heater
    func findClosestHeater(house: Int, heaters: [Int]) -> Int {
        // 用二分法找到第一个在house后面的heater
        var low = 0
        var high = heaters.count - 1
        while low < high {
            let mid = low + (high - low) / 2
            if house > heaters[mid] {
                low = mid + 1
            } else {
                high = mid
            }
        }
        if low > 0 {
            // 不是第一个heater
            return heaters[low] - house > house - heaters[low - 1] ? heaters[low - 1] : heaters[low]
        } else {
            // 是第一个heater
            return heaters[low]
        }
    }
}
