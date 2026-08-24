modelName = 'mine_pump_system_GA';

rng('shuffle');

Hs_values = [10];  % Example static head values (meters)
Dia_values = [2];  % Example pipe diameters (inches)
Ln_values = [500];  % Example pipe lengths (meters)

assignin('base', 'controlDep', 10);
assignin('base', 'pumpDep', 10);
assignin('base', 'sensorDep', 10);
assignin('base', 'controlRec', 10);
assignin('base', 'pumpRec', 10);
assignin('base', 'sensorRec', 10);



%Hs_values = [10,  14,  18,  22,  26,  30];  % Example static head values (meters)
%Dia_values = [2,  3,  4,  5,  6,  7];  % Example pipe diameters (inches)
%Ln_values = [500,  1000,  1500,  2000,  2500,  3000];  % Example pipe lengths (meters)
% Prepare storage for results
results = [];
initWaterLevel = 3.3 + randn * 0.3;
initMethaneLevel = 0.1 + randn*0.1;

assignin('base', 'initWaterLevel', initWaterLevel);
assignin('base', 'initMethaneLevel', initMethaneLevel);

%global finjectors;
%finjectors = containers.Map;
%finjectors('1') = FaultInjector('Sensor: Stuck-at fault', 1, 'Failure probability', 0.0008, 'Constant time', 1);
%finjectors('2') = FaultInjector('Sensor: Offset', -0.2, 'Failure probability', 0.0008, 'Constant time', 5);
%finjectors('5') = FaultInjector('Sensor: Noise', 150, 'Failure probability', 0.0008, 'Constant time', 1);
%finjectors('4') = FaultInjector('Network: Package drop', 0, 'Failure probability', 0.0008, 'Constant time', 5);


%systemOnline = true;
%pumpRunning = false;
%allowRestart = true;
%methaneLevel = 0;
%waterLevel = 0;
%methaneThreshold = 10;
%waterThreshold = 10;
%assignin('base', 'systemOnline', systemOnline);
%assignin('base', 'allowRestart', pumpRunning);
%assignin('base', 'pumpRunning', allowRestart);
%assignin('base', 'methaneLevel', methaneLevel);
%assignin('base', 'waterLevel', waterLevel);
%assignin('base', 'methaneThreshold', methaneThreshold);
%assignin('base', 'waterThreshold', waterThreshold);


% Step 3: Loop Through Input Combinations
for Hs = Hs_values
    for Dia = Dia_values
        for Ln = Ln_values
            % Set Model Parameters
            %set_param([modelName '/Resistive Pipe LP'], 'Hs', num2str(Hs));
            %set_param([modelName '/Resistive Pipe LP'], 'Dia', num2str(Dia));
            %set_param([modelName '/Resistive Pipe LP'], 'Ln', num2str(Ln));
            assignin('base', 'Hs', Hs);
            assignin('base', 'Dia', Dia);
            assignin('base', 'Ln', Ln);
            % Run the Simulation
            %simOut = sim(modelName, 'StopTime', '1000'); % Adjust simulation time as needed
            % Step 4: Extract Output Data
            %Q = simOut.logsout.getElement('Q').Values.Data(end);  % Extract Flow Rate (Q)
            %w = simOut.logsout.getElement('w').Values.Data(end);  % Extract Power (w)
            % Store Data
            %results = [results; Hs, Dia, Ln, Q, w];
        end
    end
end