function [I]=translation(x1,y1,x2,y2)
    X=x2-x1;
    Y=y2-y1;
    I=eye(3);
    I(1:2,3)=[X Y];
end