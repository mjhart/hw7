function out = swapCircles(x)

out = zeros(size(x));
out(:) = x(:);

c1 = randi(10) * 2 - 1;
c2 = randi(10) * 2 - 1;

out(c1) = x(c2);
out(c1+1) = x(c2+1);
out(c2) = x(c1);
out(c2+1) = x(c1+1);

