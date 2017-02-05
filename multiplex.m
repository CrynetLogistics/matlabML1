function [binary_targets_t] = multiplex (binary_targets)

binary_targets_t = zeros(1004,1,6);
for bint = 1:numel(binary_targets)
    binary_targets_t(bint,1,binary_targets(bint)) = 1;
end