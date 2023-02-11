
% Define the folder where the speech signals are stored
folder = "C:\Users\ancyr\OneDrive\Desktop\Padded speech samples";

% Get a list of all files in the folder
files = dir(fullfile(folder, '*.wav'));

% Loop through each file
for i = 1:length(files)
    % Get the full file name
    full_filename = fullfile(folder, files(i).name);

    % Read the speech signal
    [signal, fs] = audioread(full_filename);

    % Compute the Mel-frequency cepstral coefficients (MFCCs)
    mfccs = mfcc(signal,fs,'NumCoeffs',12);
    mfccs=mfccs(1,13);

    % Compute the linear predictive coding (LPC) coefficients
    lpc_coeffs = lpc(signal,12);
    % Save the MFCCs and LPC coefficients to disk
    save(full_filename + '_mfccs.mat', 'mfccs');
    save(full_filename + '_lpc.mat', 'lpc_coeffs');
  
end
