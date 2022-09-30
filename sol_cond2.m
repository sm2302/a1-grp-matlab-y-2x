%% Conway's Game of Life

% Generating random 1st Generation
g = 50; % grid size
d = 0.1; % density of nonzeros
n = 50; % number of generations

x = sprand(g-2,g-2,d);
gen1 = spones(x); % converting nonzeros to ones

% Creating a zeros border
gen = zeros(g,g);
gen(2:g-1,2:g-1) = gen1;

for t = 1:n
  
% Displaying generation
spy(gen,'.m',12) % plot sparse pattern with magenta circles size 12
title(num2str(t)) % labeling each plot with the generation number
drawnow
pause(0.2)

% Replacing each element with the sum of its neighbours
i = 2:g-1;
j = 2:g-1;
gen(i,j) = gen(i-1,j+1) + gen(i-1,j) + gen(i-1,j-1) + gen(i,j+1) + gen(i,j-1) + gen(i+1,j+1) + gen(i+1,j) + gen(i+1,j-1);

% Implement game rules
gen(gen < 3) = 0; % Underpopulation
gen(gen > 4) = 0; % Overpopulation
gen(gen == 3 | gen == 4) = 1; % Lives to the next generation

end
