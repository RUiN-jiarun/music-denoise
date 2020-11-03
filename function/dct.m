function b = dct(a,n)
% 转换成double类型
a = double(a);
% 转置成一位列向量
a = a(:);

if ((rem(n,2)==1))                      % 奇数长度
  % 形成中间偶对称矩阵
  y = zeros(2*n,1);
  y(1:n,:) = a;
  y(n+1:n+n,:) = flipud(a);
  % 执行快速傅里叶变换
  yy = fft(y);
  % 计算DCT系数
  w = (exp(-i*(0:n-1)*pi/(2*n))/sqrt(2*n)).';
  w(1) = w(1) / sqrt(2);
  b = w(:,ones(1,1)).* yy(1:n,:);       % 按元素相乘

else                                    % 偶数长度
  % 重新安排顺序
  y = [ a(1:2:n,:); a(n:-2:2,:) ];                                                                                                                                                         
  % 计算权重
  w = 2*exp(-i*(0:n-1)'*pi/(2*n))/sqrt(2*n);
  w(1) = w(1) / sqrt(2);
  W = w(:,ones(1,1));
  % 计算系数
  b = W .* fft(y);
end

b = real(b);
b = b';

end

