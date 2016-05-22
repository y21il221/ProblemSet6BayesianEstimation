
function [Beta,acc] = MHsimple(Y, X)

%parameters
burnin = 100000;
lag = 1;
nsamp = 100000;
sig = 0.001;
b = [0; 0.06; 0; 0; 0; 0; 0.1]
%b = [beta_reg; 0.1]

% storage
Beta = zeros(nsamp,7);
acc = [0,0];

% MH routine
for i = 1:burnin
    [b,a] =MHstep(b,sig, Y, X);
    i
    acc = acc + [a 1];
end

for i = 1:nsamp
    for j=1:lag
        [b,a] = MHstep(b,sig, Y, X)
        acc = acc + [a 1];
    end
    i
    Beta(i, :) = b;
end