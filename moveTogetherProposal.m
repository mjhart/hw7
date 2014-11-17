function out = moveTogetherProposal(x)

out = zeros(size(x));
for i=1:length(out)
    out(i) = x(i);
end

for i=17:-2:1
    minD = inf;
    minJ = 0;
    radiusI = (i + 1) / 2;
    for j=1:2:19
        if i ~= j   
            radiusJ = (j + 1) / 2;
            d = (x(i) - x(j)) ^ 2 + (x(i+1) - x(j+1)) ^ 2 - radiusI^2 - radiusJ^2;
            if minD > d
                minD = d;
                minJ = j;
            end
        end
    end
    v = x(minJ:minJ+1) - x(i:i+1);
    v = 0.1 * norm(v);
    out(i:i+1) = x(i:i+1) + v;
end