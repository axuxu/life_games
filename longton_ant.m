%longton's ant
clear all
s=200;  %���̴�С
%��ǰ����״̬
cells(1:s,1:s) = 1; %ȫΪ��ɫ
imh=image(cat(3,cells,cells,cells));
set(imh ,'erasemode','none');
axis equal;
axis tight;
%����λ��
posx=80;
posy=100;
%ͷ�ĳ��򣬴Ӷ���ʼ˳ʱ�뷽��Ϊ1,2,3,4
direct=1;
for i=1:100000
        if(cells(posx,posy)==0)  %��ǰ����Ϊ�ڸ�
            if(direct==1)
                 cells(posx,posy)=1;
                 posy=posy+1;
                 posx=posx;
                 direct=2;  
    elseif(direct==2)
        cells(posx,posy)=1;
        posy=posy;
        posx=posx+1;
        direct=3;
  
    elseif(direct==3)
        cells(posx,posy)=1;
        posy=posy-1;
        posx=posx;
        direct=4;
          
    elseif(direct==4)
        cells(posx,posy)=1;
        posy=posy;
        posx=posx-1;
        direct=1;
    end
elseif(cells(posx,posy)==1)
    if(direct==1)
        cells(posx,posy)=0;
        posy=posy-1;
        posx=posx;
        direct=4;
elseif(direct==2)
        cells(posx,posy)=0;
        posy=posy;
        posx=posx-1;
        direct=1;
   elseif(direct==3)
        cells(posx,posy)=0;
        posy=posy+1;
        posx=posx;
        direct=2;
       elseif(direct==4)
        cells(posx,posy)=0;
        posy=posy;
        posx=posx+1;
        direct=3;
    end
end
imh=image(cat(3,cells,cells,cells));
set(imh ,'erasemode','none');
drawnow

end