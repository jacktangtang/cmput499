clear
clc
load planets
tree = learnDecisionTree(train_set, attribute, 0);
print_tree(tree)
classification = classify(tree, train_set(1,:))

%% If your learnDecisionTree() and classify() functions work,
%  you should see the following output:
%
% Root
%  |-Attribute ID 1 = 0 
%  | |-Attribute ID 2 = 0 Class : 1   +/- = [127 , 11] 
%  | |-Attribute ID 2 = 1 Class : 0   +/- = [43 , 238] 
%  |-Attribute ID 1 = 1 
%  | |-Attribute ID 2 = 0 Class : 0   +/- = [16 , 123] 
%  | |-Attribute ID 2 = 1 Class : 1   +/- = [163 , 29] 
% 
% classification =
% 
%      0
