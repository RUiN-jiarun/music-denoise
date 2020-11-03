function denoised_sound = medfildeno(noised_sound,t,w)
% 中值滤波去噪

denoised_sound = medfil(noised_sound);


  %画滤噪后的图
m1=fft(denoised_sound);
figure;
subplot(2,1,1);
plot(t,denoised_sound);
xlabel('长度');
ylabel('能量');
title('滤噪声后信号时域波形');
subplot(2,1,2);
plot(w,abs(m1));
xlabel('w');
ylabel('幅度');
title('滤噪声后信号频谱');


end
