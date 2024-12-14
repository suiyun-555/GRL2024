function plot_foF2(foF2_0,showname)
load('Resolution_llh_global.mat')

total_ylim=20;
%
JJ=figure;
load coast;
plot(lat,long,'k');hold on;
surf(GLAT_MART,GLON_MART,foF2_0');
shading interp
alpha(0.7)
set(gca,'YLim',[GLON_MART(1) GLON_MART(end)]);
set(gca,'XLim',[GLAT_MART(1) GLAT_MART(end)]);
xticks([ceil(GLAT_MART(1)):30:ceil(GLAT_MART(end)) ceil(GLAT_MART(end))])
yticks([ceil(GLON_MART(1)):30:ceil(GLON_MART(end)) ceil(GLON_MART(end))])
xticklabels({'-90', '-60', '-30', '0','30','60','90'});  % �Զ���̶ȱ�ǩ
yticklabels({'-180','-150','-120','-90', '-60', '-30', '0','30','60','90','120','150','180'});  % �Զ���̶ȱ�ǩ
ax = gca;
ax.XTickLabelRotation = 45; % �� X ��̶ȱ�ǩ��ת 45 ��
ax.YTickLabelRotation = 45; % �� Y ��̶ȱ�ǩ��ת 45 ��
ylabel(('Longitude (deg)'),'FontSize',15);
xlabel(('Latitude (deg)'),'FontSize',15);
title(showname,'FontSize',15,'FontWeight','bold');
h=colorbar;colormap(jet);
h.Label.String ='(MHz)';
h.Label.FontSize=15;
view([90,-90]);
caxis([0,total_ylim])
set(gcf,'color','w');
% set(JJ,'Visible','off');
set(gca, 'DataAspectRatio', [0.9 1 1])
ax_pos = get(gca, 'Position');
ax_pos(1)=0.15;
cb_width = 0.03; % colorbar �Ŀ��
cb_left = ax_pos(1) + ax_pos(3) + 0.02; % colorbar �����λ��
cb_height = ax_pos(4) * 0.5; % ���磬����Ϊ������߶ȵ� 80%
cb_bottom = ax_pos(2) + (ax_pos(4) - cb_height) / 2; % ��ֱ����
set(h, 'Position', [cb_left, cb_bottom, cb_width, cb_height]);
ax_width = cb_left - ax_pos(1) - 0.05; % �����ʵ��ļ�϶
set(gca, 'Position', [ax_pos(1), ax_pos(2), ax_width, ax_pos(4)]);
set(gca,'FontSize',15,'Fontname','Times New Roman','FontWeight','bold');hold on
end