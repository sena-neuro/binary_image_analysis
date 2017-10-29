function surveillance_process(path)

    imgFiles = dir( strcat(path, '*.jpg' ));
    background = imread(strcat(path, imgFiles(1).name) );
    img1 = imread( strcat(path, imgFiles(2).name) );
    img2 = imread( strcat(path, imgFiles(3).name) );
	img3 = imread( strcat(path, imgFiles(4).name) );
    
    gray1 = rgb2gray(img1);
    gray2 = rgb2gray(img2);
    gray3 = rgb2gray(img3);
    
    % substract the background image
    diff1 = gray1 - background; 
    diff2 = gray2 - background; 
    diff3 = gray3 - background; 
    
    figure; imshow(diff1);
    figure; imshow(diff2);
    figure; imshow(diff3);

end
