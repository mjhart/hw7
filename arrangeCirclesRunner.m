%a = randi(50, 1, 20);
a = zeros(1, 20);
localSearch(@arrangeCircles, @circlesProposal, a, 0.1, -50, 50, 20, 0.1)