function out=mostDistantProposal(x)

out = zeros(size(x));
for i=1:length(out)
    out(i) = x(i);
end

maxD = -inf;
maxI = 16;

for i=1:2:19
    minD = inf;
    for j=1:2:19
        if i ~= j
            radiusI = (i + 1) / 2;
            radiusJ = (j + 1) / 2;
            d = (x(i) - x(j)) ^ 2 + (x(i+1) - x(j+1)) ^ 2 - radiusI^2 - radiusJ^2;
            if minD > d
                minD = d;
            end
        end
    end
    
    if maxD < minD
        maxD = minD;
        maxI = i;
    end
end

r = 10^((rand() * 6 - 4));
out(maxI) = out(maxI) + randn() * r;
out(maxI+1) = out(maxI+1) + randn() * r;
        