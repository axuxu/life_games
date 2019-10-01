%longton's ant
clear all
s=200;  %棋盘大小
%当前棋盘状态
cells(1:s,1:s) = 1; %全为白色
imh=image(cat(3,cells,cells,cells));
set(imh ,'erasemode','none');
axis equal;
axis tight;
%蚂蚁位置
posx=80;
posy=100;
%头的朝向，从顶开始顺时针方向为1,2,3,4
direct=1;
for i=1:100000
        if(cells(posx,posy)==0)  %当前棋盘为黑格
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