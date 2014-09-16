# Dijkstra's Algorithm [https://d25lcipzij17d.cloudfront.net/badge.svg?id=rb&type=5&v=0.0.2](https://badge.fury.io/rb/dijkstra.svg)

## Install > gem install dijkstra 

Dijkstra's algorithm, conceived by computer scientist Edsger Dijkstra, is a graph search algorithm that solves in single-source
shortest path problem for a graph with non-negative edge path costs, producing a shortest path tree. 

![Screenshot](http://farm6.staticflickr.com/5572/15142640541_6ea1eb3d48.jpg)

## Usage

```

require 'dijkstra'

 # In this context , 5 represents the number of the vertices (cities, countries, factories etc), 
 # and futher we have 9 edges.
 r = [[5],
     [1,2,1],
     [1,3,9],
     [1,5,3],
     [2,4,3],
     [2,3,7],
     [4,3,2],
     [4,1,1],
     [5,2,4],
     [5,4,2]]

start_point = 1 #starting node
  end_point = 3 #arrival node

ob = Dijkstra.new(start_point, end_point, r)

print "Cost = ", ob.getCost(), "\n"
print "Shortest Path from ", start_point, " to ", end_point," = ", ob.getShortestPath()

ob.writeToFile("shortestpath.out")

=>  shortestpath.out =>

    Cost -> 6
    Shortest Path -> [1, 2, 4, 3]

```

## Installation manually

```

$ git clone git://github.com/thinkphp/dijkstra.gem.git
$ cd dijkstra.gem
$ gem build dijkstra.gemspec
$ gem install ./dijkstra-0.0.1.gem
$ irb
$ irb(main):001:0> require 'dijkstra'
$ Cost = 6
$ Shortest Path  = [1,2,4,3]=> true
$ irb(main):002:0> exit
$ gem list -r dij #grab it from any computer with RubyGems installed
$ gem list -l dij
$ ruby app.rb

```

## References

  http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
