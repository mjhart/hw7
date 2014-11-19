function out = sequentialRandomNoise(x)

out = zeros(size(x));
out(:,:) = x(:,:);
d = tswop(x);

% if d < -6
%     out(:,16:20) = rand(2,5) .* 2 - 1;
%     return
% end

if d < -3
    out(:,11:15) = rand(2,5) .* 2 - 1;
    return
end

if d < -1.5
    out(:,6:10) = rand(2,5) .* 2 - 1;
    return
end

out(:,1:5) = rand(2,5) .* 2 - 1;

