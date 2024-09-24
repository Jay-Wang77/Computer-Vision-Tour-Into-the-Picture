function [surfaces,test] =TITP(img,vanishing_point,box)
%box: [min_y,max_y,min_x,max_x]
%pic_num: pixel quantities of f
pic_num=ceil(max(size(img(:,:)))/5);

estimatedVertex=get12vertex(img,vanishing_point,box);

recVertex = reconstruction_12Vertex(vanishing_point,estimatedVertex);
recVertex(3,:) = recVertex(3,:)*pic_num;

[surfaces,test] = output(estimatedVertex,recVertex,img);

end