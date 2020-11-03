function y = idwt(a,d)
% ��DWT�任
lpr = [1 1];
hpr = [1 -1];          
la = length(a);             
ld = length(d);

while (ld >= la)                  % ��a��d�������ʱҪ׼������ѭ��
    upl = upsample(a);            % �ϲ���
    cvl = conv(upl,lpr);          % ��ͨ���
    
    td = d(ld - la + 1:ld);    
    uph = upsample(td);        % �ϲ���
    cvh = conv(uph,hpr);          % ��ͨ���
    
    a = cvl+cvh;                  % ׼����һ���ع�
    d = d(1:ld - la);             
    la = length(a);              % �����һ���ع����õ�ƽ����ϸ�ڲ���ϵ���ĳ���
    ld = length(d);
end                         
    y = a;                        % ������ع����� y �����ع���ɺ��ƽ������ϵ������ a
end

function y = upsample(x)
% �ϲ���������ȫ���У�ż��λ��0

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