function denoised_sound = gaussdeno(noised_sound,t,w)
% ��˹�˲�ȥ��

denoised_sound = gaussfil(noised_sound);


  %��������ͼ
m1=fft(denoised_sound);
figure;
subplot(2,1,1);
plot(t,denoised_sound);
xlabel('����');
ylabel('����');
title('���������ź�ʱ����');
subplot(2,1,2);
plot(w,abs(m1));
xlabel('w');
ylabel('����');
title('���������ź�Ƶ��');


end
