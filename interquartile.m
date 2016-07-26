function [ uu1, uu2, u, g ] = interquartile()

fs1     = 18;
fs2     = 14;

Scalar  = 20;
HV_bar  = 1;
Ht_bar  = 1.0;
HL_bar  = 63.999;
dx      = 0.1;
x1      = [0:dx:1 ];
fs1     = 18;
fs2     = 14;
t       = 1800;
T       = 1800;
tt      = [0:200:21600];
N1      = 0.01;
sigma   = 1;

N2      = 0.01; 
[ xx, zz, ww, bb, uu, dp ,e_flux, ke_flux_t ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
uu1  = mean(uu);
uu1  = sort(uu1);


N2      = 0.02; 
[ xx, zz, ww, bb, uu, dp ,e_flux, ke_flux_t ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
uu2  = mean(uu);
uu2  = sort(uu2);

u = [uu1; uu2];
g = [ zeros(length(uu1),1) ; ones(length(uu2),1)];

% N2      = 0.01; 
% HL_bar  = 1.0;
% [ xx, zz, ww, bb, uu, dp ,e_flux, ke_flux_t ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
% uu3  = mean(uu);
% uu3  = sort(uu3);
% 
figure(1)
boxplot(u, g,'Whisker',10)
%'Notch','on','Labels',{'N2 = N1', 'N2 = 2 N1'}) --- 'Whisker',1


return