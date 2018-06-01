from turtle import *
from tkinter import *
from math import sin, sqrt

canvas = getcanvas()
width, height = canvas.winfo_width(), canvas.winfo_height()
image = PhotoImage(width=width, height=height)
canvas.create_image((0, 0), image=image, state="normal")
bgcolor("#000000")

def pixel(pos, color):
    """Draw a pixel.

    pos -- A pair of integer pixel offsets from the bottom-left corner
    color -- A triple of values from 0 to 1
    """
    x, y = pos
    right, down = x, height-y
    scaled = tuple(int(x*255) for x in color)
    color = "#%02x%02x%02x" % scaled
    image.put(color, (right, down))

def block_pixel(pos, color, size):
    x, y = pos
    for dx in range(size):
        for dy in range(size):
            pixel((x * size + dx, y * size + dy), color)

def add(a, b):
    return a[0]+b[0], a[1]+b[1], a[2]+b[2]

def subtract(a, b):
    return a[0]-b[0], a[1]-b[1], a[2]-b[2]

def dot(a, b):
    return a[0]*b[0] + a[1]*b[1] + a[2]*b[2]

def scale(a, k):
    return a[0]*k, a[1]*k, a[2]*k

def normalize(a):
    magnitude = sqrt(dot(a, a))
    return scale(a, 1/magnitude)

# Scene (from http://www.gabrielgambetta.com/tiny_raytracer_full.js)

camera = (0, 1, 0)
light =  (2, 2, 0)
black =  (0, 0, 0)
ambient = 0.2
spheres = [ # radius, pos, color
    (500, ( 0, -500, 0), (1, 1, 0)), # Yellow sphere
    (1,   ( 0,    0, 3), (1, 0, 0)), # Red sphere
    (1,   (-2,    1, 4), (0, 1, 0)), # Green sphere
    (1,   ( 2,    1, 4), (0, 0, 1)), # Blue sphere
]

# Render

def render():
    """Render image."""
    block = 1
    size = min(width//block, height//block)
    for x in range(size):
        for y in range(size):
            direction = normalize((x/size - 0.5, y/size - 0.5, 1))
            color = scale(trace_ray(camera, direction), 0.95)
            block_pixel((x, y), color, block)

def trace_ray(source, direction, depth=4):
    """Return the color of the pixel from source in direction."""
    distances = [intersect(source, direction, s) for s in spheres]
    hits = [(d, s) for d, s in zip(distances, spheres) if d]
    if not hits:
        return black
    distance, sphere = min(hits)
    _, center, color = sphere
    surface = add(source, scale(direction, distance))
    return illumination(surface, center, color, direction, depth)

def illumination(surface, center, color, direction, depth):
    """Return the illumination of the pixel at a surface point."""
    to_surface = normalize(subtract(surface, center))
    to_light = normalize(subtract(light, surface))
    intensity = max(ambient, dot(to_light, to_surface))
    direct = scale(color, intensity)
    if depth == 1:
        return direct
    else:
        cosine = dot(direction, to_surface)
        bounce = subtract(direction, scale(to_surface, 2 * cosine))
        reflected = trace_ray(surface, bounce, depth-1)
        return mix(direct, reflected, 0.5 + 0.5 * intensity ** 30)

def mix(a, b, r):
    """Mix colors a and b with ratio r."""
    return add(scale(a, r), scale(b, 1-r))

def intersect(source, direction, sphere, min_distance=0.01):
    """Return distances from source in direction to reach sphere."""
    radius, center, _ = sphere
    v = subtract(source, center)
    b = -dot(v, direction)
    v2, r2 = dot(v, v), radius * radius
    d2 = b*b - v2 + r2
    if d2 > 0:
        for d in (b - sqrt(d2), b + sqrt(d2)):
            if d > min_distance:
                return d

render()
exitonclick()
