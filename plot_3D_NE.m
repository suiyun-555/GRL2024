function plot_3D_NE(Ne_set_list_cvx,GLON_MART,GLAT_MART,Height_MART,titext)
STATION_DPS=[1 19.5 109.1; 2 30.5 114; 3 52 122; 4 -69 76];
verity_station=[1   5.1000  -52.6000  107.3000;
                2    35.7000  139.5000   94.1000;
                3    47.1000   15.5000  538.3000;
                4    51.5000  -90.2000  315.2000;
                5   78.9000   11.9000   81.6000];  
GLONLength=size(GLON_MART,2);
HeightLength=size(Height_MART,2);
Ne_set_start=reshape(Ne_set_list_cvx,size(GLAT_MART,2),size(GLON_MART,2),size(Height_MART,2));
load coast;
figure
plot(long,lat,'k');hold on;
[X,Y,Z] = meshgrid(GLON_MART,GLAT_MART,Height_MART);
xslice =GLON_MART([1 end]);%floor(GLONLength*0.5) 
yslice =GLAT_MART(1);
zslice =[0 Height_MART(5)];
s = slice(X,Y,Z,Ne_set_start,xslice,yslice,zslice);hold on;
for k=2%1:size(STATION_DPS,1)
    plot(STATION_DPS(k,3),STATION_DPS(k,2),'co','MarkerSize',8,'LineWidth',8);hold on;
end
for i=1:5
    plot(verity_station(i,3),verity_station(i,2),'rs','MarkerSize',8,'LineWidth',8);hold on;
end
shading interp
alpha(0.7)
x1=xlabel(('Longitude (deg)'),'FontSize',15);
x2=ylabel(('Latitude (deg)'),'FontSize',15);
x3=zlabel(('Altitude (Km)'),'FontSize',15);
h=colorbar;colormap(jet);
h.Label.String ='Electron Density (el/m^{3})';
h.Label.FontSize=15;
% caxis([0*10^11,1.5*10^12])
caxis([0*10^11,2.0*10^12])
% caxis([-2.0*10^12,2.0*10^12])
set(gca,'XLim',[GLON_MART(1) GLON_MART(end)]);
set(gca,'YLim',[GLAT_MART(1) GLAT_MART(end)]);
set(gca,'ZLim',[0 Height_MART(floor(HeightLength*0.7))]);%Height_MART(1)
view([1,2,1.4]);
title(titext,'FontSize',15,'Fontname','Times New Roman','FontWeight','bold');
set(gcf,'color','w');
set(gca,'FontSize',15,'Fontname','Times New Roman','FontWeight','bold');hold on
pos = get(gca, 'Position');        
set(gcf, 'Position', [100, 100, 620, 450]);  
set(gca, 'OuterPosition', [0.01, 0.01, 0.98, 0.98]);  
