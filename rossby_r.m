% time series of stationary point at GCM grid square edge.
% compares trapped, radiating, llc, short sharp, long smooth, 2-layer(?)
function [weight] = rossby_r()

sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
Scaler  = 20;
HV_bar  = 1;
Ht_bar  = 1.001;
dx      = 0.1;
x1      = [0:dx:20 ];
fs1     = 18;
fs2     = 14;
t       = 3600;
T       = 3600;
xx      = [0:0.1:10];


% 2 -layer
HL_bar  = 63.98;
N1      = 0.01;
N2      = 0.02;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma, N1, N2 );
ww3       = mean(ww);
bb3       = mean(bb);
ww3p      = max(ww);
bb3p      = max(bb);
ww3pp     = ww(2,:);
bb3pp     = bb(2,:);

% % 1 - layer
% HL_bar  = 63.98;
% N1      = 0.01;
% N2      = 0.01;
% [ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma, N1, N2 );
% ww2     = mean(ww);
% bb2     = mean(bb);
% ww2p     = max(ww);
% bb2p     = max(bb);
% ww2pp     = ww(2,:);
% bb2pp     = bb(2,:);
% 
% % trapped
% HL_bar  = 1.01;
% HV_bar  = 1.01;
% [ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma );
% ww1     = mean(ww);
% bb1     = mean(bb);
% ww1p     = max(ww);
% bb1p     = max(bb);
% ww1pp     = ww(2,:);
% bb1pp     = bb(2,:);

weight   = sum(x1 .* ww3 .* dx) / sum(ww3 .* dx);


figure(2)
plot(xx, ww3);
% ylim(ax(1),[-3 3])
% ylim(ax(2),[-8 8]);
% set(ax(1),'YTick', [ -3:1:3 ]);   
% set(ax(2),'YTick', [ -8:2:8 ]);
set(gca,'LineWidth',3);
% set(h1,'Color','b');
% set(h2,'Color','r');
% set(ax(2),'ycolor','r')
% set(ax(1),'ycolor','b')
hold on
grid on
%line(xx,bb3 * 273 / 9.81,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle','--')
xlabel('x (kms)', 'FontSize', fs2)
% ylabel(ax(1),'Average Tropospheric w (m/s)', 'FontSize', fs2)
% ylabel(ax(2),'Average Tropospheric Potential Temperature (K)', 'FontSize', fs2)
%text(8,-1, 't = 30mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')






return