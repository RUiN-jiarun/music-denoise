function denoised_sound = medfildeno(noised_sound,t,w)
% ��ֵ�˲�ȥ��

denoised_sound = medfil(noised_sound);


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
