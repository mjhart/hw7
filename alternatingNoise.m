function out = alternatingNoise(x)

out = zeros(size(x));
out(:,:) = x(:,:);

d = rand();

if randi(2) == 2
    d1 = d;
    d2 = -d;
else
    d1 = -d;
    d2 = d;
end

for j=1:2:size(x,2)-1
    out(1,j) = x(1,j) + d1;
    out(2,j) = x(2,j) + d2;
end
for j=2:2:size(x,2)
    out(1,j) = x(1,j) + d2;
    out(2,j) = x(2,j) + d1;
end