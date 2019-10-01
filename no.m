s=100;      % ���̿������Ƿ��ģ���ÿ��ÿ�п�����100��Ԫ���Զ���
w=8;        % ÿһ��Ԫ�������ؿ��
board=zeros(w*s,s*w);   %����ͼƬ
state=zeros(s,s);       %Ԫ���Զ�����״̬
newState=zeros(s,s);

%%  ��ʼ��
for i=1:s
    for j=1:s
        if rand<0.4         %   �������������0.4��������������Զ���״̬
            state(i,j)=1;   %   ��ʵ�ֵ��������״̬�ᵼ�·ǳ���ɢ�ĵ㣬�������ʱ������ʣ��Щ�����ĵ�
        end
    end
end
figure;
%%  ����״̬
for k=1:1000
    tmp=cputime;
    for i=1:s
        for j=1:s
            %   �����ھ��Ż��ŵĸ���
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

            %   ����״̬����ɫ
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