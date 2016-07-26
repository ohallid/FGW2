function [] = schematic()

fs1     = 22;
fs2     = 17;

xx      = [-2:0.01:2];
xx1     = [1:0.01:2];
xx2     = [0:0.01:0.5];
xx3     = [0:0.01:1];
zz1     = [0:0.01:1 ];
zz2     = [1:0.01:2];
tt1     = [0:0.1:1];
tt2     = [-2:0.01:0];
tt3     = [1:0.01:2];
pi      = 3.14159265359;
sigma   = 0.40;
x0      = 0;

gz      = sin(pi*zz1);
gz_out  = 0;
fx      = exp(-((xx - x0).*(xx - x0))/(2* sigma *sigma));
xa      = 1;
heavi1  = 0.5;
heavi2  = 0.0;

figure(1)
h(1) = subplot('Position', [0.1 0.4, 0.8, 0.5]);
a1 = plot(xx, fx,'k-.','LineWidth',5);
hold on
a2 = plot(gz, zz1,'k:','LineWidth',5);
a3 = plot(zeros(size(xx1)), xx1,'k:','LineWidth',5);
%line( 1, xx)
a4  = plot(xx,ones(size(xx)),'r--', 'LineWidth',2);
a42 = plot(xx,(ones(size(xx))+0.8),'r--', 'LineWidth',2);
a5  = plot(zeros(size(xx3)), xx3,'b', 'LineWidth',2);
a6  = plot(xx2,(zeros(size(xx2))+0.5),'b--', 'LineWidth',2);
a7  = plot((zeros(size(xx2))+0.5), xx2,'b--', 'LineWidth',2);
M1  = 'F(x)';
M2  = 'S(z)';
ylim([0 2])
set(gca, 'XTick', [0 0.5])
set(gca, 'xticklabel', ['0';'L'],'FontSize',fs2)
xlabel('x','FontSize', fs1);
ylabel('z','FontSize', fs1);
set(gca, 'YTick', [ ])
set(gca, 'yticklabel', [])
text(-1, 1.4, 'N_s', 'FontSize',fs2, 'EdgeColor', 'w','BackgroundColor' , 'w')
text(-1, 0.6, 'N_t', 'FontSize',fs2, 'EdgeColor', 'w','BackgroundColor' , 'w')
text(-1.5, 1, 'H_t', 'FontSize',fs2, 'EdgeColor', 'w','BackgroundColor' , 'w')
text(-1.5, 1.8, 'H', 'FontSize',fs2, 'EdgeColor', 'w','BackgroundColor' , 'w')
%text(1, 1, 'F(x)', 'FontSize',fs2, 'EdgeColor', 'k','BackgroundColor' , 'y')
leg = legend([a1;a2], M1, M2);
set(leg,'FontSize',fs1);

h(2) = subplot('Position', [0.1 0.1, 0.8, 0.15]);
plot(tt2,zeros(size(tt2)),'k','LineWidth',4)
ylim([0 1.5])
xlim([-2 2])
hold on
%TT = [0;'T'];
plot(tt1,ones(size(tt1)),'k','LineWidth',4)
plot(tt3,zeros(size(tt3)),'k','LineWidth',4)
set(gca, 'XTick', [0 1 ])
set(gca, 'xticklabel', ['0';'T'],'FontSize',fs2)
%xlabh = get(gca,'XLabel');
%set(xlabh,'Position',get(xlabh,'Position') - [0 0.7 0])
xlabel('t','FontSize', fs1);
ylabel('S(t)','FontSize', fs1);
set(gca, 'YTick', [ ])
set(gca, 'yticklabel', [])

return