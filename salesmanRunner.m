start = randperm(100);
localSearch(@travelingSalesman, @salesmanMixProposal, start, 1, -inf, inf, 30, 1)

% For the traveling salesman problem, we decided on a mix of 5 proposal
% functions. Each of them have a slightly different intuition behind them.
%
% 1) cycleCitiesProposal - This proposal function choses a random chunk of
% x and shifts each element in the chunk by a random amount. Elements that
% would be shifted past the end of the chunk get wrapped around to the
% front. This function is intended to find better arrangements for chunks
% of functions which are nearby, so should be connected, but are currently,
% connected in a bad ordering.
%
% 2) swapCitiesProposal - This proposal function randomly choses two cities
% and swaps them. This is a relatively basic function, but we found it
% helps so we put it in. We assume this helps mostly towards the end of the
% optimization when the solution is too delicate for larger changes.
%
% 3) reverseSegment - This proposal function randomly choses a chunk in x
% and reverses the order of all the elements in that chunk. This function
% was designed to eliminate "crossed paths." Sometimes, a chunk will be
% well arranged, but the path into the chunk crosses the path out of the
% chunk. This function attempts to find and eliminate those wasted miles.
%
% 4) swapPairs - Randomly choses a chunk in x and swaps each element in the
% chunk with the subsequent element. This function was designed to make
% progress when most of the remote cities are in a good position, but there
% is a lot of wasted traveling among cities that are close together. 
%
% 5) swapCityChunkProposal - This proposal function randomly choses two
% equal size chunks and swaps them. This function is intended to find
% chunks of cities which are well optimized amoung themselves, but the
% paths into and out of the chunk are not good.
%
% We found a relatively small epsilon value works well in this domain. This
% seems to be due to the fact that near the end of the optimization,
% progress is made steadily but slowly, so a larger epsilon would destroy
% much of the progress. Also, our proposal function can provide proposals
% which drastically change the structure of the solution, which alleviates
% conditions where local search would usually fall into a local minimum.
% Even a simple swap of two cities can cause a large change in the distance
% traveled.