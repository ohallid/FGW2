function [uu, dp, energy_flux, energy_flux_ratio, N_ratio] = energy_flux()

sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
Scaler  = 20;
HV_bar  = 5;
Ht_bar  = 1.001;
HL_bar  = 63.998;
dx      = 0.1;
x1      = [-5:dx:5 ];
fs1     = 18;
fs2     = 14;
t       = 3600;
T       = 3600;
N1      = 0.01;

N2 = 0.01;
for i = 1:20
    [ xx, zz, ww, bb, uu, dp ,e_flux, ke_flux_t ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma, N1, N2 );
    energy_flux          = max(ww(10,:) .* dp(10,:) );
    energy_flux_ratio(i) = energy_flux;
    N_ratio(i)           = N2 / N1; 
    N2                   = N2 + 0.005;
end

figure(1)
scatter( N_ratio, energy_flux_ratio )
ylim([ 0 20000]);

% figure(2)
% plot( N_ratio, e_flux_ratio )


return
