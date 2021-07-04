function [y1] = tension(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 29-Dec-2019 17:10:59.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx1 matrix, input #1
% and returns:
%   y = Qx1 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = 30;
x1_step1.gain = 0.04;
x1_step1.ymin = -1;

% Layer 1
b1 = [-13.714395704455206726;-10.879606253353408363;7.4163140729570899978;-4.6557398393939166681;1.5781832603253020952;-1.6228898053981151151;4.6733661541177839993;7.7453510133626126688;10.88682040177747723;14.000001359587701089];
IW1_1 = [14.285609539503580478;14.00280882271813887;-14.216860117809469344;14.002481131503490275;-13.995446530731509682;-13.986488035166727784;13.998641542729730602;14.019442704267770949;14.001389813125097561;13.999999420528283167];

% Layer 2
b2 = -0.39044852576007027523;
LW2_1 = [-0.73338953721842758959 -0.49387775834013247778 -0.46422669038881109183 0.49640885602373485685 -0.17947849475130142616 0.21167741363080300188 -0.39314583406245406927 0.2507326602085346301 0.27409620645119736615 -0.79908973062088528572];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.505050505050505;
y1_step1.xoffset = 5.66;

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end