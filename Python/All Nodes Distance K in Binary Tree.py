from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def distanceK(self, root: TreeNode, target: TreeNode, K: int) -> List[int]:
        parentMap = {}

        # build a map for: node -> parent
        def inorder(node: TreeNode, parent: TreeNode):
            if not node:
                return
            inorder(node.left, node)
            if parent:
                parentMap[node] = parent
            inorder(node.right, node)

        inorder(root, None)

        queue = [target]
        visited = {target}
        level = 0
        while len(queue) > 0:
            if level == K:
                break
            n = len(queue)
            for i in range(n):
                node = queue[i]
                for neighbor in [node.left, node.right, parentMap.get(node, None)]:
                    if neighbor and neighbor not in visited:
                        visited.add(neighbor)
                        queue.append(neighbor)
            queue = queue[n:]
            level += 1
        return [node.val for node in queue]
