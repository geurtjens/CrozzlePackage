# Edge Creation Process

An edge is when two words are connected together by a common letter.  An edge is a basic building block of all valid crozzle games.  An edge comprises of two different words where each of the two words share a common letter, which we call an interlocking letter.

## Overview

#### Word List
Here is an example of a word list.  It is just a list of words.  

In the example below the words above the blank line are those that appeared in the winning game and the ones below were discarded.  

The task is not to place each and every word as this is impossible, rather to choose the right words and discard the others.
```
[
ZION,AZURE,TOYS,JOY,HAZELNUT,NUTS,NAZARETH,HYMN,TURKEY,SNOW,MERRY,TOAST,STAR,HOLLY,JELLY,FAMILY,WHITE,
SING,SAUCE,PORK,TREE,EVE,INN,BELLS,CAKE,

GLAZE,PARTYHATS,TWENTYFIFTH,WALNUT,PEANUTS,PRESENTS,FRUIT,NUTMEG,CUSTARD,CHRISTMAS,MISTLETOE,GIFTS,
SANTACLAUS,FESTIVE,RAISINS,LIGHTS,WREATH,HOLIDAY,WISEMEN,CRANBERRY,OPENHOUSE,SILENTNIGHT,STOCKING,PUNCH,
WINE,SHOPPING,PLUMPUDDING,WRAPPING,NEIGHBOURS,GREETINGS,DECORATIONS,ALMONDS,LANTERN,KRISSKRINGLE,SPICE,
GOODWILL,BONBON,CHURCH,FRIENDS,PARCELS,CINNAMON,NICHOLAS,MINCEPIES,CHERRIES,SLEIGH,ALMOND,MANGER,RIBBON,
CHOCOLATE,MIXEDPEEL,DRINK,CANDLES,FOOD,GINGER,BETHLEHEM,CAROL,REINDEER,GOODCHEER,CREAM,CORDIAL,CHILDREN,
ICECREAM,CHICKEN,CARD,DECEMBER,PEACE
]
```

#### Shape Example

Here is an example of an Edge:

```
 .    
 A    
.ZION.
 U    
 R    
 E    
 .    
```

### Duplicates
The same two word combination and interlocking letter can be flipped

```
  .
.AZURE.
  I
  O
  N
  .
```

This second representation is a duplicate of the first.  We eliminate duplicates as this saves us memory and processing time.

### Rules
1. Word List - Only use words from the list provided and only use the same word once.  You dont have to use all words in the list.
2. Blocking Characters - Each word must start and end with a blocking character "." to stop words from running into each other.
3. Grid Size - All words must fit within the bounds of the grid size given which originally was 15x10 and later was increased to be 15x13.  The blocking character does not have to fit in the bounds of the grid.
4. Interlocks - All words placed into the grid must contain at least one interlock.  An interlock is a letter in one word that is also in the other interlocking word.  An interlock requires one word that will be placed horizontally and the interlocking word to be placed vertically and connected by the interlocking letter.
5. Adjacency - Words cannot run next to each other unless they are interlocked with words running perpendicular to them.  We call adjacent words a multi interlock.

### Scoring

Each word in the shape provides 10 points and each interlocking letter is scored according to the following table:
|Letter|Score|
|------|-----|
|ABCDEF|2|
|GHIJKL|4|
|MNOPQR|8|
|STUVWX|16|
|Y|32|
|Z|64|


## Topics

### Calculators

- ``EdgeCalculator``
- ``ScoreCalculator``

### Models

- ``EdgeModel``
- ``ShapeModel``
- ``PlacementModel``
- ``GpuShapeModel``
- ``GpuWordList``

### Converters

- ``EdgeToShapeConverter``
- ``ShapeToGpuShapeConverter``
