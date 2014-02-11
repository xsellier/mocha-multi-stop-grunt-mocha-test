express      = require 'express'

# Assignment:
number   = 42
opposite = true

# Conditions:
number = -42 if opposite

# Functions:
square = (x) -> x * x

# Arrays:
list = [1, 2, 3, 4, 5]

# Objects:
math =
  root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x

# Splats:
race = (winner, runners...) ->
  print winner, runners

# Existence:
alert "I knew it!" if elvis?

app = express()

app.get '/', (req, res) ->
  res.send 'hello world'

app.listen 3000
# Array comprehensions:
cubes = (math.cube num for num in list)

console.info "cubes: " + cubes