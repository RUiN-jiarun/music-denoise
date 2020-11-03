function [a,d] = dwt(x)
% 基于Haar小波基的一维DWT变换——单层变换
% 算法基于Mallat算法
lpd = [1/2 1/2];
hpd = [-1/2 1/2];  
a = x;      
d = [];

cvl = conv(a,lpd);       % 低通滤波
dnl = downsample(cvl);   % 下采样
cvh = conv(a,hpd);       % 高通滤波
dnh = downsample(cvh);   % 下采样
a = dnl;                
d = [d,dnh];             
end

function y = downsample(x)
% 下采样——取偶数位，删奇数位

N = length(x);        
M = floor(N/2);      
i = 1:M;
y(i) = x(2*i);
end