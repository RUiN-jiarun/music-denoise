% ��������ģ��
clear
addpath('sound');
[x,f] = audioread('melody.wav');
[y,f1]= audioread('bass.wav');
[z,f2]= audioread('percussion.wav');

x1=x(:,1);
y1=y(:,1);
z1=z(:,1);

len1=length(x1); 
figure(1)
t1=(0:(len1-1))/f;
subplot(3,1,1);
plot(t1,x1);
axis([0,5,-1,1]);
xlabel('ʱ��t');
ylabel('����');
title('�ź�1ʱ����');

len2=length(y1);
subplot(3,1,2);
t2=(0:(len2-1))/f1;
plot(t2,y1);
axis([0,4,-0.5,0.5]);
xlabel('ʱ��t');
ylabel('����');
title('�ź�2ʱ����');

len3=length(z1);
subplot(3,1,3);
t3=(0:(len3-1))/f2;
plot(t3,z1);
axis([0,4,-0.5,0.5]);
xlabel('ʱ��t');
ylabel('����');
title('�ź�3ʱ����');

% ���������źŵĻ���
[m,n]=size(x1);         %sizeȡ�����������
[m0,n0]=size(y1);
a=zeros(abs(m-m0),n);   %������������Ϊ���������
if length(x1)<length(y1)
     x2=[x1;a];
     y2=x2+y1;          %������������һ��������ӣ�����Ҫ����
else 
     x2=[y1;a];
     y2=x2+x1;          %�����Ǹ����䣬�̵Ĳ���
end
[m1,n1]=size(z1);
[m2,n2]=size(y2);
b=zeros(abs(m1-m2),n1);
if length(z1)<length(y2)
    z2=[z1;b];
    y3=z2+y2;
else
    z2=[y2;b];
    y3=z2+y2;
end

% �����Ӻ����������
figure(2)
if len1 > len2
    if len1 > len3
        max = len1;
    else
        max = len3;
    end
elseif len2 > len3
    max = len2;
end
t4=(0:(max -1))/f;
plot(t4,y3);
axis([0,4.5,-0.5,0.5]);
xlabel('ʱ��');
ylabel('����');
title('���Ӻ�ʱ����');

% �ֱ𲥷�
sound(x1,f);
pause(10);
sound(y1,f1);
pause(10);
sound(z1,f2);
pause(10);
sound(y3,f1) ;
% audiowrite('add.wav',y3,f1);