clc
clear all

t = 1:0.1:4;
dt = 1e-8;
pd = @(t) [0.42*cos(t*pi/10); 0.42*sin(t*pi/10); 0.1*(1+sin(t))];
pd_dot = (pd(t + dt) - pd(t)) / dt ;
pd = [0.42*cos(t*pi/10); 0.42*sin(t*pi/10); 0.1*(1+sin(t))];
phid = @(t) [t*pi/10+7*pi/12];
phid_dot = (phid(t + dt) - phid(t)) / dt
phid = [t*pi/10+7*pi/12]


% pd = matlabFunction(pd);
% pd_dot = diff(pd)
% phid_dot = matlabFunction(diff(phid));

%subs(pd_dot,t,2);
% xd_dot = [pd_dot;phid_dot];
% K = 1*eye(4,4);
% 
% q_dot = J'*inv(J*J')*pd_dot
