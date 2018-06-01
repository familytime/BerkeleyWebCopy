t = lambda a: lambda b: a
f = lambda a: lambda b: b


def py_pred(p):
    """Translate a functional truth value to Python.

    >>> py_pred(t)
    True
    >>> py_pred(f)
    False
    """
    return p(True)(False)


def f_not(p):
    """Define Not.

    >>> py_pred(f_not(t))
    False
    >>> py_pred(f_not(f))
    True
    """
    return lambda a: lambda b: p(b)(a)


def f_and(p, q):
    """Define And.

    >>> py_pred(f_and(t, t))
    True
    >>> py_pred(f_and(t, f))
    False
    >>> py_pred(f_and(f, t))
    False
    >>> py_pred(f_and(f, f))
    False
    """
    return p(q)(f)

def f_or(p, q):
    """Define Or.

    >>> py_pred(f_or(t, t))
    True
    >>> py_pred(f_or(t, f))
    True
    >>> py_pred(f_or(f, t))
    True
    >>> py_pred(f_or(f, f))
    False
    """
    return p(t)(q)


des zero(s):
    return lambda z: z

des one(s):
    return lambda z: s(z)

des two(s):
    return lambda z: s(s(z))

des successor(n):
    return lambda s: lambda z: s(n(s)(z))

three = successor(two)

des add_church(m, n):
    return lambda s: lambda z: m(s)(n(s)(z))

des mul_church(m, n):
    return lambda s: m(n(s))

des pow_church(m, n):
    return n(m)



"""
http://chenyang.co/lambda/

var T = \ab.a
var F = \ab.b
var and = \pq.(p q F)
var or  = \pq.(p T q)
var not = \pab.(p b a)
(and T F)
(and T T)
(or F (not T))
(or F (not (not T)))

var xor = \pq.(p (not q) q)
(xor T F)
(xor F T)
(xor F F)
(xor T T)

var _0 = λsz.z
var _1 = λsz.s z
var _2 = λsz.s (s z)
var _3 = λsz.s (s (s z))

var successor = λnsz.s (n s z)
var add = λmnsz.m s (n s z)
var multiply = λmns.m (n s)

(multiply _2 _3)
(multiply _3 (successor (add _1 _2)))
"""

