function denoised_sound = butterworthdeno(noised_sound,t,w)
% ������˹�˲�ȥ��

Wp=0.1;Ws=0.16;Rp=1;Rs=15;
[n1,Wn1]=buttord(Wp,Ws,Rp,Rs,'s');          %���ͨ�˲����Ľ����ͽ�ֹƵ��
[b1,a1]=butter(n1,Wn1,'s');                 %��s���Ƶ����Ӧ�Ĳ���
[b2,a2]=bilinear(b1,a1,1);                  %����˫���Ա任ʵ��Ƶ����Ӧs��z��ı任
denoised_sound=filter(b2,a2,noised_sound);  %���˻����������ź�

  %��������ͼ
m1=fft(denoised_sound);
figure;
subplot(2,1,1);
plot(t,denoised_sound);
xlabel('ʱ��t');
ylabel('����');
title('���������ź�ʱ����');
subplot(2,1,2);
plot(w,abs(m1));
xlabel('w');
ylabel('����');
title('���������ź�Ƶ��');


end

