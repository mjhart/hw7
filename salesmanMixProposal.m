function out = salesmanMixProposal(x)

i = randi(5); % randomly chose one of the 5 proposal functions
if i == 1
    out = cycleCitiesProposal(x);
    return
end
if i == 2
    out = swapCitiesProposal(x);
    return
end
if i == 3
    out = reverseSegment(x);
    return
end
if i == 4
    out = swapPairs(x);
    return
end
out = swapCityChunkProposal(x);