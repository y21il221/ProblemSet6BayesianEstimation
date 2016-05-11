t = cputime;

close all
clear all

load('bayesian_data')
Y = bayesian_data(:,2);
X = [ones(3010,1), bayesian_data(:,3:7)];

beta_reg = inv(X'*X)*X'*Y
residual=Y-X*beta_reg
s=[sum((residual.^2))/(3010-6)]^0.5
sd=diag((s^2).*inv(X'*X)).^(1/2)
t=beta_reg./sd

[beta a] = MHsimple(Y, X);

figure(1)
hist(beta(:,1));
title('intercept')
figure(2)
hist(beta(:,2));
title('\beta_1')
figure(3)
hist(beta(:,3));
title('\beta_2')
figure(4)
hist(beta(:,4));
title('\beta_3')
figure(5)
hist(beta(:,5));
title('\beta_4')
figure(6)
hist(beta(:,6));
title('\beta_5')
figure(7)
hist(beta(:,7));
title('\sigma')

e = cputime - t;
display (['runtime is ', num2str(e)])

