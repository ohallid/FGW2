function [ c1, Nfound ] = NR3(HL_bar , Ht_bar, mmax, N1, N2)

% Requires an estimate of the period of the cotangent term in the secular
% equation to be input by inspecting data : see parameter xmax

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

xmin   = 0.5 / N2 / ratiopp2;
Deltax = 8 / 44 * 1000;                % Assigned by insepction of plot : estimate of average period of cotangent in SE at lid = 10 heating
xmax   = mmax * Deltax;                % No strict upper bound on x note. 
dx     = ( xmax - xmin ) / 1e7; 
x      = [xmin:dx:xmax];
N      = round( 1e7 );

% Seeding using parity criterion
Hkn        = ( N1 * N1 .* x .* x - 0.25 / ratiopp1 / ratiopp1 ) .^ 0.5;
Hknp       = ( N2 * N2 .* x .* x - 0.25 / ratiopp2 / ratiopp2 ) .^ 0.5;
fx         = Hkn ./ Hknp + ( 1/ratiopp1 - 1/ratiopp2 ) * tan( Hkn*ratio ) ./ Hknp - tan ( Hkn * ratio ) .* cot( Hknp * (ratio - 1 ) );
index      = 0;
% Hx1(index) = xmin;
for n=1:N
    if ( fx(n)*fx(n+1) < 0 ) && (( abs(fx(n)) < 5 ) | (abs(fx(n+1)) < 5 ))
        index      = index + 1;
        Hx1(index) = x(n);
    end
end

% figure(1)
% l  = length(Hx1);
% y1 = zeros(l);
% plot(x, fx );
% xlabel('x H = H / c_n');
% ylabel('f( x H )');
% title('Secular equation for 2-layer problem with density variation with NR seeds.')
% ylim([-100 100]);
% xlim([0 xmax])
% hold on
% plot(Hx1 ,y1,'c*');
% grid on
% pause;

% Converge seeds
for n=1:10
    Hkn     = ( N1 * N1 .* Hx1 .* Hx1 - 0.25 / ratiopp1 / ratiopp1 ) .^ 0.5;
    Hknp    = ( N2 * N2 .* Hx1 .* Hx1 - 0.25 / ratiopp2 / ratiopp2 ) .^ 0.5;
    dHkndx  = N1 * N1 .* Hx1 ./ Hkn; 
    dHknpdx = N2 * N2 .* Hx1 ./ Hknp; 
    
    f       = Hkn ./ Hknp + ( 1/ratiopp1 - 1/ratiopp2 ) * tan( Hkn * ratio ) ./ Hknp - tan ( Hkn * ratio ) .* cot( Hknp * (ratio - 1 ) );
    
    dfdx    = - Hkn ./ ( Hknp .^ 2 ) .* dHknpdx + 1 ./ Hknp .* dHkndx...
              - ( 1/ratiopp1 - 1/ratiopp2 ) *         tan( Hkn * ratio )                      ./ Hknp ./ Hknp .* dHknpdx...
              + ( 1/ratiopp1 - 1/ratiopp2 ) * ratio * sec( Hkn * ratio ).* sec( Hkn * ratio ) ./ Hknp         .* dHkndx ...
              + tan ( Hkn * ratio         ) .* ( ( sin ( Hknp * (ratio - 1 ) )   .^-2 ).* dHknpdx * (ratio - 1 ))...
              - cot ( Hknp * (ratio - 1 ) ) .* ( ( sec   ( Hkn  *  ratio       ) .^ 2 ).* dHkndx  *  ratio      );
    
    Hx1     = Hx1 - f ./ dfdx  ;
%     plot(Hx1 ,y1,'r*');
end

Nfound  = length(Hx1);
c1      = 1 ./ Hx1;

% Plot f and converged seeds
% figure(2)
% plot(x, fx );
% xlabel('x=1/cn');
% ylabel('f(x)');
% title('Secular equation for 2-layer problem with density variation with converged free mode speeds.')
% ylim([-100 100]);
% xlim([0 xmax/2])
% hold on
% grid on
% plot(Hx1 ,y1,'c*');
% pause;
% close all

return
