 % 去噪处理模块
clear
addpath('function');
addpath('sound');
[y,fs]=audioread('orchestra.wav');
y1=y(:,1);                      %取单列                            
N=length(y1);                   %求信号长度 
Y=fft(y1,N);                    %傅里叶变换
t=(0:(N-1))/fs;                 %时间
f=0:fs/N:fs*(N-1)/N;            %频率
w=2*f/fs;                       %归一化

% 原信号时域波形和频谱图
figure(1);
subplot(2,1,1);
plot(t,y1);
xlabel('时间t');
ylabel('幅度');
title('原信号时域波形');
subplot(2,1,2);
plot(w,abs(Y));
xlabel('w');
ylabel('幅度');
title('原信号频谱图');

% 加三余弦混合噪声
A0=0.05;                        %噪声幅度
d1=A0*cos(2*pi*3000*t);         %3kHz的余弦噪音
d2=A0*cos(2*pi*5000*t);         %5kHz的余弦噪音
d3=A0*cos(2*pi*8000*t);         %8kHz的余弦噪音
x1=d1+d2+d3;                    %噪声叠加
X1=fft(x1);                     
y2=y1+(x1)';                    %加三余弦混合噪声后信号
Y1=fft(y2);                     
figure(2);
subplot(3,2,1);
plot(w,abs(X1));
xlabel('w');
ylabel('幅度');
title('三余弦噪声频谱');
subplot(3,2,3);
plot(t,y2);
xlabel('时间t');
ylabel('幅度');
title('加三余弦噪声信号时域波形');
subplot(3,2,5);
plot(w,abs(Y1));
xlabel('w');
ylabel('幅度');
title('加三余弦噪声信号频谱图');
% audiowrite('cosinenoise.wav',y2,fs);

% 加随机白噪声
x2=0.05*randn(N,1);             %随机噪声
X2=fft(x2);                     %噪声傅里叶变换
y3=y1+x2;                       %加随机噪声后信号       
Y2=fft(y3);                     %加噪信号傅里叶变换
subplot(3,2,2);
plot(w,abs(X2));
xlabel('w');
ylabel('幅度');
title('随机白噪声频谱图');
subplot(3,2,4);
plot(t,y3);
xlabel('时间t');
ylabel('幅度');
title('加随机噪声信号时域波形');
subplot(3,2,6);
plot(w,abs(Y2));
xlabel('w');
ylabel('幅度');
title('加随机噪声信号频谱图');
% audiowrite('whitenoise.wav',y3,fs);

sound(y2,fs);%加三余弦噪声
pause(10);
sound(y3,fs);%加随机噪声
pause(10);

% DCT去噪——针对两种噪声都OK
z1 = dctdeno(y2,t,w);
sound(z1,fs);
pause(10);
z2 = dctdeno(y3,t,w);
sound(z2,fs);
pause(10);
% audiowrite('dct1.wav',z1,fs);
% audiowrite('dct2.wav',z2,fs);

% DWT去噪——效果不太好
z3 = dwtdeno(y2,t,w);
sound(z3,fs);
pause(10);
z4 = dwtdeno(y3,t,w);
sound(z4,fs);
pause(10);
% audiowrite('dwt1.wav',z3,fs);
% audiowrite('dwt2.wav',z4,fs);

% 中值滤波去噪——效果不太好
z5 = medfildeno(y2,t,w);
sound(z5,fs);
pause(10);
z6 = medfildeno(y3,t,w);
sound(z6,fs);
pause(10);
% audiowrite('medfil1.wav',z5,fs);
% audiowrite('medfil2.wav',z6,fs);

% 巴特沃斯滤波器去噪——针对两种噪声都OK,对于三余弦噪声效果更好
z7 = butterworthdeno(y2,t,w);
sound(z7,fs);
pause(10);
z8 = butterworthdeno(y3,t,w);
sound(z8,fs);
pause(10);
% audiowrite('butter1.wav',z7,fs);
% audiowrite('butter2.wav',z8,fs);

% 高斯滤波去噪——效果是真的差——已废
% z9 = gaussdeno(y2,t,w);
% sound(z9,fs);
% pause(10);
% z10 = gaussdeno(y3,t,w);
% sound(z10,fs);
% audiowrite('gauss1.wav',z9,fs);
% audiowrite('gauss2.wav',z10,fs);






