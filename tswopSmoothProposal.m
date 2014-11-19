function out = tswopSmoothProposal(x)

out = zeros(size(x));
out(:,1) = x(:,1);
out(:,20) = x(:,20);

for i=2:19
    out(:,i) = x(:,i-1) + x(:,i) + x(:,i+1) ./ 3;
end
