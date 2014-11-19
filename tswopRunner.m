start = rand(2,24) .* 2 - 1;
bestSoFar = localSearch(@tswopN, @tswopProposal, start, 0.1, -1, 1, 10, 0.005);
for i=2:2:22
    disp(i)
    start = rand(2,24) .* 2 - 1;
    start(:,1:i) = bestSoFar(:,1:i);
    trial1 = localSearch(@tswopN, @tswopProposal, start, 0.01, -1, 1, 10, 0.005);
    trial2 = localSearch(@tswopN, @tswopProposal, start, 1, -1, 1, 10, 0.005);
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

localSearch(@tswop, @tswopProposal, bestSoFar(:,1:20), 0.1, -1, 1, 10, 0.005)

% Our optimization for tswop iteratively optimizes the solution starting
% from increasing portions of the best solution found so far. The first
% iteration is run on completely random inputs. The second iteration is run
% using the first 2 entries from the best solution found in iteration 1 and
% random entries for the rest of the input. The third iteration uses 4
% inputs from the best solution from iteration 2, etc. In each iteration,
% two trials are run, one with epsilon value 0.1 and one with epsilon value
% 0.01. This is so that we try be conservative and explorative. The max of
% trial1, trial2, and the previous best is kept as bestSoFar for use in the
% next iteration. The idea behind this algorithm is to sequentially build
% up solutions. It also uses a different tswop problem, tswopN, which can
% take in any number of inputs. We use this so that we can use inputs of
% length 24. We use longer length inputs because the end of a solution 
% often ends in a position which is impossible to continue from, such as
% with Taylor doing a faceplant. We do not want to capture this part of the
% sequence for further iterations as it is very difficult to improve from
% this. After we have run this process up to an input of length 22, we take
% the first 20 elements of the best found solution and run local search on
% it to get the final solution.
%
% Proposal Functions
% alternatingNoise - Adds a random value between 0 and 1 to every other 
% value and subtracts it from values between the ones added to. The goal of
% this function is to encourage periodic behavior.
%
% inverseScaleRandomNoise - Adds a random value to each entry which is
% proportional to 1-|entry|. The idea behind this one is to add noise to
% values which are far from the extremes.
%
% tswopOneNumRandomNoise - Chooses a random entry and adds a random value
% between -1 and 1 to it.
%
% repeatBestSection - Breaks the input into chunks of length 5.
% Independently concatenates all the chunks with the first chunk to make
% chunks of length 10 and tests each one. Whichever gets Taylor the
% furthest is copied over all the other chunks in the output. The idea
% behind this function is to find the best short sequence and repeat it for
% the whole sequence. The first sequence is not included because it seems
% that the first sequence is different than the other seuquences as it has
% to get Taylor started moving.
%
% tswopOneRandomNoise - Chooses one random vertical pair and adds random
% values between -1 and 1 to them.