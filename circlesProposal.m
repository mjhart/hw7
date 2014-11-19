function out=circlesProposal(x)

i = randi(10);
if i <= 2
    out=moveTowardsCenterProposal(x);
    return
end
if i <= 4
    out = moveAllTowardsCenterProposal(x);
    return
end
if i == 5
    out = swapCircles(x);
    return
end
out = wideScaleRandomNoiseMix3Proposal(x);
    
