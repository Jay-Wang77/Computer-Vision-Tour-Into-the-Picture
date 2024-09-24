function estimatedVertex = get12vertex(img, vanishing_point, box)
%get 12 vertex coordinate

[m,n,p]=size(img);
x_max = n;
y_max = m;

min_y=box(1);max_y=box(2);
min_x=box(3);max_x=box(4);

x_vp=vanishing_point(2);
y_vp=vanishing_point(1);

y_sp=[max_y;max_y;min_y;min_y];
x_sp=[min_x;max_x;max_x;min_x];

x_sp = [x_sp ; x_sp(1)];
y_sp = [y_sp ; y_sp(1)];

for i =1:4
    gradient(i) = (y_sp(i)-y_vp)/(x_sp(i)-x_vp); % gradient of 1 2 7 8
end

estimatedVertex = zeros(2,12);
estimatedVertex(:,1) = [x_sp(1);y_sp(1)];
estimatedVertex(:,2) = [x_sp(2);y_sp(2)];
estimatedVertex(:,8) = [x_sp(3);y_sp(3)];
estimatedVertex(:,7) = [x_sp(4);y_sp(4)];

estimatedVertex(:,3) = [(y_max-y_vp)/gradient(1) + x_vp; y_max];
estimatedVertex(:,5) = [1; (1-x_vp)*gradient(1) + y_vp];
estimatedVertex(:,4) = [(y_max-y_vp)/gradient(2) + x_vp; y_max];
estimatedVertex(:,6) = [x_max; (x_max-x_vp)*gradient(2) + y_vp];
estimatedVertex(:,10) = [(1-y_vp)/gradient(3) + x_vp; 1];
estimatedVertex(:,12) = [x_max; (x_max-x_vp)*gradient(3) + y_vp];
estimatedVertex(:,9) = [(1-y_vp)/gradient(4) + x_vp; 1];
estimatedVertex(:,11) = [1; (1-x_vp)*gradient(4) + y_vp];

end