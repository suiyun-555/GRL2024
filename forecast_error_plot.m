clc; clear all;
DATE=[2024 5 11];
%
count=2;
Error_y_1=[];
for i=0:23
    Error_mean_precent_temp=fore_results{i*12+1,3};
    Error_y_1=[Error_y_1 Error_mean_precent_temp(count+1)];
end
%
count=12;
Error_y_2=[];
for i=0:23
    Error_mean_precent_temp=fore_results{i*12+1,3};
    Error_y_2=[Error_y_2 Error_mean_precent_temp(count+1)];
end
showname='Forecast at Different Epoch, May 11';
figure('Position', [100, 100, 900, 450]); 
plot(Error_y_1,'Color',  'b', 'LineWidth', 2,'Marker', '*','MarkerSize', 10);hold on
plot(Error_y_2, 'Color',  'r','LineWidth', 2,'Marker', 'o','MarkerSize', 10);hold on
xlabel('Hour');
ylabel('Ne Relative Error (%)');
legend(['2Hour'],['12Hour']);
title(showname,'FontSize',20,'Fontname','Times New Roman','FontWeight','bold')
ylim([0,10])
set(gcf,'color','w');
set(gca,'FontSize',20,'Fontname','Times New Roman','FontWeight','bold');hold on
print(gcf,strcat(figurefile,showname),'-dpng','-r600')
%%
count=0;
Error_precent_1=fore_results{12*count+1,3};
count=12;
Error_precent_2=fore_results{12*count+1,3};
showname='Forecast 24h Ne by DMD, May 11';
figure('Position', [100, 100, 900, 450]); 
plot(Error_precent_1,'Color',  'b', 'LineWidth', 2,'Marker', '*','MarkerSize', 10);hold on
plot(Error_precent_2, 'Color',  'r','LineWidth', 2,'Marker', 'o','MarkerSize', 10);hold on
xlabel('Hour');
ylabel('Ne Relative Error (%)');
legend(['UTC0'],['UTC12']);
title(showname,'FontSize',20,'Fontname','Times New Roman','FontWeight','bold')
ylim([0,10])
set(gcf,'color','w');
set(gca,'FontSize',20,'Fontname','Times New Roman','FontWeight','bold');hold on
print(gcf,strcat(figurefile,showname),'-dpng','-r600')


