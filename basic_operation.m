% 基本操作：调音量与制造回音
clear
addpath('sound');
[x,f] = audioread('orchestra.wav');%音乐信号
[y,f1] = audioread('man.wav');%男生声音

% 单声道处理
x1=x(:,1);
y1=y(:,1);

% 画音乐信号时域图
len1=length(x1); 
figure(1)
t1=(0:(len1-1))/f;
plot(t1,x1);
axis([0,5,-1,1]);
xlabel('时间t');
ylabel('幅度');
title('音乐信号时域波形');

len2=length(y1);
figure(2)
t2=(0:(len2-1))/f1;
plot(t2,y1);% 男声
axis([0,4,-0.5,0.5]);
xlabel('时间t');
ylabel('幅度');
title('男声语音信号时域波形');

%对语音信号声音大小调节
%[y,f1] = audioread('man.wav');%男生声音
sound(y,f1); %播放原语音
y11=10*y;
sound(y11,f1); %加大音量播放
y22=0.5*y;
sound(y22,f1); %减小音量播放

% 画修改音量后的波形
figure(3);
subplot(2,1,1);
t1=(0:(len2-1))/f1;
plot(t1,y11);
axis([0,4.5,-1,1]);
xlabel('时间t');
ylabel('幅度');
title('加大音量时域波形');
subplot(2,1,2);
t1=(0:(len2-1))/f1;
plot(t1,y22);
axis([0,4.5,-1,1]);
xlabel('时间t');
ylabel('幅度');
title('减小音量时域波形');

% 音乐信号的回音

z11=y1(1:120000);               %截取部分
z11=z11';
int0=zeros(1,30000);            %1行2000列的零矩阵
temp1=[z11,int0,int0,int0];
temp2=[int0,0.5*z11,int0,int0];
temp3=[int0,int0,0.3*z11,int0]; %通过补零实现延时，同时声音一个比一个小
temp4=[int0,int0,int0,0.1*z11];
echo=temp1+temp2+temp3+temp4;   %多重声音相加实现回声
N=length(echo);
sound(echo,f1);                 %播放回音音乐
% audiowrite('echo.wav',echo,f1);

% 画回声波形
figure(4);
t1=(0:(N-1))/f1;
plot(t1,echo);
axis([0,4.5,-1,1]);
xlabel('时间t');
ylabel('幅度');
title('回声时域波形');
