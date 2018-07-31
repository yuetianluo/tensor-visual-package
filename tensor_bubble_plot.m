function tensor_bubble_plot(tensor, markeralpha, linealpha)
%%%%%%%%%%%%%%%%%%%%
% Authors: Yuetian Luo (yluo86@wisc.edu), Anru Zhang (anruzhang@stat.wisc.edu)
% University of Wisconsin-Madison
%%%%%%%%%%%%%%%%%%%%
% TENSOR: a three dimensional array as the input. The plot will show you a
% tensor and the size of the ball represent the value of that tensor.
% MARKERALPHA: 0-1 value represents the transparency level of the marker
% LINEALPHA: 0-1 value represents the transparency level of the line
    [a,b,z] = size(tensor);
    vector_tensor = tensor(:);
    index_x =[];
    index_y = [];
    index_z = [];
    for i = 1:z
        v = repmat(1:b,[a, 1]);
        v = v(:)';
        index_x = [index_x, v];
        index_y = [index_y, repmat(1:b,[1,a])];
        index_z = [index_z, repmat(i, [1, a*b])];
    end
    figure;
    scatter3(index_x, index_y, index_z, abs(vector_tensor)*200,'filled', 'MarkerFaceAlpha', markeralpha);    
    hold on;
    for i = 1:a
        for j = 1:b
                plot_1 = plot3(repmat(i,[z, 1])', repmat(j, [z,1])', 1:z,'k--' ,'LineWidth', 2);
                plot_1.Color(4) = linealpha;        
        end
    end
    for j = 1:b
        for k = 1:z
                plot_2 = plot3(1:a,repmat(j,[a, 1])',  repmat(k, [a,1])', 'k--', 'LineWidth', 2);
                plot_2.Color(4) = linealpha;
        end
    end
    for i = 1:a
        for k = 1:z
                plot_3 = plot3(repmat(i,[b, 1])', 1:b, repmat(k, [b,1])', 'k--', 'LineWidth', 2);
                plot_3.Color(4) = linealpha;
        end
    end
   axis off;
    xlim([0 a+0.5]);
    ylim([0 b+0.5]);
    zlim([0 z+0.5]);    
end