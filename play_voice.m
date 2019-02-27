%播放音频函数
function yyy = play_voice(varargin)
    filename='sheep_voice2.wav';  %读取      
    [y,fs] = audioread(filename);  %存矩阵
    player = audioplayer(y, fs);  
    play(player);   %播放
    pause(1);  %延时
end