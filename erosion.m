% Question 1
% This function takes a binary image erodes it with the specified
% structured element, then returns the result as the output

function output_image = erosion(input_image, structuring_element)
    [x_in,y_in] = size(input_image);
    [x_str,y_str] = size(structuring_element.Neighborhood);
    strel_or_x = ceil(x_str/2);
    strel_or_y = ceil(y_str/2);
    
    % zero-pad the input image
    pad_amount_x = x_str - strel_or_x;
    
    pad_amount_y = y_str - strel_or_y;
    padded_input_image = zeros( [ (x_in + 2*pad_amount_x)  (y_in + 2*pad_amount_y) ] );
    
    for i = 1:x_in
        for j = 1:y_in
            padded_input_image(pad_amount_x+i,pad_amount_y+j) = input_image(i,j);
        end
    end
    
    output_image = input_image;
    
    
    % convolve the structuring element
    for i = 1:x_in                                                         % i is scanning the rows of the input image
        for j = 1:y_in                                                     % j is scanning the columns of the input image
            zero_found = false;                                             
            for k = i:i+x_str-1                                            % k is scanning the rows of the structuring element                           
                if zero_found                                               % One found 1 is enough to label the output image
                end
                for m = j:j+y_str-1                                        % m is scanning the columns of the structuring element
                    if structuring_element.Neighborhood(k-i+1,m-j+1) && ~padded_input_image(k,m)
                        output_image(i,j) = 0;
                        zero_found = true;
                        break;
                    end
                end
            end
        end
    end
end

