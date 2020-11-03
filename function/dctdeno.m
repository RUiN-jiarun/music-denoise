function denoised_sound = dctdeno(noised_sound,t,w)
% DCT变换去噪

len = length(noised_sound);
tmp = floor(len * 10 / 100);
N = 1:len;

F = dct(noised_sound,len);
F(tmp:len) = 0;
for i = 1:tmp
   if F(i) < 40
       F(i) = F(i) * 0.2;
   end
end

denoised_sound = idct(F,len);

  %画滤噪后的图
m1=fft(denoised_sound);
figure;
subplot(2,1,1);
plot(N,F);
xlabel('长度');
ylabel('能量');
title('DCT处理后波形');
subplot(2,1,2);
plot(w,abs(m1));
xlabel('w');
ylabel('幅度');
title('滤噪声后信号频谱');


end


