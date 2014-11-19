function out = reverseSegment(x)
% Randomly choses a chunk in x and reverses the order of all the elements
% in that chunk.

out = zeros(size(x));
out(:) = x(:);
n = numel(x);

s = randi(60); % randomly chose chunk size
start = randi(n-s); % randomly chose starting position

for i=0:s
    out(start+i) = x(start+s-i);
end
