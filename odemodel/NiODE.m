function dydt = betaflow(t, y)

dydt = zeros(3,1);
  
alpha = 1;

Ch = 1600.0;
a = 0.3;
b = 6e-5;
c = 0.001;
gamma1 = 0.01;
gamma2 = 0.8;
v = 60.8;
r = 50.0;

iF = (Ch * exp(0.5 * y(1)) / (1.0 + Ch * exp(y(1))) + a * exp(y(1))) * (1.0 - y(2));

dydt(1) = (v - y(1)) / r - iF;
dydt(2) = 1.0 / gamma1 * (exp(0.5 * y(1)) / (1.0 + Ch * exp(y(1))) * (1.0 - y(2)) - b * Ch * y(3) * exp(y(1)));
dydt(3) = 1.0 / (alpha * gamma2) * (exp(2.0 * y(1)) * (y(2) - y(3)) - c * Ch * y(3) * exp(y(1)));

end