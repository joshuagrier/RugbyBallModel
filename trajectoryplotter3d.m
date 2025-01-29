clear 
clc
%% Specify initial conditions
% define major and minor axis lengths for the ellipsoid
a = 0.098;
c = 0.15;

% specify initial x and y coordinates (the position of the kick)
xpos = 15;
ypos = 40;

% specify mass of rugby ball
m = 0.46;

% specify angle of ball from vertical (positive if tilted towards kicker)
theta = 0;

% specify force of the kick
Forceideal = 1400;
psi = pi/3;

% specify kick location on the ball
d = 1/3;

%% Convert input variables to relevant forms
% use the initial parameters to create force vector
F = Forceideal.*[cos(psi), 0, sin(psi)];
% make sure inputs are physically relevant (that the applied force is
% possible to apply by a kick)
kickargmax = abs(atan((-a.*sin(theta).*cos(d.*pi)-c.*sin(d.*pi).*cos(theta))./(a.*cos(theta).*cos(d.*pi)+c.*sin(d.*pi).*sin(theta))));
if psi >= pi/2 
    disp('Please choose a kickangle <  pi/2');
    return
elseif psi <= 0 
    disp('Please choose a kickangle >  0');
    return
elseif psi > kickargmax 
    error = ['Please choose a kickangle < ',num2str(kickargmax)];
    disp(error)
    return
else
end
% calculate torque
yhat = -a.*cos(theta).*sin(d.*pi)-c.*sin(theta).*cos(d.*pi);
zhat = a.*sin(theta).*sin(d.*pi)-c.*cos(theta).*cos(d.*pi);
torque = F(2).*yhat-F(1).*zhat;
% specify contact duration (literature states 9-12ms)
t = 0.01;
% calculate initial angular and linear velocities
Omega = -torque.*t./(m.*(a.^2+c.^2)./5);
initialvelocity = F.*t./m;

%% Solve for the trajectory
% set options for ode78
opts = odeset('Reltol',1e-13,'AbsTol',1e-14,'Stats','on');

% format initial conditions and time interval of interest for the
% trajectories
tspan = [0 5];
x0 = [0, initialvelocity(1), 0, initialvelocity(3), Omega];

% solve the system of dynamic equations to find the trajectory of the ball
[t,x] = ode78(@(t, X) xsys4(t, X, m, a, c, Omega), tspan, x0);

%% Transform trajectory so that it originates from the kick position and 
% is aimed at the posts

% calculate angle to rotate trajectory through,
trajangle = pi-atan(abs(xpos)./ypos);

xnew = [zeros(1,length(x)); 
    x(:,1).'; 
    x(:,3).'];

xrot = [cos(trajangle), -sin(trajangle), 0; sin(trajangle), cos(trajangle), 0; 0, 0, 1];

% form vector of initial kick position for this simulation 
xinitial = [xpos;
    ypos;
    0];

% transform the trajectory
xplot = xinitial+xrot*xnew;

% find which element of the trajectory vector corresponds to crossing the
% try line
search = xplot(2,:);
zci = @(v) find(diff(sign(v)));  
ycrit = zci(search);

% check if ball crosses try line
if xplot(3,ycrit(1))>3 && xplot(3,ycrit(1)+1)>3 && abs(xplot(1,ycrit(1)))<2.8 && abs(xplot(2,ycrit(1)+1))<2.8
    % plot trajectory in blue if kick is successful
    plot3(xplot(1,:),xplot(2,:),xplot(3,:), LineWidth=1, Color='b')
else
    % plot trajectory in red if kick is unsuccessful
    plot3(xplot(1,:),xplot(2,:),xplot(3,:), LineWidth=1, Color='r')
end

%%
% axis([0 35 0 10])

xlim([-40 40])
ylim([-40 60])
zlim([0 50])

hold on
