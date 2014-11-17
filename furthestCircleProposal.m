function out=furthestCircleProposal(x)

out = zeros(size(x));
for i=1:length(out)
    out(i) = x(i);
end

avgX = 0;
for i=1:2:19
    avgX = avgX + x(i) * i;
end
avgX = avgX / 100;

avgY = 0;
for i=2:2:20
    avgY = avgY + x(i) * i-1;
end
avgY = avgY / 110;

outlier = 0;
max = -1;

for i=1:2:19
    d = (x(i) - avgX) ^ 2 + (x(i+1) - avgY) ^ 2;
    if d > max
        max = d;
        outlier = i;
    end
end

r = 10^((rand() * 6 - 4));
out(outlier) = out(outlier) + randn() * r;
out(outlier+1) = out(outlier+1) + randn() * r;