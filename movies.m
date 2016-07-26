% function to produce movies to use in presentations
function [w_trop2,ww2  ] = movies () 

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
t       = [0:60:10800];

[xx1, tt1] = meshgrid(x1, t);

t = 1800;
[ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma );
ww1a    = ww;
bb1a    = bb;
ww1     = mean(ww);
bb1     = mean(bb);

folder = '/nfs/see-fs-02_users/mm10ojh/Desktop/temp_stuff/temp_2-layer/figs';
w_trop2 = zeros(181, 401);
t = 0;
for i = 1:181
    [ xx, zz, ww, bb ] = series_half_sinusoid_plots_3_copy_no_checks(HL_bar , HV_bar, Ht_bar, t, T, Scalar * HL_bar, sigma );
    
    ww2(i,:)     = mean(ww);
    bb2(i,:)     = mean(bb);
    
    w_ext2               = ww(5,:);
    w_trop2(i,:)         = w_ext2(:);     

%     
    figure(2)
    h(1) = subplot('Position', [0.1, 0.4, 0.8, 0.5]);
    surf(xx1, tt1, w_trop2,'linestyle', 'none')
    colormap(redblue(20))
    caxis([-4 4])
    view([0 75])
    %xlim([0 400])
    xlabel('')
    ylabel('Time (hrs)','FontSize', fs2)
    zlabel('')
    set(gca,'LineWidth',5)
    set(gca, 'xticklabel', [])
    set(gca, 'yticklabel', [0:0.5:3],'YTick', [0:1800:10800])
    set(gca, 'zticklabel', [],'ZTick', [])
    title('Hovmoller of mid Tropospheric w (m/s)','FontSize', fs1)


    h(2) = subplot('Position', [0.1, 0.1, 0.8, 0.2]);
    plot(xx,ww(5,:),'LineWidth',2,'Color',[0.5 0.5 0.5])
    xlim([-20 20])
    set(gca,'XTick',[-20:5:20], 'xticklabel', [-200:50:200],'FontSize', fs2)
    ylim([-2 4])
    set(gca,'LineWidth',5)
    xlabel('x (km)','FontSize', fs2)
    ylabel('<w>_z (m/s)','FontSize', fs2)
    title('Mid Tropospheric w (m/s)','FontSize', fs1)
    
    t = t + 60;
    
    
    % Create a PNG filename.
	pngFileName = sprintf('movie_rotate_%d.png', i);
	fullFileName = fullfile(folder, pngFileName);
		
	% Then save it
    saveas(gcf, fullFileName, 'png')
    
%     saveas(h,sprintf('movie%d.png',i));  
    
    pause(0.1)
    
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