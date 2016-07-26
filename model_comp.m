% comparison of 3 models with variable density; trapped, radiating,
% stratified.
function [ww2, ww3] = model_comp()

clear all

fs1   = 18;
fs2   = 14;

HV_bar  = 5.0;             %   relative visualisation height
Ht_bar  = 1.0021;
sigma   = 1;
Scaler  = 20;
T       = 1800;
t       = 3600;


figure(1)

h(1)  =  subplot('Position', [0.1 0.7, 0.3, 0.2]);
% 2-Layer
HL_bar  = 63.98;
N1      = 0.01;
N2      = 0.02;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma, N1, N2 );
ww3  = ww;
bb3  = bb;
contourf(xx,zz,ww3,20);
colormap(redblue(20))
colorbar('north')
caxis([-8 8]);
grid on
ylabel('z (km)','FontSize', fs2);
xlim([0 10])
ylim([0 5])
x = sprintf('Vertical Velocity (m/s)');
title(x,'FontSize', fs1);
set(gca, 'xticklabel', [])
set(gca, 'YTick', [0:1:5 ])
set(gca, 'yticklabel', [0, 10, 20, 30, 40, 50 ])
text(0.5,2, '(a)', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
%
h(2)  =  subplot('Position', [0.1 0.4, 0.3, 0.2]);
% Single layer
HL_bar  = 63.98;
N1      = 0.01;
N2      = 0.01;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma, N1, N2 );
ww2  = ww;
bb2  = bb ;
contourf(xx,zz,ww2,20);
colormap(redblue(20))
caxis([-8 8]);
grid on
ylabel('z (km)','FontSize', fs2);
xlim([0 10])
ylim([0 5])
set(gca, 'xticklabel', [])
set(gca, 'YTick', [0:1:5 ])
set(gca, 'yticklabel', [0, 10, 20, 30 , 40, 50])
text(0.5,2, '(c)', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
%
h(3)  =  subplot('Position', [0.1 0.1, 0.3, 0.2]);
% Trapped
HL_bar  = 1.01;
HV_bar  = 1.01;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma);
ww1  = ww;
bb1  = bb;
contourf(xx,zz,ww1,20);
colormap(redblue(20))
caxis([-8 8]);
grid on
hold on
lz1  = zeros(101, 1);
lz1  = lz1 + 1;
plot(xx, lz1, 'Linewidth',3,'Color','k', 'Linestyle', '--' )
ylabel('z (km)','FontSize', fs2);
xlabel('x (km)','FontSize', fs2);
xlim([0 10])
ylim([0 5])
set(gca, 'XTick',[0:1:10],'xticklabel', [0:10:100])
set(gca, 'YTick', [0:1:5],'yticklabel', [0:10: 50])
text(0.5,2, '(e)', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
%
%
% b
h(4)  =  subplot('Position', [0.6 0.7, 0.3, 0.2]);
HL_bar  = 63.98;
HV_bar  = 10.0; 
N1      = 0.01;
N2      = 0.023;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma, N1, N2 );
ww3  = ww;
bb3  = bb;
contourf(xx,zz,bb3 * 273 / 9.81 ,20);
colormap(redblue(20))
colorbar('north')
caxis([-8 8]);
grid on
xlim([0 10])
ylim([0 5])
x = sprintf('Potential Temperature (K)');
title(x,'FontSize', fs1);
set(gca, 'xticklabel', [])
set(gca, 'yticklabel', [])
text(0.5,2, '(b)', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
%
h(5)  =  subplot('Position', [0.6 0.4, 0.3, 0.2]);
HL_bar  = 63.98;
N1      = 0.01;
N2      = 0.01;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma, N1, N2 );
ww2  = ww;
bb2  = bb ;
contourf(xx,zz,bb2 * 273 / 9.81,20);
colormap(redblue(20))
caxis([-8 8]);
grid on
xlim([0 10])
ylim([0 5])
set(gca, 'xticklabel', [])
set(gca, 'yticklabel', [])
text(0.5,2, '(d)', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
%
h(6)  =  subplot('Position', [0.6 0.1, 0.3, 0.2]);
HL_bar  = 1.01;
HV_bar  = 1.01;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma);
ww1  = ww;
bb1  = bb;
contourf(xx,zz,bb1  ,20);
colormap(redblue(20))
caxis([-8 8]);
grid on
hold on
lz1  = zeros(101, 1);
lz1  = lz1 + 1;
plot(xx, lz1, 'Linewidth',3,'Color','k', 'Linestyle', '--' )
xlabel('x (km)','FontSize', fs2);
xlim([0 10])
ylim([0 5])
set(gca, 'XTick',[0:1:10],'xticklabel', [0:10:100])
set(gca, 'yticklabel', [])
text(0.5,2, '(f)', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')

end
