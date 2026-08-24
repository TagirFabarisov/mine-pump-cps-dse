function in = localResetFcn(in)
    rng('shuffle');  % Ensure variation across episodes

    % Static parameters 
    in = setVariable(in, 'Hs', 10);  % static head values (meters
    in = setVariable(in, 'Dia', 2);  % Example pipe diameters (inches)
    in = setVariable(in, 'Ln', 500); % Example pipe lengths (meters)

    % Randomized initial conditions with upper bias
    water = 3.3 + randn * 0.3;
    methane = 0.1 + randn * 0.1;

    in = setVariable(in, 'initWaterLevel', water);
    in = setVariable(in, 'initMethaneLevel', methane);

    
    global finjectors;
    finjectors = containers.Map;
    finjectors('1') = FaultInjector('Sensor: Stuck-at fault', 1, 'Failure probability', 0.0008, 'Constant time', 1);
    finjectors('2') = FaultInjector('Sensor: Offset', -0.2, 'Failure probability', 0.0008, 'Constant time', 5);
    finjectors('5') = FaultInjector('Sensor: Noise', 150, 'Failure probability', 0.0008, 'Constant time', 1);
    finjectors('4') = FaultInjector('Network: Package drop', 0, 'Failure probability', 0.0008, 'Constant time', 5);



    %disp(water);
    %disp(methane);
end
