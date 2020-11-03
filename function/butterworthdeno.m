function denoised_sound = butterworthdeno(noised_sound,t,w)
% 巴特沃斯滤波去噪

Wp=0.1;Ws=0.16;Rp=1;Rs=15;
[n1,Wn1]=buttord(Wp,Ws,Rp,Rs,'s');          %求低通滤波器的阶数和截止频率
[b1,a1]=butter(n1,Wn1,'s');                 %求s域的频率响应的参数
[b2,a2]=bilinear(b1,a1,1);                  %利用双线性变换实现频率响应s域到z域的变换
denoised_sound=filter(b2,a2,noised_sound);  %求滤混合噪声后的信号

  %画滤噪后的图
m1=fft(denoised_sound);
figure;
subplot(2,1,1);
plot(t,denoised_sound);
xlabel('时间t');
ylabel('幅度');
title('滤噪声后信号时域波形');
subplot(2,1,2);
plot(w,abs(m1));
xlabel('w');
ylabel('幅度');
title('滤噪声后信号频谱');


end

