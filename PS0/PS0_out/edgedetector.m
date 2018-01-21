% This function calls the functions below and displays their results.
% You don't need to edit it.
function edgedetector()
    img = double(rgb2gray(imread('buoys.jpg')));

%     edges = DetectVerticalEdges(img);
%     blurred_edges = BoxBlur(edges);
    blurred_edges=BoxBlur(img);
    edges=DetectVerticalEdges(blurred_edges);
    
    figure('Name','Original Image')
    imshow(img, []);
    
    figure('Name','Edges')
    imshow(edges, []);
    
    figure('Name','Blurred Edges')
    imshow(blurred_edges, []);
end


% Returns a matrix containing the horizontal component of the gradient at every
% image location.
function edges = DetectVerticalEdges(img)
    % MATLAB images use matrix indices, so the order is (y,x), and the +y
    % direction is downward.
    width = size(img, 2);
    height = size(img, 1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%% Your part (a) code here. You can accomplish part (a) with
    %%%%%%%%%% nested "for" loops, but an easier way is to use matrix 
    %%%%%%%%%% indexing to make a matrix of the "left" pixels and a matrix 
    %%%%%%%%%% of the "right" pixels, and subtract the two matrices.
    %%%%%%%%%% REMEMBER: left/right position is the SECOND index in MATLAB.
    pixels_right=img(:,2:width);
    pixels_left=img(:,1:width-1);
    edges_vertical=pixels_right-pixels_left;
%     figure
%     imshow(edges_vertical);

    pixels_down=img(2:height,:);
    pixels_up=img(1:height-1,:);
    edges_horizontal=pixels_down-pixels_up;
%     figure
%     imshow(edges_horizontal);

    edges=sqrt(double(edges_vertical(1:height-1,1:width-1).^2+edges_horizontal(1:height-1,1:width-1).^2));
%     figure
%     imshow(uint8(edges));
    
    %%%%%%%%%% End of your part (a) code.
end

% Applies a box blur to the input image and returns the result.
function blurred = BoxBlur(img)
    img = double(img);

    height = size(img, 1);
    width = size(img, 2);
    n=5; % width of the blur
    blurred = zeros(height-(n-1),width-(n-1));
    % Loop through each pixel location in the result
    for y=1:height-(n-1)
        for x=1:width-(n-1)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%%%%%% Your part (b) code here. Calculate blurred(y,x).
            blurred(y,x)=sum(sum(img(y:y+n-1,x:x+n-1)));
            %%%%%%% End of part (b) code
        end
    end
    
    % Usually we'll divide at the end so that we don't make the image
    % brighter:
    blurred = blurred / n^2;    
end
