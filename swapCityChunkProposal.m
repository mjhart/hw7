function out = swapCityChunkProposal(x)
% Randomly choses two equal sized chunks in x and swaps them

out = zeros(size(x));
out(:) = x(:);

s = randi(numel(x) / 2); % Randomly chose chunk size
n = floor(numel(x) / s); % number of chunks
c1 = randi(n); % chose a chunk
c2 = randi(n); % chose another chunk

% swap the two chunks
out((c1 - 1) * s + 1:c1 * s) = x((c2 - 1) * s + 1:c2 * s);
out((c2 - 1) * s + 1:c2 * s) = x((c1 - 1) * s + 1:c1 * s);