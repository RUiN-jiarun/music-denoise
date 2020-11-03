function y = idwt(a,d)
% 反DWT变换
lpr = [1 1];
hpr = [1 -1];          
la = length(a);             
ld = length(d);

while (ld >= la)                  % 当a和d长度相等时要准备跳出循环
    upl = upsample(a);            % 上采样
    cvl = conv(upl,lpr);          % 低通卷积
    
    td = d(ld - la + 1:ld);    
    uph = upsample(td);        % 上采样
    cvh = conv(uph,hpr);          % 高通卷积
    
    a = cvl+cvh;                  % 准备下一层重构
    d = d(1:ld - la);             
    la = length(a);              % 求出下一层重构所用的平均、细节部分系数的长度
    ld = length(d);
end                         
    y = a;                        % 输出的重构序列 y 等于重构完成后的平均部分系数序列 a
end

function y = upsample(x)
% 上采样——补全序列，偶数位插0

N = length(x);        
M = 2 * N - 1;           
for i = 1:M          
    if mod(i,2)
        y(i) = x((i+1)/2);
    else
        y(i) = 0;
    end
end
end