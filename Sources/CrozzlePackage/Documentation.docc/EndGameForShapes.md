# End Game For Shapes

Create all the shapes we can and store in a single array of ShapeModel

## Overview

This list of shapes will be the entire list and we can link shape to shape using another structure

We will have an index which says which word is in which shape.

So then we have a huge list that links each shape with all other shapes

Shape 0 can connect with {2,5,6,88,555,1222}

This makes like a web of connections.

Then we have something that can travel along these connections like a spider going over its spider web

And this is the actual game play and greedy algorithm that chooses to traverse only over the best games.

We will store this all in the one file that can be created for each game.  Hopefully this file size once loaded is not too large.

So this module only has to be run once.

I have also shortened the name for each ShapeModel.

Sure its not good for GPU but it will be good for all the computers I have in my server cabinet.

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
