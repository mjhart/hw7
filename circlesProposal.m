function out=circlesProposal(x)

i = randi(5);
if i == 1
    out=moveTowardsCenterProposal(x);
else
    out=wideScaleRandomNoisePairProposal(x);
end
    
