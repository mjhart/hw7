function out=wideScaleRandomNoiseMix3Proposal(x)
% Runs a random one of the three wideScaleRandomNoise proposal functions on
% the input
i = randi(3);
if i == 1
    out = wideScaleRandomNoiseProposal(x);
    return
end
if i == 2
    out = wideScaleRandomNoiseOneCoordinateProposal(x);
    return
end
out = wideScaleRandomNoisePairProposal(x);