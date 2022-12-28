# Searchable Shape Model

Eventually all our shape finding calculations results in searchable shape models

## Overview

Its a list of shapes sorted by score and in each shape we sort by word number.

We can use this to combine shapes together in an array format for fast CPU or GPU processing

We just have to find a word that is in a shape and we can then find every instance of that word in this cluster of shapes

You see we have a wordIndex that we can first find where the same word exists and based on where we are we can then 
find what the shape is.

So we can easily find merge possibilities and this structure is very efficient in memory usage.

And because its an array the memory layout is good for a CPU or GPU to find the values they want.

We have two indexes, one is a dictionary which is useful for CPU

And then we have

## Topics

### Main Models

- ``SearchableShapeModel``
