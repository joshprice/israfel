class Point
  constructor: (x, y) -> @x: x; @y: y
  toString: -> "($@x,$@y)"
  toPath: -> "$@x $@y"
  moveTo: -> "M ${@toPath()} "
  lineTo: -> "L ${@toPath()} "

class Polygon
  constructor: (first, rest...) ->
    @first: first
    @rest: rest
    
  toPath: ->
    path: "${@first.moveTo()}"
    for point in @rest
      path: "$path ${point.lineTo()}"
    "${path}z"
    
p1: new Point(2,3)
p2: new Point(3,3)
p3: new Point(4,3)
poly: new Polygon(p1, p2, p3)
print poly.toPath()