%Inclass 20

%In this folder you will find a .mat file with x and y data

% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 

% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x). 
data=load('data.mat');
fit_str_free='V*x/(K+x)';
fitmodel_free=fittype(fit_str_free);
[fit_out,fit_metric]=fit(data.xx',data.yy',fitmodel_free,'StartPoint',[2 4]);
figure(1);
plot(fit_out,data.xx',data.yy');

% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)

fit_str_free='V*x^2/(K^2+x^2)';
fitmodel_Hill=fittype(fit_str_free);
[fit_out_Hill,fit_metric_Hill]=fit(data.xx', data.yy',fitmodel_Hill,'StartPoint',[2 4]);
figure(2);
plot(fit_out_Hill, data.xx', data.yy');

% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)

fit_str_free='V*x^n/(K^n+x^n)';
fitmodel_free=fittype(fit_str_free);
[fit_out_free,fit_metric_free]=fit(data.xx', data.yy',fitmodel_free,'StartPoint',[2 4 2]);
figure(3);
plot(fit_out_free, data.xx', data.yy');

% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2.

fitmodel4 = fittype(fit_str_free, 'problem', 'n');

[fit_out_4, fit_metric_4] = fit(data.xx', data.yy', fitmodel4, 'problem', 1); 
[fit_out_4_2, fit_metric_4_2] = fit(data.xx', data.yy', fitmodel4, 'problem', 2);
figure(4);
plot(fit_out_4, data.xx', data.yy');
figure(5);
plot(fit_out_4_2, data.xx', data.yy');

