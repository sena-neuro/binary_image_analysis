function surveillance_process(path)

    imgFiles = dir( strcat(path, '*.jpg' ));
    background = imread(strcat(path, imgFiles(1).name) );
    gray_bg = rgb2gray(background);
    for j = 2 : size(imgFiles)
        img = imread( strcat(path, imgFiles(j).name) );
        gray = rgb2gray(img);
        
        % substract the background image
        diff_1 = gray - gray_bg;
        diff_2 = gray_bg - gray;
        diff_sum = diff_1 + diff_2;
        
        % threshold
        thresholded = (diff_sum > 40);    
        figure(j-1); subplot(2,2,1);  imshow( thresholded );
        title('thresholded');
        
        str_elt_er = strel('disk', 4);
        eroded = erosion(thresholded, str_elt_er);
        figure(j-1); subplot(2,2,2);  imshow( eroded );
        title('eroded');
        
        str_elt_dil = strel('disk', 6);
        for i = 1 : 6
            opened = dilation(eroded, str_elt_dil);
            eroded = thresholded & opened;
        end
        figure(j-1); subplot(2,2,3);  imshow( eroded );
        title('conditionally dilated');
        
        % connected components analysis
        cc = bwconncomp(eroded);
        labeled = label2rgb(labelmatrix(cc));
        figure(j-1); subplot(2,2,4);  imshow( labeled );
        title('labeled');
    end
end
