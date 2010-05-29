toRadians: (degrees) -> degrees * Math.PI / 180

class Point
  constructor: (x, y) -> @x: x; @y: y
  toString: -> "($@x,$@y)"
  toPath: -> "$@x $@y"
  moveTo: -> "M${@toPath()}"
  lineTo: -> "L${@toPath()}"

class Polygon
  constructor: (first, rest...) ->
    @first: first
    @rest: rest
    
  toPath: ->
    path: "${@first.moveTo()}"
    for point in @rest
      path: "$path${point.lineTo()}"
    "${path}z\n"
    
class EquilateralTriangle
  constructor: (p, length) ->
    height: length * Math.cos(toRadians(30))
    p2: new Point(p.x + (length/2), height)
    p3: new Point(p.x - (length/2), height)
    @polygon: new Polygon(p, p2, p3)

  toPath: -> @polygon.toPath()
  
p1: new Point(2,3)
p2: new Point(3,3)
p3: new Point(4,3)
print new Polygon(p1).toPath()
print new Polygon(p1, p2).toPath()
print new Polygon(p1, p2, p3).toPath()
print new Polygon(p1, p2, p3).toPath()
print new EquilateralTriangle(new Point(0,0), 10).toPath()
