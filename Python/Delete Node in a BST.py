# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:

    def predNode(self, node: TreeNode) -> int:
        node = node.left
        while node.right:
            node = node.right
        return node.val

    def succNode(self, node: TreeNode) -> int:
        node = node.right
        while node.left:
            node = node.left
        return node.val

    def deleteNode(self, root: TreeNode, key: int) -> TreeNode:
        if not root:
            return None
        if root.val > key:
            root.left = self.deleteNode(root.left, key)
        elif root.val < key:
            root.right = self.deleteNode(root.right, key)
        else:
            if root.left is None and root.right is None:
                root = None
            elif root.left is not None:
                root.val = self.predNode(root)
                root.left = self.deleteNode(root.left, root.val)
            elif root.right is not None:
                root.val = self.succNode(root)
                root.right = self.deleteNode(root.right, root.val)
        return root
