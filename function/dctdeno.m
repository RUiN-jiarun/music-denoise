function denoised_sound = dctdeno(noised_sound,t,w)
% DCT�任ȥ��

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

  %��������ͼ
m1=fft(denoised_sound);
figure;
subplot(2,1,1);
plot(N,F);
xlabel('����');
ylabel('����');
title('DCT�������');
subplot(2,1,2);
plot(w,abs(m1));
xlabel('w');
ylabel('����');
title('���������ź�Ƶ��');


end


