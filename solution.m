%% Conway's Game of Life

% Generating random 1st Generation
g = 10; % grid size
d = 0.3; % density of nonzeros

x = sprand(g-2,g-2,d);
gen1 = spones(x); % converting nonzeros to ones

% Creating a zeros border
gen = zeros(g,g);
gen(2:g-1,2:g-1) = gen1;

% Displaying initial generation
full(gen)

% Replacing each element with the sum of its neighbours
i = 2:g-1;
j = 2:g-1;
gen(i,j) = gen(i-1,j+1) + gen(i-1,j) + gen(i-1,j-1) + gen(i,j+1) + gen(i,j-1) + gen(i+1,j+1) + gen(i+1,j) + gen(i+1,j-1);
full(gen)

%% Implement game rules