function prob_beta = targetdist(beta, Y, X)
n=size(Y,1);   
L=(-(n/2)*log(2*pi)-n*log(beta(7))-(1/(2*beta(7)^2))*(Y-X*beta(1:6))'*(Y-X*beta(1:6)));
P=-(1/2)*log(2*pi)-log(0.5)-(1/(2*(0.5^2)))*(beta(2)-0.06)^2;    
prob_beta = P + L;
end