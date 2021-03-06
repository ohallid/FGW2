function [mm] = M3_2(bm, HL_bar, c, A, fac, s, x, x_0, z, t, T, Ht_bar, sigma, N1, N2 )

root2   = sqrt(2.0);
pi      = 3.141592653589793;
g       = 9.81;                              % ms^{-2}        
ratio   = Ht_bar / HL_bar;
scaleht1= g / N1 / N1 / 1e4;               % units of Ht_bar
scaleht2= g / N2 / N2 / 1e4;
ratiop1 = Ht_bar  / scaleht1;
ratiop2 = Ht_bar  / scaleht2;
ratiopp1= scaleht1 / HL_bar;
ratiopp2= scaleht2 / HL_bar;

% Debugging 
% ratiop2 = ratiop1;
% ratiopp2= ratiopp1;

x2      = sqrt(pi) / 2 / root2 / ( c * HL_bar ) * F3_2(x, x_0,  c*HL_bar, t, T, sigma);
x3      = sqrt(pi) / 2 / root2 / ( c * HL_bar ) * F3_2(x, x_0,- c*HL_bar, t, T, sigma);
x_var   = x2 - x3 ;

Hkn1         = ( N1 * N1 / c / c - 0.25 / ratiopp1 / ratiopp1 ) .^ 0.5;
Hknp1        = ( N2 * N2 / c / c - 0.25 / ratiopp2 / ratiopp2 ) .^ 0.5;
region1      = z<=Ht_bar;              % Troposphere
region2      = z> Ht_bar;              % Stratosphere
phi(region1) = N1 * N1 * A       * sin ( Hkn1  .* z(region1) / HL_bar         ) .* exp( 1 .* z(region1) / 2 / Ht_bar * ratiop1 );
phi(region2) = N2 * N2 * A * fac * sin ( Hknp1 .* z(region2) / HL_bar - Hknp1 ) .* exp( 1 .* z(region2) / 2 / Ht_bar * ratiop2 );
z_var   = phi * bm;
z_var   = z_var';

mm      =  z_var * x_var;

return 