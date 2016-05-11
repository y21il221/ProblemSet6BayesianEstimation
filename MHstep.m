function [beta_1, a] = MHstep(beta_0, sig, Y, X)

  beta_p = normrnd(beta_0, sig, [7,1]);
  accprob = targetdist(beta_p, Y, X) - targetdist(beta_0, Y, X);
  u = rand;
  if log(u) <= accprob
      beta_1 = beta_p;
      a = 1;
  else
      beta_1 = beta_0;
      a = 0;
  end