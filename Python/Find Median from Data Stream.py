import heapq


class MedianFinder:

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.max_heap = []
        self.min_heap = []

    def addNum(self, num: int) -> None:
        if len(self.max_heap) == 0 or -num >= self.max_heap[0]:
            heapq.heappush(self.max_heap, -num)
        else:
            heapq.heappush(self.min_heap, num)
        self.adjustHeaps()

    def findMedian(self) -> float:
        max_len = len(self.max_heap)
        min_len = len(self.min_heap)
        if max_len == min_len:
            return (-self.max_heap[0] + self.min_heap[0]) / 2.0
        else:
            return -self.max_heap[0] if max_len > min_len else self.min_heap[0]

    def adjustHeaps(self):
        max_len = len(self.max_heap)
        min_len = len(self.min_heap)
        if max_len == min_len + 2:
            heapq.heappush(self.min_heap, -heapq.heappop(self.max_heap))
        elif min_len == max_len + 2:
            heapq.heappush(self.max_heap, -heapq.heappop(self.min_heap))

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder()
# obj.addNum(num)
# param_2 = obj.findMedian()
