#############
# Container #
#############

def box(contents):
    """Return a container that is manipulated by two functions.

    >>> get, put = box('Hello')
    >>> get()
    'Hello'
    >>> put('Goodbye')
    >>> get()
    'Goodbye'
    """
    def get():
        return contents
    def put(value):
        nonlocal contents
        contents = value
    return get, put

def make_box(contents):
    """Return a dispatch function representing a container.

    >>> c = make_box('Hello')
    >>> c('contents')
    'Hello'
    >>> c('put')('Goodbye')
    >>> c('contents')
    'Goodbye'
    """
    def dispatch(m):
        if m == 'contents':
            return contents
        if m == 'put':
            def put(value):
                nonlocal contents
                contents = value
            return put
    return dispatch

########
# List #
########

def pair(x, y):
    """A pair (x, y)."""
    def dispatch(m):
        if m == 'first':
            return x
        elif m == 'second':
            return y
    return dispatch

nil = None

def append(s, x):
    """Append value x to the end of a sequence s."""
    if s is nil:
        return pair(x, nil)
    else:
        first, second = s('first'), s('second')
        return pair(first, append(second, x))

def list_print(s):
    """A printing representation of a list.

    >>> s = pair(3, pair(4, pair(5, nil)))
    >>> list_print(s)
    [3, 4, 5]
    >>> list_print(append(s, 6))
    [3, 4, 5, 6]
    """
    print('[', end='')
    comma = False
    while s is not nil:
        if comma:
            print(', ', end='')
        first, s = s('first'), s('second')
        print(first, end='')
        comma = True
    print(']')

def list_len(s):
    """Length of a list.

    >>> s = pair(3, pair(4, pair(5, nil)))
    >>> list_len(s)
    3
    """
    if s is nil:
        return 0
    else:
        return 1 + list_len(s('second'))

def list_get(s, i):
    """Return element i of list s.

    >>> s = pair(3, pair(4, pair(5, nil)))
    >>> list_get(s, 1)
    4
    """
    if i == 0:
        return s('first')
    else:
        return list_get(s('second'), i-1)

def list_sub(s, i, v):
    """Return a copy of s with element i replaced by v.

    >>> s = pair(3, pair(4, pair(5, nil)))
    >>> list_print(list_sub(s, 1, 6))
    [3, 6, 5]
    """
    if i == 0:
        return pair(v, s('second'))
    else:
        return pair(s('first'), list_sub(s('second'), i-1, v))

def make_list():
    """Return a dispatch function representing a list.

    >>> c = make_list()
    >>> c('print')
    []
    >>> c('append')(3)
    >>> c('print')
    [3]
    >>> c('append')(4)
    >>> c('append')(5)
    >>> c('print')
    [3, 4, 5]
    >>> c('len')
    3
    >>> c('get')(2)
    5
    >>> c('set')(1, 6)
    >>> c('print')
    [3, 6, 5]
    """
    s = make_box(nil)
    def dispatch(m):
        if m == 'append':
            return lambda x: s('put')(append(s('contents'), x))
        elif m == 'len':
            return list_len(s('contents'))
        elif m == 'get':
            return lambda i: list_get(s('contents'), i)
        elif m == 'set':
            return lambda i, v: s('put')(list_sub(s('contents'), i, v))
        elif m == 'print':
            return list_print(s('contents'))
    return dispatch

########
# Dict #
########

def make_dict():
    """Return a dispatch function representing a dict.

    >>> d = make_dict()
    >>> d('set')('I', 1)
    >>> d('set')('V', 5)
    >>> d('get')('V')
    5
    >>> d('set')('X', 10)
    >>> d('set')('V', 'five')
    >>> d('get')('V')
    'five'
    >>> d('items')('len')
    3
    """
    s = make_list() # A list of (key, value) pairs
    def lookup(k):
        """Return the index for a key."""
        for i in range(s('len')):
            if s('get')(i)('first') == k:
                return i
    def set(k, v):
        """Set or add v as the value for key k."""
        i = lookup(k)
        if i is None:
            s('append')(pair(k, v))
        else:
            s('set')(i, pair(k, v))
    def dispatch(m):
        if m == 'get':
            return lambda k: s('get')(lookup(k))('second')
        elif m == 'set':
            return set
        elif m == 'items':
            return s
    return dispatch

#########################
# Dispatch Dictionaries #
#########################

def box_dict(contents):
    """Return a dispatch function representing a container.

    >>> c = box_dict('Hello')
    >>> c['contents']
    'Hello'
    >>> c['put']('Goodbye')
    >>> c['contents']
    'Goodbye'
    """
    def put(value):
        d['contents'] = value
    d = {'contents': contents, 'put': put}
    return d

#######################
# Constraint Networks #
#######################

def connector(name=None):
    """A connector between constraints.

    >>> celsius = connector('Celsius')
    >>> fahrenheit = connector('Fahrenheit')
    >>> converter(celsius, fahrenheit)

    >>> celsius['set_val']('user', 25)
    Celsius = 25
    Fahrenheit = 77.0

    >>> fahrenheit['set_val']('user', 212)
    Contradiction detected: 77.0 vs 212

    >>> celsius['forget']('user')
    Celsius is forgotten
    Fahrenheit is forgotten

    >>> fahrenheit['set_val']('user', 212)
    Fahrenheit = 212
    Celsius = 100.0
    """
    informant = None  # The source of the current val
    constraints = []  # A list of connected constraints

    def set_value(source, value):
        nonlocal informant
        val = connector['val']
        if val is None:
            informant, connector['val'] = source, value
            if name is not None:
                print(name, '=', value)
            inform_all_except(source, 'new_val', constraints)
        else:
            if val != value:
                print('Contradiction detected:', val, 'vs', value)

    def forget_value(source):
        nonlocal informant
        if informant == source:
            informant, connector['val'] = None, None
            if name is not None:
                print(name, 'is forgotten')
            inform_all_except(source, 'forget', constraints)

    connector = {'val': None,
                 'set_val': set_value,
                 'forget': forget_value,
                 'has_val': lambda: connector['val'] is not None,
                 'connect': lambda source: constraints.append(source)}
    return connector

def inform_all_except(source, message, constraints):
    """Inform all constraints of the message, except source."""
    for c in constraints:
        if c != source:
            c[message]()

def ternary_constraint(a, b, c, ab, ca, cb):
    """The constraint that ab(a,b)=c and ca(c,a)=b and cb(c,b)=a."""
    def new_value():
        av, bv, cv = [connector['has_val']() for connector in (a, b, c)]
        if av and bv:
            c['set_val'](constraint, ab(a['val'], b['val']))
        elif av and cv:
            b['set_val'](constraint, ca(c['val'], a['val']))
        elif bv and cv:
            a['set_val'](constraint, cb(c['val'], b['val']))
    def forget_value():
        for connector in (a, b, c):
            connector['forget'](constraint)
    constraint = {'new_val': new_value, 'forget': forget_value}
    for connector in (a, b, c):
        connector['connect'](constraint)
    return constraint

from operator import add, sub, mul, truediv

def adder(a, b, c):
    """The constraint that a + b = c."""
    return ternary_constraint(a, b, c, add, sub, sub)

def multiplier(a, b, c):
    """The constraint that a * b = c."""
    return ternary_constraint(a, b, c, mul, truediv, truediv)

def constant(connector, value):
    """The constraint that connector = value."""
    constraint = {}
    connector['set_val'](constraint, value)
    return constraint

def converter(c, f):
    """Connect c to f to convert from Celsius to Fahrenheit."""
    u, v, w, x, y = [connector() for _ in range(5)]
    multiplier(c, w, u)
    multiplier(v, x, u)
    adder(v, y, f)
    constant(w, 9)
    constant(x, 5)
    constant(y, 32)






