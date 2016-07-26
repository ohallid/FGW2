% function to produce movies to use in presentations
function [w_trop2,ww2  ] = movies2 () 

Scalar  = 20;
HV_bar  = 1;
Ht_bar  = 1.001;
HL_bar  = 63.999;
% HL_bar  = 1.0;
sigma   = 1.0;
dx      = 0.1;
x1      = [-20:dx:20 ];
fs1     = 18;
fs2     = 14;
T       = 1800;
t       = [100:100:5100];

[xx1, tt1] = meshgrid(x1, t);

t = 1800;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma );
ww1a    = ww;
bb1a    = bb;
ww1     = mean(ww);
bb1     = mean(bb);


w_trop2 = zeros(51, 401);
t = 100;
for i = 1:51
    [ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma );
    
    ww2(i,:)     = mean(ww);
    bb2(i,:)     = mean(bb);
    
    w_ext2               = ww(5,:);
    w_trop2(i,:)         = w_ext2(:);     

%     
    figure(2)
    h(1) = subplot('Position', [0.1, 0.35, 0.8, 0.6]);
    contourf(xx1, tt1, w_trop2)
    colormap(redblue(20))
    caxis([-4 4])
    view([0 90])
    %xlim([0 400])
    xlabel('')
    xlabel('')
    xlabel('')
    set(gca, 'xticklabel', [])
    set(gca, 'yticklabel', [],'YTick', [])
    set(gca, 'zticklabel', [],'ZTick', [])


    h(2) = subplot('Position', [0.1, 0.05, 0.8, 0.2]);
    plot(xx,mean(ww),'LineWidth',2,'Color','k')
    xlim([-20 20])
    ylim([-2 4])
    set(gca,'LineWidth',5)
   
    
    
    t = t + 100;
    
    pause(0.005)
end



% figure(1)
% h(1) = subplot('Position', [0.1, 0.35, 0.8, 0.6]);
% surf(ww1a)
% colormap(redblue(20))
% caxis([-4 4])
% view([180 60])
% xlim([0 400])
% xlabel('')
% xlabel('')
% xlabel('')
% set(gca, 'xticklabel', [])
% set(gca, 'yticklabel', [],'YTick', [])
% set(gca, 'zticklabel', [],'ZTick', [])
% 
% 
% h(2) = subplot('Position', [0.1, 0.05, 0.8, 0.2]);
% plot(xx,ww1)
% xlim([-20 20])





return 