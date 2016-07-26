function [ww1,ww1pp ] = w_max_time_series()

sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
Scalar  = 20;
HV_bar  = 1;
Ht_bar  = 1.0;
dx      = 0.1;
x1      = [0:dx:1 ];
fs1     = 18;
fs2     = 14;
T       = 10800;
tt      = [0:10:1000];
N1      = 0.01;
N2      = 0.02; 

t=0;
for i=1:101


HL_bar  = 1.0;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma );
ww2(i)       = max(max(sqrt(ww.*ww)));
bb2(i)       = max(max(sqrt(bb.*bb)));

ww2p(i)       = mean(mean(sqrt(ww.*ww)));
bb2p(i)       = mean(mean(sqrt(bb.*bb)));

t = t + 10;

end


figure(5)
scatter(tt, bb2 );
xlabel('time(s)')
ylabel('PT')
grid on
hold on
scatter(tt, bb2p, '^');
legend('tropospheric max','troposperic mean')



return