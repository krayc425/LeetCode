from typing import List
import heapq


class Solution:
    def kthSmallest(self, matrix: List[List[int]], k: int) -> int:
        N = len(matrix)
        min_heap = []

        for i in range(0, min(N, k)):
            min_heap.append((matrix[i][0], i, 0))
        heapq.heapify(min_heap)

        min_ele = -1
        while k > 0:
            min_ele, r, c = heapq.heappop(min_heap)
            if c < N - 1:
                heapq.heappush(min_heap, (matrix[r][c + 1], r, c + 1))
            k -= 1
        return min_ele
