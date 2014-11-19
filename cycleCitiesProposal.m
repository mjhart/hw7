function out = cycleCitiesProposal(x)
% Given a proposal x, randomly choses a chunk of it and shifts all the
% items in that chunk a random amount, wrapping elements that get shifted
% off the end of the chunk.

% create out matrix and copy x into it
out = zeros(size(x));
out(:) = x(:);
n = numel(x);

s = randi(60); % chose random chunk size
start = randi(n-s); % chose random starting position
shift = randi(s); % chose random amount to shift items

for i=0:s-1
    j = rem(i + shift, s);
    out(start + i) = x(start + j);
    
end