
% cite 
path = 'C:\Users\lenovo\Desktop\cs484_hw1\binary_image_analysis\cs484_hw1_data\cs484_hw1_data';
% licencePlates = dir( strcat(path, '\license_plates\*.jpg' ));
% for i = 1 : length(licencePlates)
%     filename = strcat(path, '\license_plates\', licencePlates(i).name);
%     img = imread(filename);
%     out = licencePlateProcess(img);
%     figure; colormap('summer'); imshow( out );
%     
% end

surveillance1 = strcat(path, '\pets2000');
surveillance2 = strcat(path, '\pets2001');

surv1 = dir( strcat(path, surveillance1, '\*.jpg' ));
imgs1 = zeros(1,4);
for i = 1 : length(surv1)
    filename = strcat(path, surveillance1, surv1(i).name);
    imgs1(i) = imread(filename); 
end
out = surveillance_process(imgs1);

surv2 = dir( strcat(path, surveillance2, '\*.jpg' ));
imgs2 = zeros(1,4);
for i = 1 : length(surv2)
    filename = strcat(path, surveillance2, surv2(i).name);
    imgs2(i) = imread(filename);
end
out = surveillance_process(imgs2);