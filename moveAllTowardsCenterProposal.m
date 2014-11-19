function out=moveAllTowardsCenterProposal(x)

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


center = [avgX, avgY];

for i=1:2:numel(out)-1
    d = center - x(i:i+1);
    out(i:i+1) = out(i:i+1) + norm(d);
end

    