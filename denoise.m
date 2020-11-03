 % ȥ�봦��ģ��
clear
addpath('function');
addpath('sound');
[y,fs]=audioread('orchestra.wav');
y1=y(:,1);                      %ȡ����                            
N=length(y1);                   %���źų��� 
Y=fft(y1,N);                    %����Ҷ�任
t=(0:(N-1))/fs;                 %ʱ��
f=0:fs/N:fs*(N-1)/N;            %Ƶ��
w=2*f/fs;                       %��һ��

% ԭ�ź�ʱ���κ�Ƶ��ͼ
figure(1);
subplot(2,1,1);
plot(t,y1);
xlabel('ʱ��t');
ylabel('����');
title('ԭ�ź�ʱ����');
subplot(2,1,2);
plot(w,abs(Y));
xlabel('w');
ylabel('����');
title('ԭ�ź�Ƶ��ͼ');

% �������һ������
A0=0.05;                        %��������
d1=A0*cos(2*pi*3000*t);         %3kHz����������
d2=A0*cos(2*pi*5000*t);         %5kHz����������
d3=A0*cos(2*pi*8000*t);         %8kHz����������
x1=d1+d2+d3;                    %��������
X1=fft(x1);                     
y2=y1+(x1)';                    %�������һ���������ź�
Y1=fft(y2);                     
figure(2);
subplot(3,2,1);
plot(w,abs(X1));
xlabel('w');
ylabel('����');
title('����������Ƶ��');
subplot(3,2,3);
plot(t,y2);
xlabel('ʱ��t');
ylabel('����');
title('�������������ź�ʱ����');
subplot(3,2,5);
plot(w,abs(Y1));
xlabel('w');
ylabel('����');
title('�������������ź�Ƶ��ͼ');
% audiowrite('cosinenoise.wav',y2,fs);

% �����������
x2=0.05*randn(N,1);             %�������
X2=fft(x2);                     %��������Ҷ�任
y3=y1+x2;                       %������������ź�       
Y2=fft(y3);                     %�����źŸ���Ҷ�任
subplot(3,2,2);
plot(w,abs(X2));
xlabel('w');
ylabel('����');
title('���������Ƶ��ͼ');
subplot(3,2,4);
plot(t,y3);
xlabel('ʱ��t');
ylabel('����');
title('����������ź�ʱ����');
subplot(3,2,6);
plot(w,abs(Y2));
xlabel('w');
ylabel('����');
title('����������ź�Ƶ��ͼ');
% audiowrite('whitenoise.wav',y3,fs);

sound(y2,fs);%������������
pause(10);
sound(y3,fs);%���������
pause(10);

% DCTȥ�롪���������������OK
z1 = dctdeno(y2,t,w);
sound(z1,fs);
pause(10);
z2 = dctdeno(y3,t,w);
sound(z2,fs);
pause(10);
% audiowrite('dct1.wav',z1,fs);
% audiowrite('dct2.wav',z2,fs);

% DWTȥ�롪��Ч����̫��
z3 = dwtdeno(y2,t,w);
sound(z3,fs);
pause(10);
z4 = dwtdeno(y3,t,w);
sound(z4,fs);
pause(10);
% audiowrite('dwt1.wav',z3,fs);
% audiowrite('dwt2.wav',z4,fs);

% ��ֵ�˲�ȥ�롪��Ч����̫��
z5 = medfildeno(y2,t,w);
sound(z5,fs);
pause(10);
z6 = medfildeno(y3,t,w);
sound(z6,fs);
pause(10);
% audiowrite('medfil1.wav',z5,fs);
% audiowrite('medfil2.wav',z6,fs);

% ������˹�˲���ȥ�롪���������������OK,��������������Ч������
z7 = butterworthdeno(y2,t,w);
sound(z7,fs);
pause(10);
z8 = butterworthdeno(y3,t,w);
sound(z8,fs);
pause(10);
% audiowrite('butter1.wav',z7,fs);
% audiowrite('butter2.wav',z8,fs);

% ��˹�˲�ȥ�롪��Ч������Ĳ���ѷ�
% z9 = gaussdeno(y2,t,w);
% sound(z9,fs);
% pause(10);
% z10 = gaussdeno(y3,t,w);
% sound(z10,fs);
% audiowrite('gauss1.wav',z9,fs);
% audiowrite('gauss2.wav',z10,fs);






