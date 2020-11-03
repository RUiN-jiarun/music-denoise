function y = gaussfil(x)
% 高斯滤波具体算法
r = 1999;           %高斯模板的大小参数
sigma = 1.0;        %标准差

GaussTemp = ones(1,r*2-1);
for i=1 : r*2-1
    GaussTemp(i) = exp(-(i-r)^2/(2*sigma^2))/(sigma*sqrt(2*pi));
end
% c = conv(x,GaussTemp);    %卷积
% len = length(c);
% y = c(199:len-198);
y = x;
for i = r : length(x)-r
    a = x(i-r+1 : i+r-1);
%     m = size(a);
%     n = size(GaussTemp);
    y(i) = a' * GaussTemp';
end

end
