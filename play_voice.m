%������Ƶ����
function yyy = play_voice(varargin)
    filename='sheep_voice2.wav';  %��ȡ      
    [y,fs] = audioread(filename);  %�����
    player = audioplayer(y, fs);  
    play(player);   %����
    pause(1);  %��ʱ
end