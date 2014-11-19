function out = swapPairs(x)
% Randomly choses a chunk in x and swaps each element in the chunk with the
% subsequent element.

out = zeros(size(x));
out(:) = x(:);
n = numel(x);

chunkSize = randi(60); % randomly chose chunk size
start = randi(n-chunkSize); % randomly chose starting point

for i=0:2:chunkSize-1
    out(start + i) = x(start + i + 1);
    out(start + i + 1) = x(start + i);
end
