function [ww1,ww1pp ] = w_max_time_series_sigma()

Scalar  = 20;
HV_bar  = 1;
Ht_bar  = 1.0;
HL_bar  = 63.999;
dx      = 0.1;
x1      = [0:dx:1 ];
fs1     = 18;
fs2     = 14;
T       = 1800;
tt      = [0:200:21600];
N1      = 0.01;
N2      = 0.01; 

t=0;
for i=1:109
% 
sigma   = 1; 
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
ww1(i)       = max(max(sqrt(ww.*ww)));
bb1(i)       = max(max(sqrt(bb.*bb)));
% ww1p         = mean(ww);
% bb1p         = mean(bb);
% ww1pp(i,:)   = ww1p(i);
ww1pp(i,:)   = mean(ww);

sigma   = 2.5;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
ww2(i)       = max(max(sqrt(ww.*ww)));
bb2(i)       = max(max(sqrt(bb.*bb)));
% ww1p         = mean(ww);
% bb1p         = mean(bb);
% ww1pp(i,:)   = ww1p(i);
%ww3pp(i,:)   = mean(ww);

sigma   = 5;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
ww3(i)       = max(max(sqrt(ww.*ww)));
bb3(i)       = max(max(sqrt(bb.*bb)));
% ww1p         = mean(ww);
% bb1p         = mean(bb);
% ww1pp(i,:)   = ww1p(i);
%ww3pp(i,:)   = mean(ww);


t = t + 200;

end

% 
% figure(5)
% scatter(tt, ww2);


figure(1)
[ax,h1,h2] = plotyy(tt, ww1, tt, bb1 * 273 / 9.81);
set(ax(1),'YTick', [ 0:2:10 ]);   
%set(ax(2),'YTick', [ -3:1:3 ]);
set(h1,'LineWidth',3);
set(h2,'LineWidth',3);
set(h1,'Color','b');
set(h2,'Color','r');
set(ax(2),'ycolor','r')
set(ax(1),'ycolor','b')
grid on
hold on
line(tt, ww2,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle','--' );
line(tt, ww3,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle',':' );
line(tt, bb2* 273 / 9.81,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle','--' );
line(tt, bb3* 273 / 9.81,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle',':' );
xlim([0 21600])
set(gca, 'XTick', [0:3600:21600])
set(gca, 'xticklabel', [0:1:6])
xlabel('t (hrs)', 'FontSize', fs2)
ylabel(ax(1),'Maximum Tropospheric w (m/s)', 'FontSize', fs2)
ylabel(ax(2),'Maximum Tropospheric Potential Temperature (K)', 'FontSize', fs2)
% 


% set(ax(1),'YTick', [ -0.2:0.1:0.2 ]);   
% set(ax(2),'YTick', [ -8:2:8 ]);
% set(h1,'LineWidth',3);
% set(h2,'LineWidth',3);
% set(h1,'Color','b');
% set(h2,'Color','r');
% set(ax(2),'ycolor','r')
% set(ax(1),'ycolor','b')
% hold on
% grid on
% line(tt,ww2,'parent',ax(1),'Color','b','LineWidth',3,'LineStyle','--')
% line(tt,bb2,'parent',ax(2),'Color','r','LineWidth',3,'LineStyle','--')
% h_legend = legend('(a)','(b)','(c)','(d)','Location','northeast');
% set(ax(1),'xlim',[0 21600]);
% set(ax(2),'xlim',[0 21600]);
% set(gca, 'XTick', [0:1800:10800])
% set(gca, 'xticklabel', [0:0.5:3])
% xlabel('t (hrs)', 'FontSize', fs2)
% ylabel(ax(1),'Average Tropospheric w (m/s)', 'FontSize', fs2)
% ylabel(ax(2),'Average Tropospheric Potential Temperature (K)', 'FontSize', fs2)



return