function out = tswopFlipValues(x)

out = zeros(size(x));
for i=size(x,1)
    for j=size(x,2)
        out(i,j) = x(i,j) * (randi(2) * 2 - 3);
    end
end

