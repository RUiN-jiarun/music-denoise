function a = idct(b,n)


b = double(b);
b = b(:); 


if rem(n,2)==1 
 
  w = sqrt(2*n) * exp(j*(0:n-1)*pi/(2*n)).';
  w(1) = w(1) * sqrt(2);
  W = w(:,ones(1,1));
  yy = zeros(2*n,m);
  yy(1:n,:) = W.*b;
  yy(n+2:n+n,:) = -j*W(2:n,:).*flipud(b(2:n,:));

  y = ifft(yy);


  a = y(1:n,:);

else 

  w = sqrt(2*n) * exp(j*pi*(0:n-1)/(2*n)).';
  w(1) = w(1)/sqrt(2);
  W = w(:,ones(1,1));

  y = ifft(W.*b);

  a = zeros(n,1);
  a(1:2:n,:) = y(1:n/2,:);
  a(2:2:n,:) = y(n:-1:n/2+1,:);
end

a = real(a);
a = a.'; 
end
