function [a,d] = dwt(x)
% ����HaarС������һάDWT�任��������任
% �㷨����Mallat�㷨
lpd = [1/2 1/2];
hpd = [-1/2 1/2];  
a = x;      
d = [];

cvl = conv(a,lpd);       % ��ͨ�˲�
dnl = downsample(cvl);   % �²���
cvh = conv(a,hpd);       % ��ͨ�˲�
dnh = downsample(cvh);   % �²���
a = dnl;                
d = [d,dnh];             
end

function y = downsample(x)
% �²�������ȡż��λ��ɾ����λ

N = length(x);        
M = floor(N/2);      
i = 1:M;
y(i) = x(2*i);
end