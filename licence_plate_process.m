% licence plates

function licence_plate_process(image, i)
  % threshold
  red = image( :, :, 1 );    % first (red) band
  green = image( :, :, 2 );  % second (green) band
  blue = image( :, :, 3 );   % third (blue) band

  thresh_im = ( red < 70) & (green < 70) & (blue < 70);
  figure(1); subplot(3,4,i);  imshow( thresh_im );


  str_elt = strel('disk', 5, 4);
  eroded = erosion(thresh_im, str_elt);
  figure(2); subplot(3,4,i);  imshow( eroded );

  str_elt = strel('disk', 5, 4);
  opened = dilation(eroded, str_elt);
  figure(3); subplot(3,4,i);  imshow( opened );


  % connected components analysis
  cc = bwconncomp(opened);
  labeled = label2rgb(labelmatrix(cc));
  figure(4); subplot(3,4,i); colormap('summer'); imshow( labeled );
end






