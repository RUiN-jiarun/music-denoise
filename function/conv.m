function y = conv(x,h)
% Ò»Î¬¾í»ýº¯Êý

nx = length(x);
nh = length(h);
y = zeros(1,nx+nh-1);
for index = 1:nx
    indexSum = x(index) * h;
    y(1,index:index + nh - 1) = y(1,index:index + nh - 1) + indexSum;
end

end



