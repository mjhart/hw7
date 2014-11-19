function out=wideScaleRandomNoiseProposal(x)
% Changes all coordinates of x by a random amount at a random scale chosen
% in an exponential fashion from a range at least [.0001,100]
r = 10^(rand() * 6 - 4);

out = zeros(size(x));
for i=1:numel(out)
    out(i) = x(i) + randn() * r;
end