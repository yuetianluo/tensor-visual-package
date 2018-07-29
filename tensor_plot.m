function tensor_plot(varargin)
%%%%%%%%%%%%%%%%%%%%
% Authors: Yuetian Luo (yluo86@wisc.edu), Anru Zhang (anruzhang@stat.wisc.edu)
% University of Wisconsin-Madison
%%%%%%%%%%%%%%%%%%%%
% EDGES: 3-element (a,b,c) vector that defines the edges of your plot
% space.
% ORIGIN: 3-element vector that defines the origin of the tensor
% ALPHA: scalar that defines the transparency of the cube faces
% COLOR: a a*b*c tensor, and its value represent the deepness of the color
% of tensor in the visualization.
% BLOCK: 0 or 1, indicate whether you want to plot block tensor. If block =
% 1, then you need to specify how you want to cut the tensor in "block_size"
% BLOCK_SIZE: specify your way to cutting the tensor when "block = 1". It
% is a list with three component, and each component is vector, including
% the index you want to cut the tensor after that index. And by default, we
% always add the last index.
% For example, if tensor's mode 1 dimension is 10, and you want
% to cut tensor after the fifth cell, so the
% input vector for that mode, should be [5, 10]. If you want to cut the
% tensor in that mode into slices, then the vector should be [1:10];

% Default input arguments
inArgs = { ...
  [4 4 4] , ... % Default edge sizes (x,y and z)
  [0 0  0] , ... % Default coordinates of the origin point of the tensor
  .7          , ... % Default alpha value for the tensor's faces
  rand(4,4,4) ,       ... % Default Color for the tensor
  jet         , ... % Default Color map
  0           , ... % Default block = 0
  cell(3,1)   , ... % Default we don't set block size
  };
inArgs(1:nargin) = varargin;

[edges, origin, alpha, clr, color_map , block, block_size] = deal(inArgs{:});
[m1 m2 m3] = size(clr);
clr = clr(:);
figure;
if block == 0
    plotcube(edges, [0 0 0], 0, [0 0 0]);
    for i= 0:(m1-1)  %body measurements
        for j=0:(m2-1)
            for k=0:(m3-1)  
                colormap(color_map);       
                plotcube([1 1 1], [i, j, k], 0.8, clr(i*m1+ j*m2+ k+1));
            end
        end
    end
else  
    length1 = length(block_size{1,1}) - 1;
    length2 = length(block_size{2,1}) - 1;
    length3 = length(block_size{3,1}) - 1;
    m1 = m1 + length1;
    m2 = m2 + length2;
    m3 = m3 + length3;
    colormap(color_map); 
    for i = 0:(m1-1)
        for j = 0:(m2-1)
            for k = 0:(m3-1)
                    if length1 == 0
                        break_point1 = [];
                    else
                        break_point1 = block_size{1,1}(1:(length1));
                        break_point1 = break_point1 + (0:(length(break_point1)-1));
                    end
                    if length2 == 0
                        break_point2 = [];
                    else
                        break_point2 = block_size{2,1}(1:(length2));
                        break_point2 = break_point2 + (0:(length(break_point2)-1));
                    end
                    if length3 == 0
                        break_point3 = [];
                    else
                        break_point3 = block_size{3,1}(1:(length3));
                        break_point3 = break_point3 + (0:(length(break_point3)-1));
                    end
                    if sum(i == break_point1) > 0 | sum(j == break_point2) > 0 | sum(k == break_point3) > 0
                        continue
                    else 
                        plotcube([1 1 1], [i, j, k], 0.8, clr(i*m1+ j*m2+ k+1));
                    end
            end
        end
    end
    axis off;
end

end
