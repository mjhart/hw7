function out = tswopOneNumRandomNoise(x)

out = zeros(size(x));
out(:,:) = x(:,:);

i = randi(size(x,2));
j = randi(size(x,1));
out(j,i) = rand() .* 2 -1;