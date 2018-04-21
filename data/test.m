   %% Time specifications:
   Fs = 4656/30;                      % samples per second
   dt = 1/Fs;                     % seconds per sample
   StopTime = 30;                  % seconds
   t = (0:dt:StopTime-dt)';
   N = size(t,1);

   %% Sine wave:
   Fc = 10;                       % hertz
   x = cos(2*pi*Fc*t);
   subplot(2,1,1);
   plot(t, x);
   xlabel('Time (in seconds)');
   title('Time Domain');

   %% Fourier Transform:
   X = fftshift(fft(x));

   %% Frequency specifications:
   dF = Fs/N;                      % hertz
   f = -Fs/2:dF:Fs/2-dF;           % hertz
   length(f)

   %% Plot the spectrum:
   subplot(2,1,2);
   plot(f,abs(X)/N);
   xlabel('Frequency (in hertz)');
   title('Frequency Response');