% time series of stationary point at GCM grid square edge.
function [ww1] = line_width_sensitivity()

sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
Scaler  = 20;
HV_bar  = 1;
HL_bar  = 63.98;
Ht_bar  = 1.001;
dx      = 0.1;
x1      = [0:dx:20 ];
fs1     = 18;
fs2     = 14;
t       = 3600;
T       = 3600;
xx      = [0:0.1:10];


sigma   = 1;
alpha   = 1;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma );
ww        = ww * alpha;
bb        = bb * alpha;
ww3       = mean(ww);
bb3       = mean(bb);
ww3p      = max(ww);
bb3p      = max(bb);
ww3pp     = ww(2,:);
bb3pp     = bb(2,:);

sigma   = 5;
alpha   = 0.2;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma );
% ww        = ww * alpha;
% bb        = bb * alpha;
ww2       = mean(ww);
bb2       = mean(bb);
ww2p      = max(ww);
bb2p      = max(bb);
ww2pp     = ww(2,:);
bb2pp     = bb(2,:);

sigma   = 2.5;
alpha   = 0.1;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scaler * HL_bar, sigma );
% ww        = ww * alpha;
% bb        = bb * alpha;
ww1       = mean(ww);
bb1       = mean(bb);
ww1p      = max(ww);
bb1p      = max(bb);
ww1pp     = ww(2,:);
bb1pp     = bb(2,:);



figure(2)
[ax,h1,h2] = plotyy(xx, ww1, xx, bb1);
ylim(ax(1),[-3 3])
ylim(ax(2),[-8 8]);
set(ax(1),'YTick', [ -3:1:3 ]);   
set(ax(2),'YTick', [ -8:2:8 ]);
set(h1,'LineWidth',3);
set(h2,'LineWidth',3);
set(h1,'Color','b');
set(h2,'Color','r');
set(ax(2),'ycolor','r')
set(ax(1),'ycolor','b')
hold on
grid on
line(xx,ww2,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle','--')
line(xx,bb2 ,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle','--')
line(xx,ww3,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle',':')
line(xx,bb3,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle',':')
%h_legend = legend('(a)','(b)','(c)','(d)','(e)','(f)','Location','northwest');
% set(ax(1),'xlim',[0 21600]);
% set(ax(2),'xlim',[0 21600]);
% set(gca, 'XTick', [0:3600:21600])
% set(gca, 'xticklabel', [0:1:6])
xlabel('x (kms)', 'FontSize', fs2)
ylabel(ax(1),'Average Tropospheric w (m/s)', 'FontSize', fs2)
ylabel(ax(2),'Average Tropospheric Potential Temperature (K)', 'FontSize', fs2)
%text(8,-1, 't = 30mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')


figure(3)
[ax,h1,h2] = plotyy(xx, ww1p, xx, bb1p);
ylim(ax(1),[-6 6])
ylim(ax(2),[-12 12]);
set(ax(1),'YTick', [ -6:2:6 ]);   
set(ax(2),'YTick', [ -12:2:12 ]);
set(h1,'LineWidth',3);
set(h2,'LineWidth',3);
set(h1,'Color','b');
set(h2,'Color','r');
set(ax(2),'ycolor','r')
set(ax(1),'ycolor','b')
hold on
grid on
line(xx,ww2p,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle','--')
line(xx,bb2p,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle','--')
line(xx,ww3p,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle',':')
line(xx,bb3p,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle',':')
%h_legend = legend('(a)','(b)','(c)','(d)','(e)','(f)','Location','northwest');
% set(ax(1),'xlim',[0 21600]);
% set(ax(2),'xlim',[0 21600]);
% set(gca, 'XTick', [0:3600:21600])
% set(gca, 'xticklabel', [0:1:6])
xlabel('x (kms)', 'FontSize', fs2)
ylabel(ax(1),'Maximum Tropospheric w (m/s)', 'FontSize', fs2)
ylabel(ax(2),'Maximum Tropospheric Potential Temperature (K)', 'FontSize', fs2)
%text( 8,-1, 't = 30mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')

figure(4)
[ax,h1,h2] = plotyy(xx, ww1pp, xx, bb1pp);
ylim(ax(1),[-2 2])
ylim(ax(2),[-4 4]);
set(ax(1),'YTick', [ -2:1:2 ]);   
set(ax(2),'YTick', [ -4:2:4 ]);
set(h1,'LineWidth',3);
set(h2,'LineWidth',3);
set(h1,'Color','b');
set(h2,'Color','r');
set(ax(2),'ycolor','r')
set(ax(1),'ycolor','b')
hold on
grid on
line(xx,ww2pp,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle','--')
line(xx,bb2pp,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle','--')
line(xx,ww3pp,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle',':')
line(xx,bb3pp,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle',':')
%h_legend = legend('(a)','(b)','(c)','(d)','(e)','(f)','Location','northwest');
% h_legend = legend('(a)','(b)','(c)','(d)','Location','northeast');
% set(ax(1),'xlim',[0 21600]);
% set(ax(2),'xlim',[0 21600]);
% set(gca, 'XTick', [0:3600:21600])
% set(gca, 'xticklabel', [0:1:6])
xlabel('x (kms)', 'FontSize', fs2)
ylabel(ax(1),'w (m/s) at 2km', 'FontSize', fs2)
ylabel(ax(2),'Potential Temperature (K) at 2km', 'FontSize', fs2)
%text(8, -1,'t = 30mins', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'w')




return