function generator = generatorNetwork(input_dim, feature_dim)
% Define the generator network

generator = [
    fullyConnectedLayer(input_dim, 512, 'Name', 'fc1')
    reluLayer('Name', 'fc1_relu')
    fullyConnectedLayer(512, 1024, 'Name', 'fc2')
    reluLayer('Name', 'fc2_relu')
    fullyConnectedLayer(1024, feature_dim, 'Name', 'fc3')
];