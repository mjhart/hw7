function out = repeatBestsection(x)

min = inf;
bestSection = 0;
for i=6:size(x,2)-4
    d = tswopN(cat(2,x(:,1:5),x(:,i:i+4)));
    if d < min
        min = d;
        bestSection = x(:,i:i+4);
    end
end

out=zeros(size(x));
for i=1:5:size(x,2)-4
    if(i+4 <= size(x,2))
        out(:,i:i+4) = bestSection(:,:);
    end
end