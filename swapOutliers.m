function out = swapOutliers(x)

out = zeros(size(x));
out(:) = x(:);
n = numel(x);
load('cities.mat')

maxR = -inf;
maxI = 0;
for i=2:99
    minD = inf;
    for j=1:100
        if i ~= j
            d = (locs(out(i),1) - locs(out(j),1)) ^ 2 + (locs(out(i),2) - locs(out(j),2)) ^ 2;
            if d < minD
                minD = d;
            end
        end
    end
    
    d1 = (locs(out(i),1) - locs(out(i-1),1)) ^ 2 + (locs(out(i),2) - locs(out(i-1),2)) ^ 2;
    d2 = (locs(out(i),1) - locs(out(i+1),1)) ^ 2 + (locs(out(i),2) - locs(out(i+1),2)) ^ 2;
    m = max(d1, d2);
    r = m / minD;
    if r > maxR
        maxR = r;
        maxI = i;
    end
end

s = randi(n);

out(maxI) = x(s);
out(s) = x(maxI);
        