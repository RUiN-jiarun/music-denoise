function y = medfil(x)
% 中值滤波具体算法
len = length(x);
y = zeros(1,len);
for i = 1:24
   y(i) = x(i);
end
for i = 25:len-24
   a =  x(i-24:i+24);
   a = sort(a);
   y(i) = a(25);
end
for i = len-23:len
   y(i) = x(i);
end

end

