function out=circlesProposal(x)

i = randi(3);
if i == 1
    out=moveTowardsCenterProposal(x);
    return
end
out = wideScaleRandomNoiseMix3Proposal(x);
    
