%%��ȡ��̬��-λ������
function [pxyz]  = getxyz()
%%��ȡλ������
[filename, pathname] = uigetfile({'*.xls;*.xlsx';'*.txt'},...
    '���뼤�������λ������','MultiSelect','off');  %����·������
if isequal(filename,0)
    error('����δ���룬�����µ������ݣ�')
else
    disp(['User selected ', fullfile(pathname, filename)])
    [pxyz,TXT,RAW] = xlsread(strcat(pathname,filename),'ƫ�ǲ�������');%%����������
end
pxyz = str2double(TXT(2:end,3:end));
[m2,n2]=size(pxyz);
if (n2 ~= 3)
    error('�ؽڽ����ݴ��������µ������ݣ�')
end
if(m2<=10)
    error('�ؽڽ�-λ�����ݲ�ƥ�䣬�����µ������ݣ�')
end
end