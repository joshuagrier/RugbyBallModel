function dxdt = xsys(t, X, m, a, c, Omega)
% specify gravitational acceleration
g = 9.81;

% angle between major axis of the ball and the ball's velocity
Phi = (0.92.*(a.^2+c.^2)./(-6.465.*pi.*a.*c.*(0.168.*sin(4.*pi./9)+0.296))).*log(abs((-6.465.*pi.*a.*c.*(0.168.*sin(4.*pi./9)+0.296)).*t./(0.92.*(a.^2+c.^2))+1./Omega))+log(abs(Omega));

theta = acos((X(2).*cos(Phi)-X(4).*sin(Phi))./sqrt(X(2)^2+X(4)^2));

% calculate linear drag force on the ball
drag = (1.293./2).*([X(2), X(4)]).^2.*(0.168.*sin(2.*(Phi-2.*pi./9))+0.296).*pi.*a.*(c.*cos(atand(a.*cot(theta)./c)).*sin(theta)+a.*sin(atand(a.*cot(theta)./c)).*cos(theta));

% calculate angular drag force on the ball 
spindrag = -sign(X(5)).*((1.293./2).*(X(5)).^2.*(0.168.*sin(5.*pi./9)+0.296).*pi.*a.*c)./(m.*(a.^2+c.^2)./5);

% calculate magnus force on the ball
magnus = -0.098.*(sin(Phi).*X(2)+cos(Phi).*X(4)).*(-0.6465.*(2.*(-0.00075503.*X(5).*X(4)))-0.6465.*(-2.*0.00190522.*X(5).*X(4)))+0.15.*(cos(Phi).*X(2)+sin(Phi).*X(4)).*(-0.6465.*(2.*(-0.00145164.*X(5).*X(2)))-0.6465.*(2.*(-0.00721888.*X(5).*X(2)))-0.6465.*(2.*(-0.00353209.*X(5).*X(2))));

% Newton's second law:
Xdotdot = (-drag.*[X(2), X(4)]./norm([X(2), X(4)])+abs(magnus).*[-X(4), X(2)]./norm([-X(4), X(2)]).^2-m.*g.*[0,1])./m;

% system of equations to be solved [y-position; y-component of velocity; z-position; 
% z-component of velocity; angular velocity about x-axis]
dxdt = [X(2);
        Xdotdot(1);
        X(4);
        Xdotdot(2);
        spindrag];
end
