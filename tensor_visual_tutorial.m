%% Tensor Plot Examples
% In this document, we show a few examples to demonstrate how to use these tensor plot functions.
%% Plot Tensor

% (figure 1) Given a tensor, and visualize the tensor in 3-d dimension and the value of
% each cell is used to represent the deepness of the color in the
% visualization.

mytensor = rand(4,4,4); % A 4*4*4 tensor
edges = [4,4,4]; % Set the edge size of your plot
origin = [0, 0, 0]; % Set the origin of the tensor plot 
alpha = 0.8; % Set the transparency of the tensor plot
mycolor_map = 'jet'; % Set the color map you want to use 
tensor_plot(edges, origin, alpha, mytensor, mycolor_map);
title('Figure 1', 'FontSize', 24);

% (figure 2) Fill a small tensor inside a large tensor
edges = [10,10,10];
tensor_plot(edges, origin, alpha, mytensor, mycolor_map);
title('Figure 2','FontSize', 24)

% (figure 3) Plot a tensor by arbitrary block
block = 1;
block_size = cell(3,1);
block_size{1,1} = [2,4];
block_size{2,1} = [2,4];
block_size{3,1} = [2,4];
tensor_plot(edges, origin, alpha, mytensor, mycolor_map, block, block_size);
title('Figure 3','FontSize', 24)


% (figure 4) Plot tensor by slices
block_size{1,1} = [4];
block_size{2,1} = [1:4];
block_size{3,1} = [4];
tensor_plot(edges, origin, alpha, mytensor, mycolor_map, block, block_size);
title('Figure 4','FontSize', 24)

%% Tensor Bubble plot

% (figure 5) Given a tensor, draw the tensor version bubble plot.
markeralpha = 0.8; % Set the transparency level of the marker
linealpha = 0.6; % Set the transparency level of line
tensor_bubble_plot(mytensor, markeralpha, linealpha);
title('Figure 5','FontSize', 24)


%% Plot matrix in 3-D

% One common tensor operation is the matricization. So in some cases we 
% want to visualize the matrix in 3-D, and put it together with tensor plot.
% (figure 6) Plot a matrix in 3-D along with the original matrix in 2-D
mymatrix = rand(3,2);
mycolor_map = 'gray';
matrix_plot(mymatrix, mycolor_map);
title('Figure 6','FontSize', 24)

% (figure 7) Plot a matrix in 3-D alone.
matrix_plot(mymatrix, mycolor_map);
title('Figure 7','FontSize', 24)

