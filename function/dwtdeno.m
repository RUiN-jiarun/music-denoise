function denoised_sound = dwtdeno(noised_sound,t,w)
% DWT变换去噪

[a1,d1] = dwt(noised_sound);
[a2,d2] = dwt(a1);
[a3,d3] = dwt(a2);


var1 = var(d3);
var2 = var(d2);
var3 = var(d1);


t1 = sqrt(2*log(length(d3))*var1);
t2 = sqrt(2*log(length(d2))*var2);
t3 = sqrt(2*log(length(d1))*var3);

for i = 1:length(d1)
   if abs(d1(i)) < t3
       d1(i) = 0;
   else
       d1(i) = sign(d1(i)) * (abs(d1(i)) - t3);
   end
end

for i = 1:length(d2)
   if abs(d2(i)) < t2
       d2(i) = 0;
   else
       d2(i) = sign(d2(i)) * (abs(d2(i)) - t2);
   end
end

for i = 1:length(d3)
   if abs(d3(i)) < t1
       d3(i) = 0;
   else
       d3(i) = sign(d3(i)) * (abs(d3(i)) - t1);
   end
end

xx1 = idwt(a3,d3);
xx2 = idwt(xx1,d2);
denoised_sound = idwt(xx2,d1);

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

