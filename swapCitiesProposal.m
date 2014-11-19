function out = swapCitiesProposal(x)
% Randomly choses two cities in x and swaps them

out = zeros(size(x));
out(:) = x(:);

c1 = randi(numel(x));
c2 = randi(numel(x));

out(c1) = x(c2);
out(c2) = x(c1);