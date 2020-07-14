%%ƽ�����
function [NV,D,ST,LE] = Planefit(pData)
% �ռ�����ʾ
plot3(pData(:,1),pData(:,2),pData(:,3),'*-')
hold on
% �ռ�������ƽ��ֵ
MP=mean(pData,1);
% �ռ������뵽ԭ�㣬�ռ����������ȥƽ������
centeredP=bsxfun(@minus,pData,MP);
% �ռ������SVD�ֽ�
[~,~,V]=svd(centeredP);
% Э�����SVD�任�У���С����ֵ��Ӧ��������������ƽ��ķ���
NV = V(:,3)';
% aX+bY+cZ+d=0,��d
D = -dot(NV,MP);
% ƽ��ͼ�λ���
% xfit = min(pData(:,1)):10:max(pData(:,1));
% yfit = min(pData(:,2)):10:max(pData(:,2));
% [XFIT,YFIT]= meshgrid (xfit,yfit);
% ZFIT = -(D + NV(1) * XFIT + NV(2) * YFIT)/NV(3);
% mesh(XFIT,YFIT,ZFIT);
% ���㵽���ƽ��ľ���
n = size(pData,1);
SD = zeros(n,1);
for i =1:n
    SD(i) = Distance_P2A(pData(i,:),NV,MP);
end
%% ƽ��ֵ
mu = mean(SD);
sigma = std(SD);
%% ƽ���
ST = mu + 3*sigma;
%% �����
ME = sqrt(SD'*SD./n);
%% �����
LE = 3*ME;
end