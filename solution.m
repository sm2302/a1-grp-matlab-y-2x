%% Conway's Game of Life

% Generating random 1st Generation
g = 50; % grid size
d = 0.1; % density of nonzeros
n = 50

x = sprand(g-2,g-2,d);
gen1 = spones(x); % converting nonzeros to ones

% Creating a zeros border
gen = zeros(g,g);
gen(2:g-1,2:g-1) = gen1;

for t = 1:n
  
spy(gen,'.m',12) % plotting sparsity pattern of matrix with colour red, size 3
title(num2str(t)) % converts a numeric array into a character array that represents the numbers
drawnow
pause(0.2)

% Replacing each element with the sum of its neighbours
i = 2:g-1;
j = 2:g-1;
gen(i,j) = gen(i-1,j+1) + gen(i-1,j) + gen(i-1,j-1) + gen(i,j+1) + gen(i,j-1) + gen(i+1,j+1) + gen(i+1,j) + gen(i+1,j-1);

% Implement game rules
gen(gen < 2) = 0;
gen(gen > 3) = 0;
gen(gen == 2 | gen == 3) = 1;

end
