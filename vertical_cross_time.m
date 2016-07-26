function [bb] = vertical_cross_time()

fs1   = 18;
fs2   = 14;


T        = 1800;  % secs
sigma    = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
Ht_bar   = 1.0021;
Scalar   = 20;
HL_bar   = 63.98;         %   relative lid height
HV_bar  = 5.1;
N1      = 0.01;
N2      = 0.02;

figure(2)
x = sprintf('Vertical Velocity (m/s)');
title(x,'FontSize', fs1);

h(1)  =  subplot('Position', [0.1 0.74, 0.35, 0.2]);
t        = 600;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma , N1, N2);
contourf(xx,zz,ww,20);
colormap(redblue(40))
colorbar('north')
caxis([-6 6]);
grid on
ylabel('z (km)','FontSize', fs2);
xlim([-50 50])
ylim([0 5])
set(gca, 'xticklabel', [])
set(gca, 'YTick', [0:1:5 ])
set(gca, 'yticklabel', [0, 10, 20, 30, 40, 50 ])
text(-40, 2, '10mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')

h(2)  =  subplot('Position', [0.1 0.52, 0.35, 0.2]);
t        = 1200;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma , N1, N2);
contourf(xx,zz,ww,20);
colormap(redblue(40))
caxis([-6 6]);
grid on
ylabel('z (km)','FontSize', fs2);
xlim([-50 50])
ylim([0 5])
set(gca, 'xticklabel', [])
set(gca, 'YTick', [0:1:5 ])
set(gca, 'yticklabel', [0, 10, 20, 30 , 40, 50])
text(-40, 2, '20mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')


%
h(3)  =  subplot('Position', [0.1 0.3, 0.35, 0.2]);
t        = 1800;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
contourf(xx,zz,ww,20);
colormap(redblue(40))
caxis([-6 6]);;
grid on
ylabel('z (km)','FontSize', fs2);
xlim([-50 50])
ylim([0 5])
set(gca, 'xticklabel', [])
set(gca, 'YTick', [0:1:5 ])
set(gca, 'yticklabel', [0, 10, 20, 30, 40, 50 ])
text(-40, 2, '30mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
%
h(4)  =  subplot('Position', [0.1 0.08, 0.35, 0.2]);
t        = 2400;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T,  Scalar * HL_bar, sigma, N1, N2);
contourf(xx,zz,ww,20);
colormap(redblue(40))
caxis([-6 6]);;
grid on
xlim([-50 50])
ylim([0 5])
xlabel('x (km)','FontSize', fs2);
ylabel('z (km)','FontSize', fs2);
set(gca, 'YTick', [0:1:5 ])
set(gca, 'yticklabel', [0, 10, 20, 30, 40, 50 ])
text(-40, 2, '40mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
set(gca, 'XTick', [-50:10:50 ])
set(gca, 'xticklabel', [-500:100:500])
%
h(5)  =  subplot('Position', [0.55 0.74, 0.35, 0.2]);
t        = 3000;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
contourf(xx,zz,ww,20);
colormap(redblue(40))
colorbar('north')
caxis([-6 6]);;
grid on
xlim([-50 50])
ylim([0 5])
% x = sprintf('Potential Temperature (K)');
% title(x,'FontSize', fs1);
set(gca, 'xticklabel', [])
set(gca, 'yticklabel', [])
text(-40, 2, '50mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')

%
h(6)  =  subplot('Position', [0.55 0.52, 0.35, 0.2]);
t        = 3600;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
contourf(xx,zz,ww,20);
colormap(redblue(40))
caxis([-6 6]);;
grid on
xlim([-50 50])
ylim([0 5])
set(gca, 'xticklabel', [])
set(gca, 'yticklabel', [])
text(-40, 2, '60mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')

%
h(7)  =  subplot('Position', [0.55 0.3, 0.35, 0.2]);
t        = 4200;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
contourf(xx,zz,ww,20);
colormap(redblue(40))
caxis([-6 6]);;
grid on
xlim([-50 50])
ylim([0 5])
set(gca, 'xticklabel', [])
set(gca, 'yticklabel', [])
text(-40, 2, '70mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
%
h(8)  =  subplot('Position', [0.55 0.08, 0.35, 0.2]);
t        = 4800;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
contourf(xx,zz,ww,20);
colormap(redblue(40))
caxis([-6 6]);;
grid on
xlabel('x (km)','FontSize', fs2);
xlim([-50 50])
ylim([0 5])
set(gca, 'yticklabel', [])
text(-40, 2, '80mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
set(gca, 'XTick', [-50:10:50])
set(gca, 'xticklabel', [-500:100:500])

return 

