function out=wideScaleRandomNoisePairProposal(x)
% Changes two random coordinates 2i-1 and 2i of x by a random amount at a 
% random scale chosen in an exponential fashion from a range at least
% [.0001,100]
r = 10^(rand() * 6 - 4);

out = zeros(size(x));
for i=1:length(out)
    out(i) = x(i);
end

i = (randi(length(x) / 2) - 1) * 2 + 1;
%delta = randn() * r;
%out(i) = out(i) + delta;
%out(i+1) = out(i+1) + delta;
out(i) = out(i) + randn() * r;
out(i+1) = out(i+1) + randn() * r;