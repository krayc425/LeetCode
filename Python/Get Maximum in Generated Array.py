class Solution:
    def getMaximumGenerated(self, n: int) -> int:
        if n <= 1:
            return n
        arr = [0] * (n + 1)
        arr[1] = 1
        for i in range(1, (n + 1) // 2):
            arr[i * 2] = arr[i]
            arr[i * 2 + 1] = arr[i] + arr[i + 1]
        return max(arr)
