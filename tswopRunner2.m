init = rand(2,10) .* 2 - 1;

start = localSearch(@tswopN, @tswopProposal, init, 0.5, -1, 1, 10, 0.005);
start = cat(2,start,rand(2,10) .* 2 - 1);
localSearch(@tswopN, @tswopLast10Proposal, start, 0.5, -1, 1, 10, 0.005);