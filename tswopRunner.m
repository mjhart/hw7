start = rand(2,24) .* 2 - 1;
bestSoFar = localSearch(@tswopN, @tswopProposal, start, 0.5, -1, 1, 10, 0.005);
for i=2:2:22
    disp(i)
    start = rand(2,24) .* 2 - 1;
    start(:,1:i) = bestSoFar(:,1:i);
    trial1 = localSearch(@tswopN, @tswopProposal, start, 0.01, -1, 1, 10, 0.005);
    trial2 = localSearch(@tswopN, @tswopProposal, start, 0.1, -1, 1, 10, 0.005);
    bestResult = tswopN(bestSoFar);
    result1 = tswopN(trial1);
    result2 = tswopN(trial2);
    if bestResult > result1 || bestResult > result2  
        if result1 < result2
            bestSoFar = trial1;
        else
            bestSoFar = trial2;
        end
    end
end

localSearch(@tswop, @tswopProposal, bestSoFar(:,1:20), 0.5, -1, 1, 10, 0.005)