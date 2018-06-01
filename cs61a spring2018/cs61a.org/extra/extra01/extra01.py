##################################
# Newton's method (from lecture) #
##################################

def improve(update, close, guess=1, max_updates=100):
    """Iteratively improve guess with update until close(guess) is true."""
    k = 0
    while not close(guess) and k < max_updates:
        guess = update(guess)
        k = k + 1
    return guess

def approx_eq(x, y, tolerance=1e-15):
    """Whether x is within tolerance of y."""
    return abs(x - y) < tolerance

def find_zero(f, df):
    """Return a zero of the function f with derivative df."""
    def near_zero(x):
        return approx_eq(f(x), 0)
    return improve(newton_update(f, df), near_zero)

def newton_update(f, df):
    """Return an update function for f with derivative df."""
    def update(x):
        return x - f(x) / df(x)
    return update

def nth_root_of_a(n, a):
    """Return the nth root of a.

    >>> nth_root_of_a(2, 64)
    8.0
    >>> nth_root_of_a(3, 64)
    4.0
    >>> nth_root_of_a(6, 64)
    2.0
    """
    return find_zero(lambda x: pow(x, n) - a, lambda x: n * pow(x, n-1))

#############
# Questions #
#############

def intersect(f, df, g, dg):
    """Return where f with derivative df intersects g with derivative dg.

    >>> parabola, line = lambda x: x*x - 2, lambda x: x + 10
    >>> dp, dl = lambda x: 2*x, lambda x: 1
    >>> intersect(parabola, dp, line, dl)
    4.0
    """
    "*** YOUR CODE HERE ***"


from functools import lru_cache
memoize = lru_cache(None)

def six_sided(score):
    if 1 <= score <= 6:
        return 1 / 6
    else:
        return 0


@memoize
def roll_at_least(score, n, dice=six_sided):
    """
    >>> "%.6f" % roll_at_least(1, 1) # rounding to avoid floating point errors
    '1.000000'
    >>> "%.6f" % roll_at_least(2, 2)
    '0.694444'
    >>> "%.6f" % roll_at_least(20, 3)
    '0.000000'
    >>> "%.6f" % roll_at_least(20, 4)
    '0.054012'
    >>> "%.6f" % roll_at_least(20, 9)
    '0.193806'
    >>> "%.6f" % roll_at_least(7, 2)
    '0.527778'
    >>> "%.6f" % roll_at_least(7, 4)
    '0.482253'
    >>> "%.6f" % roll_at_least(14, 4)
    '0.388117'
    >>> "%.6f" % roll_at_least(14, 9)
    '0.193807'
    >>> "%.6f" % roll_at_least(14, 14)
    '0.077887'
    """
    return roll_at_least_ones(score, n, dice) + roll_at_least_no_ones(score, n, dice)

@memoize
def roll_at_least_ones(total, n, dice):
    "*** YOUR CODE HERE ***"

@memoize
def roll_at_least_no_ones(total, n, dice):
    "*** YOUR CODE HERE ***"
