function myRecording = recordMicData(filename,duration,Fs,nbits,channel)
% A function to record data from PC MIC
% input >> filename,duration,Fs,nbits,channel
% calling format
% recordMicData(filename);
% recordMicData(filename,duration);
% recordMicData(filename,duration,Fs,nbits,channel);
error(nargchk(1, 5, nargin, 'struct'));
if nargin == 1      % default values of input arguments
    Fs = 8000;
    nbits = 8;
    channel = 1;
    duration = 5;
elseif nargin == 2
    Fs = 8000;
    nbits = 8;
    channel = 1;
end

recObj = audiorecorder(Fs, nbits, channel);     % creating audio object
% Record your voice for  seconds.
disp('Start speaking.')
recordblocking(recObj, duration);       
disp('End of Recording.');
% Store data in double-precision array.
myRecording = getaudiodata(recObj);
wavwrite(myRecording,filename);     % write as a 'filename.wav' file

end
