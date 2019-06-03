function tensor_decomposition(varargin)

% Default input arguments
inArgs = { ...
  [4 4 4] , ... % Default edge sizes (x,y and z)
  [0 0  0] , ... % Default coordinates of the origin point of the tensor
  .7          , ... % Default alpha value for the tensor's faces
  rand(4,4,4) ,       ... % Default Color for the tensor
  randn(4,4)           , ... % Default U1
  randn(4,4)   , ... % Default U2
  randn(4,4)% Default U3
  };
inArgs(1:nargin) = varargin;

[edges, origin, alpha, clr, U1, U2, U3] = deal(inArgs{:});
[m1 m2 m3] = size(clr);
clr = abs(clr(:))/max(abs(clr(:)));
U1 = abs(U1)/max(abs(U1(:)));
U2 = abs(U2)/max(abs(U2(:)));
U3 = abs(U3)/max(abs(U3(:)));
[d1 r1] = size(U1);
[d2 r2] = size(U2);
[d3 r3] = size(U3);
figure;
for i= 0:(m1-1)  %body measurements
    for j=0:(m2-1)
        for k=0:(m3-1)     
            plotcube([1 1 1], [(i+origin(1)), (j+origin(2)), (k+origin(3))], alpha, [1-clr(i+1 + j*m1+ k*m1*m2), 1- clr(i+1 + j*m1+ k*m1*m2), 1-clr(i+1 + j*m1+ k*m1*m2)]);
        end
    end
end
hold on;
for k = 0:(d1-1)
    for j = 0:(r1-1)
        plotcube([0.001,1,1], [origin(1), j + origin(2), origin(3)-2-k], alpha, [1, 1- U1(k+1,j+1), 1- U1(k+1,j+1)]);
    end
end
hold on;
for i = 0:(d2-1)
    for k = 0:(r2-1)
        plotcube([1,0.001,1], [origin(1)+ m1 + 1 + i, origin(2), origin(3)+k], alpha, [1-U2(i+1, k+1), 1 ,1-U2(i+1, k+1)]);
    end
end
hold on;
for j = 0:(d3 - 1)
    for i = 0:(r3 -1)
        plotcube([1,1,0.001], [origin(1)+i, (origin(2) + m2 +1 +j), origin(3) + m3], alpha, [1-U3(j+1, i+1),1-U3(j+1, i+1),1 ]);
    end
end
end

 