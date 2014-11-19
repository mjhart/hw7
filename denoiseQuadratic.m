function x=denoiseQuadratic(inp,k)
% Given an input image inp, and a scaling factor k, returns the optimal
% quadratic denoising of the image, as specified in the handout

f_input = fft2(inp);

rows = size(inp,1);
cols = size(inp,2);

h = zeros(rows,cols);
v = zeros(rows,cols);

h(1,1) = 1;
h(1,2) = -1;
v(1,1) = 1;
v(2,1) = -1;

f1 = fft2(h);
f2 = fft2(v);

x = zeros(rows,cols);

for i=1:rows
    for j=1:cols
        a = k*(abs(f1(i,j)^2)+abs(f2(i,j)^2))+1;
        b = -2*f_input(i,j);
        x(i,j) = -b/(2*a); %min of quadratic (optimizing x)
    end
end

x = real(ifft2(x));
end
