class Solution:
    def minKnightMoves(self, x: int, y: int) -> int:
        if x == 0 and y == 0:
            return 0
        # consider the first quadrant is enough
        x, y = abs(x), abs(y)
        directions = [[-2, 1], [2, -1], [2, 1], [-1, 2], [1, -2], [1, 2]]
        queue = [(0, 0)]
        visited = {(0, 0)}
        step = 0
        while len(queue) > 0:
            n = len(queue)
            for i in range(n):
                c_x, c_y = queue[i]
                if c_x == x and c_y == y:
                    return step
                for d in directions:
                    d_x, d_y = c_x + d[0], c_y + d[1]
                    if (d_x, d_y) not in visited and -1 <= d_x <= x + 2 and -1 <= d_y <= y + 2:
                        visited.add((d_x, d_y))
                        queue.append((d_x, d_y))
            queue = queue[n:]
            step += 1
        return -1
