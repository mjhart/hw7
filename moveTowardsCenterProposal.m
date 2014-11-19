function out=moveTowardsCenterProposal(x)

out = zeros(size(x));
out(:) = x(:);

avgX = 0;
for i=1:2:19
    avgX = avgX + x(i) * ((i+1) / 2)^2;
end
avgX = avgX / 385;

avgY = 0;
for i=2:2:20
    avgY = avgY + x(i) * (i / 2)^2;
end
avgY = avgY / 385;

i = randi(10) * 2 - 1;

center = [avgX, avgY];
d = center - x(i:i+1);

out(i:i+1) = out(i:i+1) + norm(d);

    