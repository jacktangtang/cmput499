clear all
load breast_cancer_dataset
tree = learnDecisionTree(train_set, attribute, 0);
print_tree(tree)
clc
'classification for train set:'
for i=1:size(train_set,1)
    classify(tree, train_set(i,:))
end
clc

'classification for test set:'
for i=1:size(test_set,1)
    classify(tree, test_set(i,:))
end