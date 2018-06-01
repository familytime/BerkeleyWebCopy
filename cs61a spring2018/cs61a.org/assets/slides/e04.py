def string_demos():
    from unicodedata import lookup, name
    snow = lookup('SNOWMAN')
    len('A')
    'A'.encode('utf8')
    'A'.encode('ascii')
    len(snow)
    len(snow.encode('utf8'))
    bin(ord('A'))
    [bin(b) for b in snow.encode('utf8')]

# Trees (from lecture)

def tree(root, branches=[]):
    for branch in branches:
        assert is_tree(branch), 'branches must be ts'
    return [root] + list(branches)

def root(t):
    return t[0]

def branches(t):
    return t[1:]

def is_tree(t):
    if type(t) != list or len(t) < 1:
        return False
    for branch in branches(t):
        if not is_tree(branch):
            return False
    return True

def is_leaf(t):
    return not branches(t)

def print_tree(t, indent=0):
    print(indent * '  ' + str(root(t)))
    for b in branches(t):
        print_tree(b, indent+1)

# Huffman encoding trees

def huffman_leaf(letter, weight):
    """A leaf of a Huffman tree, which has a weight at the root."""
    return tree(weight, [tree(letter)])

def huffman_tree(left, right):
    """A Huffman encoding tree; left and right are also Huffman trees."""
    return tree(root(left) + root(right), [left, right])

def weight(tree):
    """The weight of a Huffman encoding tree."""
    return root(tree)

def is_huffman_leaf(tree):
    """Whether this Huffman tree is a Huffman leaf."""
    return not is_leaf(tree) and is_leaf(branches(tree)[0])

def letter(leaf):
    """The letter of a Huffman leaf."""
    return root(branches(leaf)[0])

# Huffman Trees

CD = huffman_tree(huffman_leaf('c', 1), huffman_leaf('d', 1))
EF = huffman_tree(huffman_leaf('e', 1), huffman_leaf('f', 1))
GH = huffman_tree(huffman_leaf('g', 1), huffman_leaf('h', 1))
EFGH = huffman_tree(EF, GH)
BCD = huffman_tree(huffman_leaf('b', 3), CD)
BCDEFGH = huffman_tree(BCD, EFGH)
example_tree = huffman_tree(huffman_leaf('a', 8), BCDEFGH)

def leaves_by_depth(t, leaves=None, depth=0):
    """Return a dictionary of leaf lists by depth.  """
    if leaves is None:
        leaves = {}
    if is_leaf(t):
        leaves.setdefault(depth, []).append(root(t))
    else:
        for b in branches(t):
            leaves_by_depth(b, leaves, depth+1)
    return leaves

def print_leaves(t):
    """Print leaves indexed by sorted depth.

    >>> print_leaves(example_tree)
    1 bits: ['a']
    3 bits: ['b']
    4 bits: ['c', 'd', 'e', 'f', 'g', 'h']
    """
    for depth, leaves in sorted(leaves_by_depth(t).items()):
        print(depth-1, 'bits:', leaves)
