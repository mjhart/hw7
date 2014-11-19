function out=tswopProposal(x)

i=randi(6);

if i == 1
    out = alternatingNoise(x);
    return
end

if i == 2
    out = inverseScaleRandomNoise(x);
    return
end

if i == 3
    out = tswopOneNumRandomNoise(x);
    return
end

if i == 4
    out = repeatBestsection(x);
    return
end

out = tswopOneRandomNoise(x);