class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var count = 0
        for i in 0..<flowerbed.count {
            if flowerbed[i] == 0 && (i == 0 || flowerbed[i - 1] == 0) && (i == flowerbed.count - 1 || flowerbed[i + 1] == 0) {
                flowerbed[i] = 1
                count += 1
            }
        }
        return count >= n
    }
}

Solution().canPlaceFlowers([1,0,0,0,0,1], 2)
