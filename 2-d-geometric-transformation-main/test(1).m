clear all
clc
close all

choice_shape = menu('choose the type of polygon','triangle','rectangle');
if (choice_shape==1)
    n=3;
else
    n=4;
end

for i=1:n
        reply = input(sprintf('coordinates of point %d :',i),'s');
        num = sscanf(reply,'%g %g');
        x(i)=num(1);
        y(i)=num(2);
end
    
choice_option = menu('choose an option','Scaling with ratio along the x-axis and y-axis, respectively.','Reflection in the x-axis.','Reflection in the y-axis.','Reflection in the straight line y = x.',' Reflection in the straight line y = - x.','Rotation about the origin of the polygon by an angle Theta in the clockwise direction.','Translation of the polygon origin to a new point (x0 , y0).');
Transformation_matrix= eye(3);
switch(choice_option)
    case(1)
        [z] = translate_to_origin(x(1),y(1));
        Transformation_matrix=z*Transformation_matrix;
        
        reply = input(sprintf('enter a , b : '),'s');
        p= sscanf(reply,'%g %g');
        a=p(1);
        b=p(2);
        [z]=scaling(a,b);
        Transformation_matrix=z*Transformation_matrix; 
        
        [z]=translate_to_original(x(1),y(1));
        Transformation_matrix=z*Transformation_matrix;
    case(2)
        z= eye(3);
        z(2,2)=-1;
        Transformation_matrix=z*Transformation_matrix;
    case(3)
        z= eye(3);
        z(1,1)=-1;
        Transformation_matrix=z*Transformation_matrix;
    case(4)
        z=zeros(3);
        z(1,2)=1;
        z(2,1)=1;
        z(3,3)=1;
        Transformation_matrix=z*Transformation_matrix;
    case(5)
        z=zeros(3);
        z(1,2)=-1;
        z(2,1)=-1;
        z(3,3)=1;
        Transformation_matrix=z*Transformation_matrix;
    case(6)
        [z] = translate_to_origin(x(1),y(1));
        Transformation_matrix=z*Transformation_matrix;
        reply = input(sprintf('enter angle of rotation (in clockwise direction) : '),'s');
        theta= sscanf(reply,'%g');
        [z]=rotation(theta);
        Transformation_matrix=z*Transformation_matrix;
        [z]=translate_to_original(x(1),y(1));
        Transformation_matrix=z*Transformation_matrix;
    case(7)
        reply = input(sprintf('enter coordinates of the new origin  : '),'s');
        new= sscanf(reply,'%g %g');
        x_new=new(1);
        y_new=new(2);
        [z]=translation(x(1),y(1),x_new,y_new);
        Transformation_matrix=z*Transformation_matrix;
        
end
Transformation_matrix
final=[x;y;ones(1,n)];
new_coordinates= Transformation_matrix*final;
new_x= new_coordinates(1,:);
new_y=new_coordinates(2,:);
m=[x x(1)];
o=[y y(1)];
new_x=[new_x new_x(1)];
new_y=[new_y new_y(1)];
plot(m,o);
hold on
plot(new_x,new_y);
axis([-max(new_x) max(new_x) -max(new_y) max(new_y)]);
disp('New coordinates: ');
for i=1:n
    fprintf('(%d,%d)',new_x(i),new_y(i));       
end
fprintf('\n');




