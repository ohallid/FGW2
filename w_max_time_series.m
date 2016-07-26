function [ww1] = w_max_time_series()

sigma   = 1;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
Scalar  = 20;
HV_bar  = 1;
Ht_bar  = 1.001;
dx      = 0.1;
x1      = [20:dx:100 ];
fs1     = 20;
fs2     = 16;
T       = 3600000;
tt      = [0:225:21600];


t=0;
for i=1:97
% radiating const N
HL_bar  = 63.999;
N1      = 0.01;
N2      = 0.01;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
% ww1(i)     = max(sqrt(ww(i)*ww(i)));
% bb1(i)     = max(sqrt(bb(i)*bb(i)));
ww1(i)     = max(max(sqrt(ww.*ww)));
ww1p(i)    = (-min(min(ww)) < max(max(ww)))*(max(max(ww)) - min(min(ww))) + min(min(ww));

% radiating N1 = 2 N2
HL_bar  = 63.999;
N1      = 0.01;
N2      = 0.02;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
% ww1(i)     = max(sqrt(ww(i)*ww(i)));
% bb1(i)     = max(sqrt(bb(i)*bb(i)));
ww2(i)     = max(max(sqrt(ww.*ww)));
ww2p(i)    = (-min(min(ww)) < max(max(ww)))*(max(max(ww)) - min(min(ww))) + min(min(ww));

% trapped
HL_bar  = 1.0;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma );
% ww1(i)     = max(sqrt(ww(i)*ww(i)));
% bb1(i)     = max(sqrt(bb(i)*bb(i)));
ww3(i)     = max(max(sqrt(ww.*ww)));
ww3p(i)    = (-min(min(ww)) < max(max(ww)))*(max(max(ww)) - min(min(ww))) + min(min(ww));


t = t + 225;

end

% figure(1)
% scatter(tt, ww1, 'x', 'LineWidth',1.5,'MarkerEdgeColor','r');
% xlim([0 21600])
% ylim([0 1])
% hold on
% scatter(tt, ww2, 100, 'o','LineWidth',1.5,'MarkerEdgeColor','b');
% scatter(tt, ww3, 100, '*','LineWidth',1.5,'MarkerEdgeColor','k');
% set(gca,'XTick',[0:3600:21600], 'xticklabel', [0:1:6],'FontSize', fs2)
% set(gca,'LineWidth',5)
% xlabel('t (hrs)','FontSize', fs2)
% ylabel('w_{max} (m/s)','FontSize', fs2)
% legend('radiating, N_t = N_s','radiating, 2N_t = N_s ','Trapped', 'Location','northwest')

figure(2)
plot(tt, ww1, '--rx', 'LineWidth',1.5,'MarkerEdgeColor','r');
xlim([0 21600])
% ylim([0 2])
hold on
plot(tt, ww2, '--bo','LineWidth',1.5,'MarkerEdgeColor','b');
plot(tt, ww3, '--k*','LineWidth',1.5,'MarkerEdgeColor','k');
set(gca,'XTick',[0:3600:21600], 'xticklabel', [0:1:6],'FontSize', fs2)
set(gca,'LineWidth',5)
xlabel('t (hrs)','FontSize', fs2)
ylabel('w_{max} (m/s)','FontSize', fs2)
legend('radiating, N_t = N_s','radiating, 2N_t = N_s ','Trapped', 'Location','northwest')
%title('Mid Tropospheric w (m/s)','FontSize', fs1)

figure(3)
plot(tt, ww1p, '--rx', 'LineWidth',1.5,'MarkerEdgeColor','r');
xlim([0 21600])
% ylim([0 2])
hold on
plot(tt, ww2p, '--bo','LineWidth',1.5,'MarkerEdgeColor','b');
plot(tt, ww3p, '--k*','LineWidth',1.5,'MarkerEdgeColor','k');
set(gca,'XTick',[0:3600:21600], 'xticklabel', [0:1:6],'FontSize', fs2)
set(gca,'LineWidth',5)
xlabel('t (hrs)','FontSize', fs2)
ylabel('w_{max} (m/s)','FontSize', fs2)
legend('radiating, N_t = N_s','radiating, 2N_t = N_s ','Trapped', 'Location','northwest')
%title('Mid Tropospheric w (m/s)','FontSize', fs1)

figure(4)
plot(tt, log(ww1), '--rx', 'LineWidth',1.5,'MarkerEdgeColor','r');
xlim([0 21600])
% ylim([0 2])
hold on
plot(tt, log(ww2), '--bo','LineWidth',1.5,'MarkerEdgeColor','b');
plot(tt, log(ww3), '--k*','LineWidth',1.5,'MarkerEdgeColor','k');
set(gca,'XTick',[0:3600:21600], 'xticklabel', [0:1:6],'FontSize', fs2)
set(gca,'LineWidth',5)
xlabel('t (hrs)','FontSize', fs2)
ylabel('w_{max} (m/s)','FontSize', fs2)
legend('radiating, N_t = N_s','radiating, 2N_t = N_s ','Trapped', 'Location','northwest')
%title('Mid Tropospheric w (m/s)','FontSize', fs1)

return
