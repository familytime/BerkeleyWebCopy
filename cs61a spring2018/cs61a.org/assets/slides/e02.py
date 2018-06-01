"""Decisions"""

from functools import lru_cache
memoize = lru_cache(None)

# Hog roll dice

def six_sided(outcome):
    if 1 <= outcome <= 6:
        return 1/6
    else:
        return 0

dice = six_sided

def roll_a_one(n):
    """The probability of rolling a 1 from N dice.

    >>> [round(roll_a_one(n), 3) for n in range(1, 10)]
    [0.167, 0.306, 0.421, 0.518, 0.598, 0.665, 0.721, 0.767, 0.806]
    """
    if n == 0:
        return 0
    return dice(1) + (1 - dice(1)) * roll_a_one(n-1)

def roll_no_ones(total, n):
    """The probability of scoring total from N dice, assuming no ones.
    
    >>> [round(roll_no_ones(t, 2), 3) for t in range(1, 13)]
    [0.0, 0.0, 0.0, 0.028, 0.056, 0.083, 0.111, 0.139, 0.111, 0.083, 0.056, 0.028]
    """
    if total == 0 and n == 0:
        return 1
    elif n == 0:
        return 0
    else:
        chance, outcome = 0, 2
        while outcome <= 6:
            chance += dice(outcome) * roll_no_ones(total-outcome, n-1)
            outcome += 1
        return chance

def roll_dice(total, n):
    """The probability of scoring total from N dice, observing pig out.

    >>> [round(roll_dice(t, 2), 3) for t in range(1, 13)]
    [0.306, 0.0, 0.0, 0.028, 0.056, 0.083, 0.111, 0.139, 0.111, 0.083, 0.056, 0.028]
    """
    if total == 1:
        return roll_a_one(n)
    else:
        return roll_no_ones(total, n)

# Hog end game

def roll_at_least(k, n):
    """Return the chance of scoring at least K points by rolling N dice
    without rolling a 1.

    >>> round((5/6) ** 4, 10)
    0.4822530864
    >>> round(roll_at_least(8, 4), 10)
    0.4822530864
    >>> round(roll_at_least(4, 4), 10)
    0.4822530864
    >>> round(roll_at_least(20, 4), 10)
    0.0540123457
    >>> round(roll_at_least(20, 6), 10)
    0.3017189643
    >>> round(roll_at_least(8, 2), 10)
    0.4166666667
    """
    total, chance = k, 0
    while total <= 6 * n:
        chance += roll_dice(total, n)
        total += 1
    return chance

def at_least(k, n, dice=six_sided):
    """Return the chance of scoring at least K points by rolling N dice
    without rolling a 1.

    >>> at_least(4, 1)
    0.5
    >>> round(at_least(8, 2), 10)
    0.4166666667
    >>> round(at_least(8, 3), 10)
    0.5601851852
    >>> round(at_least(8, 4), 10)
    0.4822530864
    >>> max(range(1, 8), key=lambda n: at_least(12, n))
    4
    >>> max(range(1, 8), key=lambda n: at_least(20, n))
    6
    """
    if k > 0 and n == 0:
        return 0
    elif k <= 0 and n == 0:
        return 1
    else:
        chance, outcome = 0, 2
        while outcome <= 6:
            chance += dice(outcome) * at_least(k-outcome, n-1, dice)
            outcome += 1
        return chance

# Memoization

@memoize
def fib(n):
    """The Nth Fibonacci number.

    >>> fib(5)
    5
    >>> fib(8)
    21
    """
    if n == 0 or n == 1:
        return n
    else:
        return fib(n-2) + fib(n-1)

# Twenty-one

goal = 21

def constant(k):
    """Return a strategy of always picking K."""
    return lambda n: k

def play(strategy0, strategy1):
    """Play twenty-one and return the index of the winner.

    >>> play(constant(2), constant(2))
    1
    >>> play(constant(3), constant(3))
    1
    >>> play(constant(1), constant(2))
    0
    """
    n = 0
    who = 0
    while n < goal:
        n = n + (strategy1 if who else strategy0)(n)
        who = 1 - who
    return who

# Optimal twenty-one strategy

@memoize
def winner(n, strat, other):
    """Return the index of the winner after starting at N.

    >>> winner(0, constant(2), constant(2))
    1
    >>> winner(0, constant(3), constant(3))
    1
    >>> winner(0, constant(1), constant(2))
    0
    """
    if n >= goal:
        return 0
    else:
        return 1 - winner(n + strat(n), other, strat)

@memoize
def optimal(n, other_strategy):
    """Return an optimal strategy against other_strategy.

    >>> always_two = constant(2)
    >>> best = lambda n: optimal(n, always_two)
    >>> winner(21, best, always_two)
    0
    >>> winner(20, best, always_two)
    1
    >>> winner(19, best, always_two)
    0
    >>> winner(15, best, always_two)
    0
    >>> winner(0, best, always_two)
    0
    """
    future_strategy = lambda future_n: optimal(future_n, other_strategy)
    choice = 1
    while choice <= 3:
        if winner(n + choice, other_strategy, future_strategy) == 1:
            return choice
        choice = choice + 1
    return 1 # Give up :(

def print_perfect():
    """Print the perfect strategy and its outcome for all n."""
    n = 0
    perfect = lambda n: optimal(n, perfect)
    while n < goal:
        if winner(n, perfect, perfect) == 0:
            print('Perfect play from', n, 'wins with choice', perfect(n))
        else:
            print('Perfect play from', n, 'cannot win')
        n = n + 1
