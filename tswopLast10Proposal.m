function out=tswopLast10Proposal(x)
x = x(:,11:20);
i=randi(4);

if i == 2
    out = alternatingNoise(x);
    out = cat(2,x(:,1:10),out);
    return
end

if i == 1
    out = inverseScaleRandomNoise(x);
    out = cat(2,x(:,1:10),out);
    return
end

% if i == 2
%     out = tswopRandomNoise(x);
%     return
% end

if i == 3
    out = tswopOneNumRandomNoise(x);
    out = cat(2,x(:,1:10),out);
    return
end

% if i == 5
%     out = repeatBestsection(x);
%     return
% end

out = tswopOneRandomNoise(x);
out = cat(2,x(:,1:10),out);