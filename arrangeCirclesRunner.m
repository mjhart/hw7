a = randi(50, 1, 20);
localSearch(@arrangeCircles, @circlesProposal, a, 0.1, -50, 50, 45, 0.01)

To optimize localsearch for this circle arrangement problem we use a combination of proposal functions in circlesProposal 
with an appropriately small value of epsilon (choice of epsilon was dictated by empirically choosing a value that led to
a balanced trade-off between a slightly larger square size but seemed to work well for the case for swapping smaller circles 
located near the edges of the square). We use 4 different proposal functiosn in circlesProposal:

-- with a probability of .2 we call the MoveTowardsCenter proposal function.The aim here is to move a randomly selected circle 
towards the center of the arrangement. To calculate the center, we calculated a weighted average of the centers of each of the circles with
the square of each circle's radius (proportional to the area the circle occupies) serving as the weight. This results in larger
circles contributing more heavily towards the calculation of the "center".
-- with a probability of .2 we call the MoveAllTowardsCenter proposal function. This function moves all circles towards the center,
where the "center" is calculated using the weighted average procedure outlined above. Both movetowardscenter and movealltowardscenter
are intended to help ensure a tighter packing of circles in the case that they are distributed far away from the center. By using
weights, we ensure that we account for the area occupied by circles with large radius and prevent intersections, inclusions, etc.
-- with a probability of .1 we call the SwapCircles proposal function which swaps two randomly chosen circles. Swapping is particularly
helpful in the earlier iterations of this problem; the idea was that larger circles are densey packed near the center and smaller
circles move out, only to be moved closer by the other proposal functions. This reverse swap (larger circle moving outwards is not optimal and
is therefore disregarded).
-- with a probability of .5 we call the wideScaleRandomNoiseMix3 proposal function. This is itself a combination of three 
proposal function with equal probability: 
    --wideScaleRandomNoise: Changes both coordinates of all circles by a random amount at a random scale chosen in an 
                                         exponential fashion from a range at least[.0001,100]. 
    --wideScaleRandomNoiseOneCoordinate: Changes one random coordinate of a circle by a random amount at a random scale chosen in an 
                                         exponential fashion from a range at least[.0001,100]. Essentially translates a circle along 
                                         either x or y directions.
    --wideScaleRandomnNoisePair:Changes both coordinates of a circle by a random amount at a random scale chosen in an 
                                exponential fashion from a range at least[.0001,100]. Essentially translates a circle by a random distance along
                                a random vector in any direction.
  This proposal function (mixing the three mentioned above) aims to move either one or all circles by random translations independent of knowledge
  of others' positions (i.e. free of center approach).
  

