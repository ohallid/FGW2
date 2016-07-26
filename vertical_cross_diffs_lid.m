function [bb] = vertical_cross_diffs_lid()

fs1   = 18;
fs2   = 14;

t        = 21600;
T        = 3600;  % secs
sigma    = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
Ht_bar   = 1.0021;
Scalar   = 20;
%HL_bar   = 63.98;         %   relative lid height
HV_bar  = 1.01;
N1      = 0.01;
N2      = 0.02;

figure(1)
% x = sprintf('Vertical Velocity (m/s)');
% title(x,'FontSize', fs1);

% RADIATING w
h(1)  =  subplot('Position', [0.1 0.55, 0.2, 0.3]);
%t        = 600;
%sigma    = 1;
HL_bar   = 63.98;         %   relative lid height
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma , N1, N2);
ww1      = ww;
bb1      = bb;
contourf(xx,zz,ww1,20);
colormap(redblue(40))
colorbar('north')
caxis([-3 3]);
grid on
ylabel('z (km)','FontSize', fs2);
xlim([0 100])
ylim([0 1])
set(gca, 'XTick', [ ])
set(gca, 'xticklabel', [])
set(gca, 'YTick', [0:0.25:1 ])
set(gca, 'yticklabel', [0:2.5:10])

%text(-40, 2, '10mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')

% RADIATING b
h(2)  =  subplot('Position', [0.1 0.15, 0.2, 0.3]);
contourf(xx,zz,bb1,20);
colormap(redblue(40))
caxis([-1 1]);
grid on
ylabel('z (km)','FontSize', fs2);
xlabel('x (km)','FontSize', fs2);
xlim([0 100])
ylim([0 1])
set(gca, 'XTick', [0:20:100 ])
set(gca, 'xticklabel', [0:200:1000])
set(gca, 'YTick', [0:0.25:1 ])
set(gca, 'yticklabel', [0:2.5:10])
%text(-40, 2, '20mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')

% TRAPPED w
HL_bar   = 1.011; 
h(3)  =  subplot('Position', [0.4 0.55, 0.2, 0.3]);
%sigma    = 5;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T,  Scalar * HL_bar, sigma, N1, N2);
ww2      = ww;
bb2      = bb;
contourf(xx,zz,ww2,20);
colormap(redblue(40))
caxis([-3 3]);
grid on
xlim([0 100])
ylim([0 1])
set(gca, 'YTick', [ ])
set(gca, 'yticklabel', [])
set(gca, 'XTick', [ ])
set(gca, 'xticklabel', [])
%text(-40, 2, '40mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')

% TRAPPED b
h(4)  =  subplot('Position', [0.4 0.15, 0.2, 0.3]);
contourf(xx,zz,bb2,20);
colormap(redblue(40))
caxis([-1 1]);
grid on
xlim([0 100])
ylim([0 1])
xlabel('x (km)','FontSize', fs2);
set(gca, 'YTick', [ ])
set(gca, 'yticklabel', [])
%text(-40, 2, '40mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
set(gca, 'XTick', [0:20:100 ])
set(gca, 'xticklabel', [0:200:1000])


% DIFFS
h(5)  =  subplot('Position', [0.7 0.55, 0.2, 0.3]);
contourf(xx,zz,ww1 - ww2,20);
colormap(redblue(40))
caxis([-5 5]);
grid on
xlim([0 100])
ylim([0 1])
set(gca, 'YTick', [ ])
set(gca, 'yticklabel', [])
set(gca, 'XTick', [ ])
set(gca, 'xticklabel', [])

h(6)  =  subplot('Position', [0.7 0.15, 0.2, 0.3]);
contourf(xx,zz,bb1 - bb2,20);
colormap(redblue(40))
caxis([-1 1]);
grid on
xlim([0 100])
ylim([0 1])
xlabel('x (km)','FontSize', fs2);
set(gca, 'YTick', [ ])
set(gca, 'yticklabel', [])
%text(-40, 2, '40mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')
set(gca, 'XTick', [0:20:100 ])
set(gca, 'xticklabel', [0:200:1000])

figure(2)
h(1) = subplot(2,1,1);
contourf(xx,zz,ww1 - ww2,20);
colormap(redblue(20))
colorbar('eastoutside')
caxis([-6 6]);
grid on
text(90, 0.8, 'w (m/s)', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'y')
set(gca, 'YTick', [0:0.2:1 ])
set(gca, 'yticklabel', [0:2:10])
set(gca, 'XTick', [0:10:100])
set(gca, 'xticklabel', [])
ylabel('z (km)','FontSize', fs2);
%
h(2) = subplot(2,1,2);
contourf(xx,zz,bb1 - bb2,20);
colormap(redblue(20))
colorbar('eastoutside')
caxis([-0.4 0.4]);
grid on
text(90, 0.8, '\theta (K)', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'y')
set(gca, 'YTick', [0:0.2:1 ])
set(gca, 'yticklabel', [0:2:10])
set(gca, 'XTick', [0:10:100 ])
set(gca, 'xticklabel', [0:100:1000])
xlabel('x (km)','FontSize', fs2);
ylabel('z (km)','FontSize', fs2);

return