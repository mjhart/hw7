function out = tswopOneRandomNoise(x)

out = zeros(size(x));
out(:,:) = x(:,:);

i = randi(size(x,2));
out(:,i) = rand(2,1) .* 2 -1;