

clc
clear all
close all

fprintf('Press 1 for zyz orientation.\nPress 2 for zyx orientation.');
orient=input(' ','s');
if xor(strcmp(orient,'1'),strcmp(orient,'2')) == 0
        fprintf('Invalid input. Press p for prismatic joint, Press r for revolute joint\n');
        %exit;
end
if orient=='1'
fprintf('Press 1 to calculate the zyz rotation matrix.\nPress 2 to calculate zyz euler angles from rotation matrix');
c=input(' ','s');
if xor(strcmp(c,'1'),strcmp(c,'2')) == 0
        fprintf('Invalid input.');
        %exit;
end
if c=='1'
   z = input('Enter the z angle');
   y = input('Enter the y angle');
   z1 = input('Enter the z1 angle');
   zyz = [cos(z)*cos(y)*cos(z1)-sin(z)*sin(z1) -cos(z)*cos(y)*cos(z1) cos(z)*sin(y); sin(z)*cos(y)*cos(z1)-cos(z)*sin(z1) -sin(z)*cos(y)*sin(z)+cos(z)*cos(z1) sin(z)*sin(z1); -sin(y)*cos(z1) sin(y)*sin(z1) cos(z)]
R = zyz;
    
end

if c=='2'
zyz = input('Enter the zyz matrix');
z = atan2(zyz(2,3),zyz(1,3))
y = atan2((sqrt(zyz(1,3)^2+zyz(2,3)^2)),zyz(3,3))
z1 = atan2(zyz(3,2),-zyz(3,1))
R = zyz;


end
end

if orient=='2'
fprintf('Press 1 to calculate the zyx rotation matrix.\nPress 2 to calculate zyx euler angles from rotation matrix');
c=input(' ','s');
if xor(strcmp(c,'1'),strcmp(c,'2')) == 0
        fprintf('Invalid input.');
        %exit;
end

if c=='1'
z = input('Enter the z angle');
y = input('Enter the y angle');
x = input('Enter the x angle');

zyx = [cos(z)*cos(y) cos(z)*sin(y)*sin(x)-sin(z)*cos(x) cos(z)*sin(y)*cos(x)+sin(z)*sin(x); sin(x)*cos(y) sin(z)*sin(y)*sin(x)+cos(z)*cos(x) sin(z)*sin(y)*cos(x)-cos(z)*sin(x); -sin(y) cos(y)*sin(x) cos(y)*cos(x)]
R = zyx;
    
end

if c=='2'

zyx = input('Enter the zyx matrix')
z = atan2(zyx(2,1),zyx(1,1));
y = atan2(-zyx(3,1),sqrt(zyx(3,2)^2+zyx(3,3)^2));
x = atan2(zyx(3,2),zyx(3,3));
R = zyx;

end
end

hold on
p = [0 0 0]';
axis_start = p;
figure(1)
for i=1:3    
    axis_end(:,i) = axis_start + R(:,i);
end
plot3(p(1), p(2), p(3), 'o');
grid on
hold on
for i = 1:3    
    h=plot3([axis_start(1) axis_end(1,i)],...        
        [axis_start(2) axis_end(2,i)],...        
        [axis_start(3) axis_end(3,i)]);    
    if i==1        
        h.Color='red';    
    elseif i==2        
        h.Color='green';    
    else
        h.Color='blue';    
    end
end
