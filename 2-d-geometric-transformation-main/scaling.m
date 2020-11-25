%scaling matrix
function [I]=scaling(alpha,beta)
    I=eye(3);
    I(1,1)=alpha;
    I(2,2)=beta;
end
