% 1) Excitatory Input on a second neuron **********
% Sherry Shi
clear all

dt=.01; %time interval increments by .01 
t=0:dt:50; %runs for 50 seconds

injectedCurrent = 15*dt;  %Injected Current is 15 mV * dt 
restingV=-70; %-70 mV is resting potential
threshold=-55; % Threshold- Where action potential stimulted
spikeAmp=50; %spikes to 50 mV

neuronVoltage2= zeros(size(t)); % Stores voltage of a second neuron for 50 secs
neuronVoltage = zeros(size(t)); %Stores voltage of the first neuron for 50 secs
neuronVoltage(1)=restingV;  %Neuron 1 starts at resting potential 
neuronVoltage2(1)=restingV;  %Neuron 2 starts at resting potential 

A=rand(1);
B=rand(1);
if A>B
for i=2:length(t)  %for every time value, from 2 for (i-1) 
    leakCurrent=((neuronVoltage(i-1)-restingV)*dt)/10; %defining the leak current for first neuron based on euler
    neuronVoltage(i)=neuronVoltage(i-1)+injectedCurrent-leakCurrent; %First neuron still gets injected current and leaks current
    
    %For the first neuron spike
    if neuronVoltage(i)>threshold && neuronVoltage(i)<40  %If reached threshold, less than 40 (for leak), make neuron spike
        neuronVoltage(i)=50; %the spike (the overshoot)
    elseif neuronVoltage(i) > 40  %if over the spikeAmp (40 for leak)goes back to resting 
         neuronVoltage(i)= restingV; %returns to resting
    end
    neuronVoltage2(i)=neuronVoltage2(i-1);
end
elseif B>A
for i=2:length(t)  %for every time value, from 2 for (i-1) 
    leakCurrent=((neuronVoltage(i-1)-restingV)*dt)/10; %defining the leak current for first neuron based on euler
    neuronVoltage2(i)=neuronVoltage2(i-1)+injectedCurrent-leakCurrent; %First neuron still gets injected current and leaks current
    
    %For the first neuron spike
    if neuronVoltage2(i)>threshold && neuronVoltage2(i)<40  %If reached threshold, less than 40 (for leak), make neuron spike
        neuronVoltage2(i)=50; %the spike (the overshoot)
    elseif neuronVoltage2(i) > 40  %if over the spikeAmp (40 for leak)goes back to resting 
         neuronVoltage2(i)= restingV; %returns to resting
    end
    neuronVoltage(i)=neuronVoltage(i-1);
end
end 

figure(6) %Plots in figure 6 
clf
plot(t,neuronVoltage) %Plots the first neuron
hold on
plot(t,neuronVoltage2) %Plots the second neuron 
legend('1st' , '2nd') 
title('The Winner Takes All') 
xlabel('Time') 
ylabel('mV')
