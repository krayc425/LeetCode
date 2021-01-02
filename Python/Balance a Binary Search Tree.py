from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def balanceBST(self, root: TreeNode) -> TreeNode:
        def inorder(node: TreeNode) -> List[TreeNode]:
            if node is None:
                return []
            return inorder(node.left) + [node] + inorder(node.right)

        def build(arr: List[TreeNode]) -> TreeNode:
            if len(arr) == 0:
                return None
            mid = int(len(arr) / 2)
            node = arr[mid]
            node.left = build(arr[:mid])
            node.right = build(arr[mid + 1:])
            return node

        if not root:
            return None
        arr = inorder(root)
        return build(arr)
