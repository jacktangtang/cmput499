function [classification] = classify(tree, instance)
% classify   Classifies a single data instance by given tree
% Inputs:
%       tree            - the decision tree
%       instance        - the one example you wish to classify
% Outputs:
%       classification     - class assigned by tree, '0' or '1'
% Case 1: You are at a leaf. 
if tree.isleaf
    classification = tree.class;
    
else  % root
    if (instance(tree.attribute_id))
        children = tree.children{1};
        classification = classify(children,instance);
    else
        children = tree.children{2};
        classification = classify(children,instance);
    end    
end 
return

end