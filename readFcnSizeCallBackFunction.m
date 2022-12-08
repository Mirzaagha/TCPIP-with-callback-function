function readFcnSizeCallBackFunction(src,~)
powerOfBytes = [power(256,0),power(256,1),power(256,2),power(256,3)];
message = read(src,4);
disp('⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇');
s = sum(message.*powerOfBytes);
% disp(message);
% disp(s);
data = read(src,s,'char');
decodeddata = jsondecode(data);
whos decodeddata
disp(decodeddata);

% caption = sprintf('lhip_pitch = %f,\n lhip_roll = %f', decodeddata.lhip_pitch, decodeddata.lhip_roll);
% axis off;
% title(caption, 'FontSize', 10);

% newValue = str2double(decodeddata{2}) + 1;
% disp(newValue);
% decodeddata{2} = string(newValue);
% encodeddata = jsonencode(decodeddata);

encodeddata = jsonencode(decodeddata);


% disp(data);
% disp(decodeddata);
% disp(encodeddata);
disp('⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆');
len = length(encodeddata);
write(src,len,"int32");
write(src,encodeddata);
end