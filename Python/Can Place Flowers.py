class Solution:
    def canPlaceFlowers(self, flowerbed: List[int], n: int) -> bool:
        l = len(flowerbed)
        if l == 1:
            return flowerbed[0] + n <= 1
        remain = n
        i = 0
        while i < l:
            if i == 0 and flowerbed[0] == 0 and flowerbed[1] == 0:
                remain -= 1
                i += 1
            elif i == l - 1 and flowerbed[-1] == 0 and flowerbed[-2] == 0:
                remain -= 1
            elif 1 <= i < l - 1 and flowerbed[i] == 0 and flowerbed[i - 1] == 0 and flowerbed[i + 1] == 0:
                remain -= 1
                i += 1
            i += 1
            if remain <= 0:
                return True
        return False
