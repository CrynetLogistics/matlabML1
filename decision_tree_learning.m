function [tree] = decision_tree_learning (examples, attributes, binary_targets) 

first_emotion = binary_targets(1);
different_set = false;

for idx = 1:numel(examples)
    if idx ~= first_emotion
        different_set = true;
        break;
    end
end

if different_set == false
    disp(string('same set'))
elseif isempty(attributes)
    disp(string('no attributes'))
else
    best_attibute = choose_best_decision_attr(examples, attributes, binary_targets)

end
tree = different_set;
disp(different_set);