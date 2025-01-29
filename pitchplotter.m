% clear
% clc

x1 = [-40 -40 40 40];
y1 = [-20 60 60 -20];
z1 = [0 0 0 0];
c1 = [0.45 0.9 0.15];

fill3(x1,y1,z1,c1)
hold on

xcrossbar = linspace(-2.8, 2.8, 100);
ycrossbar = zeros(100);
zcrossbar = zeros(100)+3;

plot3(xcrossbar, ycrossbar, zcrossbar, Color='k', LineWidth=1)



xupright1 = zeros(100)-2.8;
xupright2 = zeros(100)+2.8;
yupright = zeros(100);
zupright = linspace(0, 17, 100);

plot3(xupright1, yupright, zupright, Color='k', LineWidth=1)
plot3(xupright2, yupright, zupright, Color='k', LineWidth=1)

xtryline = linspace(-35, 35, 100);
ytryline = zeros(100);
ztryline = zeros(100);

xtouchline1 = zeros(100)-35;
xtouchline2 = zeros(100)+35;
ytouchline = linspace(-10, 110, 100);

xhorizbar = linspace(0, 5, 100);
yhorizbar = zeros(100);

xvertbar = zeros(100);
yvertbar = linspace(0, 5, 100);

plot3(xtryline, ytryline, ztryline, Color='w', LineWidth=2)
plot3(xtryline, ytryline+22, ztryline, Color='w', LineWidth=2)
plot3(xtryline, ytryline+50, ztryline, Color='w', LineWidth=2)
plot3(xtryline, ytryline-10, ztryline, Color='w', LineWidth=2)
plot3(xtouchline1, ytouchline, ztryline, Color='w', LineWidth=2)
plot3(xtouchline2, ytouchline, ztryline, Color='w', LineWidth=2)

plot3(xvertbar+20, yvertbar+5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar+30, yvertbar+5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar-20, yvertbar+5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar-30, yvertbar+5, ztryline, Color='w', LineWidth=2)

plot3(xvertbar-30, yvertbar+19.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar-20, yvertbar+19.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar+30, yvertbar+19.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar+20, yvertbar+19.5, ztryline, Color='w', LineWidth=2)

plot3(xvertbar-30, yvertbar+37.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar-20, yvertbar+37.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar+30, yvertbar+37.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar+20, yvertbar+37.5, ztryline, Color='w', LineWidth=2)

plot3(xvertbar-30, yvertbar+47.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar-20, yvertbar+47.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar+30, yvertbar+47.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar+20, yvertbar+47.5, ztryline, Color='w', LineWidth=2)

plot3(xvertbar-30, yvertbar+57.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar-20, yvertbar+57.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar+30, yvertbar+57.5, ztryline, Color='w', LineWidth=2)
plot3(xvertbar+20, yvertbar+57.5, ztryline, Color='w', LineWidth=2)

ycentbar = yvertbar.*0.2+49.5;
xcentbar = zeros(100);
plot3(xcentbar, ycentbar, ztryline, Color='w', LineWidth=2)

plot3(xhorizbar+7.5, yhorizbar+5, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-12.5, yhorizbar+5, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar+17.5, yhorizbar+5, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar+27.5, yhorizbar+5, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-22.5, yhorizbar+5, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-32.5, yhorizbar+5, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-2.5, yhorizbar+5, ztryline, Color='w', LineWidth=2)

plot3(xhorizbar+7.5, yhorizbar+40, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-12.5, yhorizbar+40, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar+17.5, yhorizbar+40, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar+27.5, yhorizbar+40, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-22.5, yhorizbar+40, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-32.5, yhorizbar+40, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-2.5, yhorizbar+40, ztryline, Color='w', LineWidth=2)

plot3(xhorizbar+7.5, yhorizbar+60, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-12.5, yhorizbar+60, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar+17.5, yhorizbar+60, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar+27.5, yhorizbar+60, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-22.5, yhorizbar+60, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-32.5, yhorizbar+60, ztryline, Color='w', LineWidth=2)
plot3(xhorizbar-2.5, yhorizbar+60, ztryline, Color='w', LineWidth=2)
%%
xlim([-40 40])
ylim([-20 60])
zlim([0 40])

