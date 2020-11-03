% �������������������������
clear
addpath('sound');
[x,f] = audioread('orchestra.wav');%�����ź�
[y,f1] = audioread('man.wav');%��������

% ����������
x1=x(:,1);
y1=y(:,1);

% �������ź�ʱ��ͼ
len1=length(x1); 
figure(1)
t1=(0:(len1-1))/f;
plot(t1,x1);
axis([0,5,-1,1]);
xlabel('ʱ��t');
ylabel('����');
title('�����ź�ʱ����');

len2=length(y1);
figure(2)
t2=(0:(len2-1))/f1;
plot(t2,y1);% ����
axis([0,4,-0.5,0.5]);
xlabel('ʱ��t');
ylabel('����');
title('���������ź�ʱ����');

%�������ź�������С����
%[y,f1] = audioread('man.wav');%��������
sound(y,f1); %����ԭ����
y11=10*y;
sound(y11,f1); %�Ӵ���������
y22=0.5*y;
sound(y22,f1); %��С��������

% ���޸�������Ĳ���
figure(3);
subplot(2,1,1);
t1=(0:(len2-1))/f1;
plot(t1,y11);
axis([0,4.5,-1,1]);
xlabel('ʱ��t');
ylabel('����');
title('�Ӵ�����ʱ����');
subplot(2,1,2);
t1=(0:(len2-1))/f1;
plot(t1,y22);
axis([0,4.5,-1,1]);
xlabel('ʱ��t');
ylabel('����');
title('��С����ʱ����');

% �����źŵĻ���

z11=y1(1:120000);               %��ȡ����
z11=z11';
int0=zeros(1,30000);            %1��2000�е������
temp1=[z11,int0,int0,int0];
temp2=[int0,0.5*z11,int0,int0];
temp3=[int0,int0,0.3*z11,int0]; %ͨ������ʵ����ʱ��ͬʱ����һ����һ��С
temp4=[int0,int0,int0,0.1*z11];
echo=temp1+temp2+temp3+temp4;   %�����������ʵ�ֻ���
N=length(echo);
sound(echo,f1);                 %���Ż�������
% audiowrite('echo.wav',echo,f1);

% ����������
figure(4);
t1=(0:(N-1))/f1;
plot(t1,echo);
axis([0,4.5,-1,1]);
xlabel('ʱ��t');
ylabel('����');
title('����ʱ����');
