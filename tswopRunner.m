%start = best;
start = zeros(2,20);
localSearch(@tswop, @tswopProposal, start, 0.05, -1, 1, 10, 0.005)