close all;

path = 'C:\Users\lenovo\Desktop\cs484_hw1\binary_image_analysis\cs484_hw1_data\cs484_hw1_data';

%%%%%%% Found this piece of code on http://matlab.wikia.com/wiki/FAQ#How_can_I_process_a_sequence_of_files.3F
if ~isdir(path)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', path);
  uiwait(warndlg(errorMessage));
  return;
end
%%%%%%%
 
licencePlates = dir( strcat(path, '\license_plates\*.jpg' ));
for i = 1 : length(licencePlates)
    filename = strcat(path, '\license_plates\', licencePlates(i).name);
    img = imread(filename);
    licencePlateProcess(img, i);
end
pause;

survFolder1 = strcat(path, '\pets2000\');
survFolder2 = strcat(path, '\pets2001\');
surveillance_process(survFolder1);
pause;
surveillance_process(survFolder2);
pause;

clear all;
clc;
