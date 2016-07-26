function [w_N_array_top , w_N_array_max, w_N_array_ave ] = N_contour()

fs1     = 18;
fs2     = 14;

Scalar       = 20;
HV_bar       = 1;
Ht_bar       = 1.0;
HL_bar       = 63.999;
dx           = 0.1;
dy           = 0.005;
x1           = [0:dx:20 ];
y1           = [0:dy:0.1];
T            = 1800;
t            = 3600;
N1           = 0.01;
sigma        = 1;



N2      = 0.01;
for i = 1:length(y1)
    [ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma, N1, N2 );
    % at interface
    w_N_array_top(i,:)    = ww(10,:);
    b_N_array_top(i,:)    = bb(10,:);
    % max
    w_N_array_max(i,:)    = max(ww);
    b_N_array_max(i,:)    = max(bb);
    % ave
    w_N_array_ave(i,:)    = mean(ww);
    b_N_array_ave(i,:)    = mean(bb);
    
    N2_N1(i) = N2 / N1;
    N2 = N2 + dy;
end


[xx1, yy1]   = meshgrid(x1,  N2_N1);

figure(1) 
contourf(xx1, yy1, w_N_array_top,20 )
colormap(redblue(10))

figure(2)
contourf(xx1, yy1, w_N_array_max,20 )
colormap(redblue(10))

figure(3)
contourf(xx1, yy1, w_N_array_ave,20 )
colormap(redblue(10))

return
