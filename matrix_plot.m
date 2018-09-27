function matrix_plot(matrix, d2, d3, color_map)
%%%%%%%%%%%%%%%%%%%%
% Authors: Yuetian Luo (yluo86@wisc.edu), Anru Zhang (anruzhang@stat.wisc.edu)
% University of Wisconsin-Madison
%%%%%%%%%%%%%%%%%%%%
% Plot a matrix in 3-d dimension
% MATRIX: defines the matrix input, and the scalar value in the matrix
% represent the color depth in the "jet" colormap
% d2: a scalar value 0 or 1. 1 means plot the 2-d matrix, 0 means don't
% plot the 2-d matrix
% d3: a scalar value 0 or 1. 1 means plot the 3-d matrix, 0 means don't
% plot the 3-d matrix.
% COLOR_MAP: A input of the color map you want to visualize your plot. For
% different color maps, you can see
% "https://www.mathworks.com/help/matlab/ref/colormap.html"
    [nrow, ncol] = size(matrix);
    col_add = zeros(nrow, 1);
    matrix = [matrix, col_add];
    [nrow, ncol] = size(matrix);
    row_add = zeros(1, ncol);
    matrix = vertcat(matrix, row_add);
    if (d2 == 1 & d3 ==1)
    figure;
    subplot(1,2,1);
    pcolor(matrix);
    colormap(color_map);
    subplot(1,2,2);
    pcolor(matrix);
    view(3)
    axis off 
    elseif (d2 == 0 & d3 ==1)
        figure(1);
        pcolor(matrix);
        colormap(color_map)
        view(3)
        axis off 
    elseif (d2 == 1 & d3 ==0)
        figure(1);
        pcolor(matrix);
        colormap(color_map);
    end
end