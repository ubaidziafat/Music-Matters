% Music Matters 

% File 1

% Begin program

% Define constants
FS = 48000;  %sampling frequency

% Generate sine wave
A = 0.5;           %amplitude
f = 440;           %frequency
ph = 0;            %phase
t = 0 : 1/FS : 3;  %time vector

x = A*sin(2*pi*f*t + ph);  %sine wave

% Variable Pitch Sine Wave
f1 = 110;
f2 = 880;

y = A*sin(2*pi*(f1+(f2-f1)*t).*t + ph);

% Generate a Note
n = 3;     %number of notes
t = 0 : 1/FS : 2.5;
A = 0.5;

f = 440;  %frequency

for i = 1 : n
    x1(i,:) = A*sin(2*pi*f*t + i*2*pi/n);
end

x2 = sum(x1); 

% Generate Chord
m = 3; %number of chords
A = 0.5;

f1 = [440; 600; 840];

for i = 1 : m
    y1(i,:) = A*sin(2*pi*f1(i)*t + i*2*pi/m);
end

y2 = sum(y1);

% Generate and Save Audio
% Generate Audio 
fs = 48000;   %sampling frequency
t = 0 : 1/FS : 2;  %time vector

% Generate Note
f = 440;  %frequency
A = 0.5;  %amplitude

z = A*sin(2*pi*f*t);

% Make array of Note
z = repmat(z,3,1);

% Add Note together
z2 = sum(z);

% Normalize Signal
z2 = z2/max(abs(z2));

% Generate Chords
f1 = [440; 600; 800];  %frequencies
A1 = 0.5;  %amplitude

w = A1*sin(2*pi*f1*t);

% Make array of Chords
w = repmat(w,3,1);

% Add Chords together
w2 = sum(w);

% Normalize Signal
w2 = w2/max(abs(w2));

% Save Audio
audiowrite('MusicNotes.wav',z2,fs);
audiowrite('MusicChords.wav',w2,fs);

% Plot Waveforms
subplot(2,1,1)
plot(t,z2)
subplot(2,1,2)
plot(t,w2)

% End Program