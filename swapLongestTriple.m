function out = swapLongestTriple(x)

out = zeros(size(x));
out(:) = x(:);
n = numel(x);
load('cities.mat')

for i=1:n-2
    d1 = (locs(out(i),1) - locs(out(i+1),1)) ^ 2 + (locs(out(i),2) - locs(out(i+1),2)) ^ 2;
    %d2 = (locs(out(i+1),1) - locs(out(i+2),1)) ^ 2 + (locs(out(i+1),2) - locs(out(i+2),2)) ^ 2;
    d3 = (locs(out(i),1) - locs(out(i+2),1)) ^ 2 + (locs(out(i),2) - locs(out(i+2),2)) ^ 2;
    
    if d1 > d3
        tmp = out(i+1);
        out(i+1) = out(i+2);
        out(i+2) = tmp;
    end
end 