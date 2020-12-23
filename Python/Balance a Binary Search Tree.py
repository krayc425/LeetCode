from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def inorder(self, node: TreeNode) -> List[TreeNode]:
        if node is None:
            return []
        return self.inorder(node.left) + [node] + self.inorder(node.right)

    def build(self, arr: List[TreeNode]) -> TreeNode:
        if len(arr) == 0:
            return None
        mid = int(len(arr) / 2)
        node = arr[mid]
        node.left = self.build(arr[:mid])
        node.right = self.build(arr[mid + 1:])
        return node

    def balanceBST(self, root: TreeNode) -> TreeNode:
        if not root:
            return None
        arr = self.inorder(root)
        return self.build(arr)
