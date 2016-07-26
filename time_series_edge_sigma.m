% time series of stationary point at GCM grid square edge.
% compares trapped, radiating, llc, short sharp, long smooth, 2-layer(?)
function [ww1, bb1] = time_series_edge_sigma()

sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
Scalar  = 20;
HV_bar  = 1;
Ht_bar  = 1.001;
dx      = 0.01;
x1      = [-50:dx:50 ];
fs1     = 18;
fs2     = 14;
T       = 1800;
tt      = [0:450:21600];

t=0;
for i=1:49
% radiating solns
HL_bar  = 63.999;
% 
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma );
ww1(i)     = mean(mean(ww));
bb1(i)     = mean(mean(bb));
% long smooth
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma );
ww2(i)    = mean(mean(ww));
bb2(i)    = mean(mean(bb));


t = t + 450;

end

[ax,h1,h2] = plotyy(tt, ww1, tt, bb1);
ylim(ax(1),[-0.2 0.2])
ylim(ax(2),[-8 8]);
set(ax(1),'YTick', [ -0.2:0.1:0.2 ]);   
set(ax(2),'YTick', [ -8:2:8 ]);
set(h1,'LineWidth',3);
set(h2,'LineWidth',3);
set(h1,'Color','b');
set(h2,'Color','r');
set(ax(2),'ycolor','r')
set(ax(1),'ycolor','b')
hold on
grid on
line(tt,ww2,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle','--')
line(tt,bb2,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle','--')
h_legend = legend('(a)','(b)','(c)','(d)','Location','northeast');
set(ax(1),'xlim',[0 21600]);
set(ax(2),'xlim',[0 21600]);
set(gca, 'XTick', [0:3600:21600])
set(gca, 'xticklabel', [0:1:6])
xlabel('t (hrs)', 'FontSize', fs2)
ylabel(ax(1),'Average Tropospheric w (m/s)', 'FontSize', fs2)
ylabel(ax(2),'Average Tropospheric Potential Temperature (K)', 'FontSize', fs2)

return