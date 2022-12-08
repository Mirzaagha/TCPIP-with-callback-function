clear all 
close all
clc
address = '127.0.0.1';
port = 50907;
server = tcpserver(address,port);

configureCallback(server,"byte",4,@readFcnSizeCallBackFunction);

sendata.orientx = deg2rad(45);
sendata.state = "walk";
sendata;
jsendata = jsonencode(sendata)
len = length(jsendata);
waitfor(server,"Connected",1)
disp("going into while")

% write(server,len,"int32");
% write(server,jsendata);

% configureCallback(server,"byte",4,@readFcnSizeCallBackFunction);

waitfor(server,"Connected",0)
disp('The end');
configureCallback(server,"off");
clear server

% % % % % c = fieldnames(a)
% % % % % cell2mat(c)

% disp('Pause starts');
% pause(0.04);
% disp('Pause ended');

% data = read(server,server.NumBytesAvailable,'char')
% jdata = jsondecode(data);

