function y = gaussfil(x)
% ��˹�˲������㷨
r = 1999;           %��˹ģ��Ĵ�С����
sigma = 1.0;        %��׼��

GaussTemp = ones(1,r*2-1);
for i=1 : r*2-1
    GaussTemp(i) = exp(-(i-r)^2/(2*sigma^2))/(sigma*sqrt(2*pi));
end
% c = conv(x,GaussTemp);    %���
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
