function [ww1,area1, weight2] = w_max_spatial_decay()

sigma   = 5;     % multiplies reference value \sigma_0 i.e. sigma = 3 means sigma = 3 \sigma_0
Scalar  = 20;
HV_bar  = 1;
Ht_bar  = 1.001;
dx      = 0.1;
x1      = [0:dx:50 ];
fs1     = 20;
fs2     = 16;

T       = 14400;
t       = 3600;

HL_bar  = 63.999;
N1      = 0.01;
N2      = 0.01;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
ww1      = max(sqrt(ww.*ww));
area1    = sum(max(sqrt(ww.*ww)).*dx);
weight1  = sum(x1.*ww1.*dx) ./ area1;


% radiating N1 = 2 N2
HL_bar  = 63.999;
N1      = 0.01;
N2      = 0.02;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
ww2      = max(sqrt(ww.*ww));
area2    = sum(max(sqrt(ww.*ww)).*dx);
weight2  = sum(x1.*ww1.*dx) ./ area2;


% trapped
HL_bar  = 1.0;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma );
ww3      = max(sqrt(ww.*ww));
area3    = sum(max(sqrt(ww.*ww)).*dx);
weight3  = sum(x1.*ww1.*dx) ./ area3;

figure(1)
plot(x1, ww1, '--rx', 'LineWidth',0.5,'MarkerEdgeColor','r');
xlim([0 50])
% ylim([0 2])
hold on
plot(x1, ww2, '--bo','LineWidth',0.5,'MarkerEdgeColor','b');
plot(x1, ww3, '--k*','LineWidth',0.5,'MarkerEdgeColor','k');
set(gca,'XTick',[0:10:50], 'xticklabel', [0:100:500],'FontSize', fs2)
set(gca,'LineWidth',5)
xlabel('x (kms)','FontSize', fs2)
ylabel('w_{max} (m/s)','FontSize', fs2)
legend('radiating, N_t = N_s','radiating, 2N_t = N_s ','Trapped', 'Location','northwest')
%title('Mid Tropospheric w (m/s)','FontSize', fs1)



return
