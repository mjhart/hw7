function out = inverseScaleRandomNoise(x)
out = zeros(size(x));
for i=1:size(x,1)
    for j=1:size(x,2)
        out(i,j) = x(i,j) + randn() * (1-abs(x(i,j)));
    end
end