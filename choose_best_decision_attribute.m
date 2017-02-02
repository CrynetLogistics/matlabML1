function [attr] = choose_best_decision_attribute(examples, attribute, binary_targets)
n_t = 0;
p_t = 0;
p = zeros(4,2);
n = zeros(4,2);
i=1;

for s = 1:numel(binary_targets)
    if binary_targets(s) == 0
        n_t = n_t + 1;
        counter = 1;
        for attr = 1:numel(examples(i,:))
            if examples(i, attr) == 0
                n(counter, 1) = n(counter, 1) + 1;
            elseif examples(i, attr) == 1
                n(counter, 2) = n(counter, 2) + 1;
            end 
            counter = counter + 1;
        end
    elseif binary_targets(s) == 1
        p_t = p_t + 1;
        counter = 1;
        for attr = 1:numel(examples(i,:))
            if examples(i, attr) == 0
                p(counter, 1) = p(counter, 1) + 1;
            elseif examples(i, attr) == 1
                p(counter, 2) = p(counter, 2) + 1;
            end
            counter = counter + 1;
        end 
    end 
    i = i + 1;
end 


attr = 1