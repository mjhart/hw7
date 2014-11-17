%a = [0 0 0 0 0 0 0 0 0 15 19 15 27 15 27 0 19 0 0 0];
a = randi(50, 1, 20);
localSearch(@arrangeCircles, @circlesProposal, a, 0, -50, 50, 10, 1)
%localSearch(@arrangeCircles, @moveTogetherProposal, a, 0, -50, 50, 10, 1)