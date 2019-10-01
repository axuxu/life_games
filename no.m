s=100;      % 棋盘宽，棋盘是方的，即每行每列可以有100个元包自动机
w=8;        % 每一个元包的像素宽度
board=zeros(w*s,s*w);   %棋盘图片
state=zeros(s,s);       %元包自动机的状态
newState=zeros(s,s);

%%  初始化
for i=1:s
    for j=1:s
        if rand<0.4         %   随机在棋盘上以0.4的生存概率设置自动机状态
            state(i,j)=1;   %   其实分的随机设置状态会导致非常离散的点，最后收敛时棋盘上剩下些孤立的点
        end
    end
end
figure;
%%  更新状态
for k=1:1000
    tmp=cputime;
    for i=1:s
        for j=1:s
            %   计算邻居着活着的个数
            cnt=0;
            if i-1>0&&j-1>0
                cnt=cnt+state(i-1,j-1);
            end
            if i-1>0&&j+1<=s
                cnt=cnt+state(i-1,j+1);
            end
            if i+1<=s&&j+1<=s
                cnt=cnt+state(i+1,j+1);
            end
            if i+1<=s&&j-1>0
                cnt=cnt+state(i+1,j-1);
            end
            if j-1>0
                cnt=cnt+state(i,j-1);
            end
            if j+1<=s
                cnt=cnt+state(i,j+1);
            end
            if i-1>0
                cnt=cnt+state(i-1,j);
            end
            if i+1<=s
                cnt=cnt+state(i+1,j);
            end

            %   更新状态、着色
            newState(i,j)=state(i,j);
            if state(i,j)==0
                if cnt==3
                    newState(i,j)=1;
                end
            elseif state(i,j)==1
                if cnt<2||cnt>3
                    newState(i,j)=0;
                end
            end

            if newState(i,j)==0
                board(((i-1)*w+1):i*w,((j-1)*w+1):j*w)=0;
            else
                board(((i-1)*w+1):i*w,((j-1)*w+1):j*w)=255;
            end
        end
    end
    t=cputime-tmp;
    state=newState;
    imshow(board);
    pause(0.3);

end