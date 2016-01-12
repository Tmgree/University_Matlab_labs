
% ########################
% Heun's Method for ODEs #
% ########################


f = inline('t^2-y','y','t');  % This is the function on the RHS of the ODE

truey=inline('tt.^2-2*tt+2+(alpha-17)*exp(-tt-3)','tt','alpha');
d=807;
alpha=0.01*d;
% Set up the initial data and the end value for 't':
t_begin = -3;
t_end = 3;
y0 = alpha;


% Choose the number of points:
N = 100;


% Set up the vectors to hold the 't' and 'y' values as they are calculated:
t = zeros(N+1,1);
y = t;


% Put the initial data into the first elements of the vectors 't' and 'y':
t(1) = t_begin;
y(1) = y0;


% Calculate the step-length:
h = (t_end-t_begin)/N;



% Now carry out Heun's method:

for k = 1:N  % Be careful not to confuse 'k' (the loop-counter) with k1 or k2 (needed in Heun's Method)
  k1 = f(y(k),t(k));
  tempy = y(k) + h*k1;
  tempt = t(k) + h;
  k2 = f(tempy,tempt);
  y(k+1) = y(k)+h*(k1+k2)/2;
  t(k+1) = t(k) + h;
end


% Print the final values:
disp(' ')
disp(' ')
disp('Final value of t:')
disp(t(N+1))
disp(' ')
disp('Final value of y:')
disp(y(N+1))
disp(' ')
disp('Number of steps:')
disp(N)

for k=1:N+1
   yana(k)=truey(t(k),alpha);
   error1(k)=yana(k)-y(k);
 
end




% Only use these last steps if the analytical solution of the ODE is known 
% (otherwise, put % at the start of each line to make them comments)
tt=t(N+1);
%truey = tt.^2-2*tt+2+(alpha-17)*exp(-tt-3);
diff = y(N+1) - truey(tt,alpha);
disp('True value of y:')
disp(truey)
disp(' ')
disp('Difference between computed and true values:')
disp(diff)

plot(t,error1)



