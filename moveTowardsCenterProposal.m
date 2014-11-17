function out=moveTowardsCenterProposal(x)

avgX = 0;
for i=1:2:19
    avgX = avgX + x(i) * (i+1) / 2;
end
avgX = avgX / 100;

avgY = 0;
for i=2:2:20
    avgY = avgY + x(i) * i / 2;
end
avgY = avgY / 110;

avgX
avgY
out=x
for i=1:2:19
end
    