% Define the desired length in milliseconds
desired_length_ms = 3000;

% Convert the desired length from milliseconds to samples
desired_length = desired_length_ms * fs / 1000;

% Get the list of all files in the input folder
input_folder = "D:\speech_normalised";
file_list = dir(fullfile(input_folder,'*.wav'));

% Create the output folder if it doesn't exist
output_folder = "C:\Users\ancyr\OneDrive\Desktop\Padded speech samples";
if ~exist(output_folder,'dir')
    mkdir(output_folder);
end

% Loop through all files in the input folder
for i = 1:length(file_list)
    % Load the speech sample
    [y,fs] = audioread(fullfile(input_folder,file_list(i).name));
    
    % Calculate the difference between the length of the speech sample and the desired length
    diff = desired_length - length(y);
    
    % If the difference is positive, perform zero padding
    if diff > 0
        y = [y;zeros(diff,1)];
    end
    
    % If the difference is negative, truncate the speech sample
    if diff < 0
        y = y(1:desired_length);
    end
    
    % Save the padded speech sample in the output folder
    audiowrite(fullfile(output_folder,file_list(i).name),y,fs);
end
