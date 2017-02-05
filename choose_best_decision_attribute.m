function [attr] = choose_best_decision_attribute(examples, attribute, binary_targets)
n_t = 0;
p_t = 0;
p = zeros(45,2);
n = zeros(45,2);
i=1;
attr_entropy = [];

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
total_entropy = -(n_t / numel(binary_targets)) * log2(n_t / numel(binary_targets)) - (p_t / numel(binary_targets)) * log2(p_t / numel(binary_targets));

for i = 1:numel(examples(1,:))
    n_ent_calc = -(p(i,1)) / (p(i,1) + n(i,1)) * log2(p(i,1) / (p(i,1) + n(i,1))) - (n(i,1)) / (p(i,1) + n(i,1)) * log2(n(i,1) / (p(i,1) + n(i,1)));
    p_ent_calc = -(p(i,2)) / (p(i,2) + n(i,1)) * log2(p(i,2) / (p(i,2) + n(i,2))) - (n(i,2)) / (p(i,2) + n(i,2)) * log2(n(i,2) / (p(i,2) + n(i,2)));
    remainder = (p(i,1) + n(i,1)) / numel(binary_targets) * n_ent_calc + (p(i,2) + n(i,2)) / numel(binary_targets) * p_ent_calc;
    information_gain = total_entropy - remainder;
    attr_entropy = [attr_entropy information_gain];
end

[val, idx] = max(attr_entropy);
disp(val)
disp(idx)

attr = idx;




