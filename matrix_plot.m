function matrix_plot(matrix, color_map)
%%%%%%%%%%%%%%%%%%%%
% Authors: Yuetian Luo (yluo86@wisc.edu), Anru Zhang (anruzhang@stat.wisc.edu)
% University of Wisconsin-Madison
%%%%%%%%%%%%%%%%%%%%
% Plot a matrix in 3-d dimension
% MATRIX: defines the matrix input, and the scalar value in the matrix
% represent the color depth in the "jet" colormap
% COLOR_MAP: A input of the color map you want to visualize your plot. For
% different color maps, you can see
% "https://www.mathworks.com/help/matlab/ref/colormap.html". Also you can
% use 'green', 'blue', 'red' colormap.
    [nrow, ncol] = size(matrix);
    if strcmp(color_map, 'green')
        matrix = 1-abs(matrix)/(max(abs(matrix(:))));
        mymap = [0,1,0;
            0.1,1,0.1;
           0.2,1,0.2;
           0.3,1,0.3;
           0.4,1,0.4;
           0.5,1,0.5;
           0.6,1,0.6;
           0.7,1,0.7;
           0.8,1,0.8;
           0.9,1,0.9
           1,1,1];
        imagesc(matrix);
        colormap(mymap);
    end
    if strcmp(color_map, 'blue')
        matrix = 1-abs(matrix)/(max(abs(matrix(:))));
        mymap = [0,0,1;
            0.1,0.1,1;
           0.2,0.2,1;
           0.3,0.3,1;
           0.4,0.4,1;
           0.5,0.5,1;
           0.6,0.6,1;
           0.7,0.7,1;
           0.8,0.8,1;
           0.9,0.9,1;
           1,1,1];
        imagesc(matrix);
        colormap(mymap);
    end
    if strcmp(color_map, 'red')
        matrix = 1-abs(matrix)/(max(abs(matrix(:))));
        mymap = [1,0,0;
            1,0.1,0.1;
           1,0.2,0.2;
           1,0.3,0.3;
           1,0.4,0.4;
           1,0.5,0.5;
           1,0.6,0.6;
           1,0.7,0.7;
           1,0.8,0.8;
           1,0.9,0.9;
           1,1,1];
        imagesc(matrix);
        colormap(mymap);
    end
    if ~strcmp(color_map, 'green') & ~strcmp(color_map,'blue') & ~strcmp(color_map,'red')
        matrix = 1-abs(matrix)/(max(abs(matrix(:))));
        imagesc(matrix);
        colormap(color_map);
    end
    axis off;
    hold on;
    for i = 1:(nrow+1)
        plot([0.5, ncol + 0.5], [i-0.5, i-0.5], 'k-');
    end
    hold on;
    for j = 1:(ncol+1)
        plot([j-0.5,j-0.5], [0.5, nrow + 0.5], 'k-');
    end
end