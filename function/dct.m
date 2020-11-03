function b = dct(a,n)
% ת����double����
a = double(a);
% ת�ó�һλ������
a = a(:);

if ((rem(n,2)==1))                      % ��������
  % �γ��м�ż�Գƾ���
  y = zeros(2*n,1);
  y(1:n,:) = a;
  y(n+1:n+n,:) = flipud(a);
  % ִ�п��ٸ���Ҷ�任
  yy = fft(y);
  % ����DCTϵ��
  w = (exp(-i*(0:n-1)*pi/(2*n))/sqrt(2*n)).';
  w(1) = w(1) / sqrt(2);
  b = w(:,ones(1,1)).* yy(1:n,:);       % ��Ԫ�����

else                                    % ż������
  % ���°���˳��
  y = [ a(1:2:n,:); a(n:-2:2,:) ];                                                                                                                                                         
  % ����Ȩ��
  w = 2*exp(-i*(0:n-1)'*pi/(2*n))/sqrt(2*n);
  w(1) = w(1) / sqrt(2);
  W = w(:,ones(1,1));
  % ����ϵ��
  b = W .* fft(y);
end

b = real(b);
b = b';

end

