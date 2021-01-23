# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def diameterOfBinaryTree(self, root: TreeNode) -> int:
        self.node_count = 0

        def dfs(node: TreeNode):
            if not node:
                return 0
            left = dfs(node.left)
            right = dfs(node.right)
            self.node_count = max(self.node_count, left + right)  # path
            return max(left, right) + 1  # depth

        dfs(root)
        return self.node_count
