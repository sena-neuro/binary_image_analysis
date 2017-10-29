% licence plates

function output = licencePlateProcess(image)

% threshold
red = image( :, :, 1 );    % first (red) band
green = image( :, :, 2 );  % second (green) band
blue = image( :, :, 3 );   % third (blue) band

thresh_im = ( red < 70) & (green < 70) & (blue < 70);
% figure; imshow( thresh_im );

str_elt = strel('disk', 5, 4);
eroded = erosion(thresh_im, str_elt);
str_elt = strel('disk', 5, 4);
opened = dilation(eroded, str_elt);

% connected components analysis
cc = bwconncomp(opened);
output = label2rgb(labelmatrix(cc));








