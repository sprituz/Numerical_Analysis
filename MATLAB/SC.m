function root = SC(func,xi,delta,error,maxit)

% 할선법(Secant법)을 위해 필요한 인자는 함수, 초기값, 초기값과 다음값의 차이, 허용 오차, 최대 반복 횟수다.
% 최대 반복횟수는 없어도 함수를 시행하는데 문제는 없다.
% 필요 인자들을 입력한 후 최종 결과(Output)은 root에 저장되며, 이는 함수의 근을 의미한다.

i = 1; % iteration, 반복횟수를 초기화한다.
       % i = 0으로 초기화 할 경우 while문에서 i = i + 1의 위치가 if 문 위로 와야 할 것이다.
xrold = 0; % 오차 계산을 위한 xrold를 정의하고, 초기값은 0으로 준다. 
xr = xi;   % 해인 xr은 일단 xi과 같다고 설정해둔다.

fprintf('iteration        root            error\n')

while(1)                      % 주어진 조건을 만족할 때 까지 무한반복시킨다. 
    
    xrold = xr;               % xrold는 이전에 계산해둔 xr과 같은 값이다.
    xr = xrold - (delta*xrold*func(xrold)/(func(xrold+delta*xrold)-func(xrold)));    % 할섭법의 기본 식을 넣는다.
    fprintf('%f\n',double(xr))
    er = abs((xr - xrold)/xr) * 100;                           % 상대오차를 계산한다.
    fprintf('    %d         %f        %f\n',i,double(xr),double(er))
    i = i + 1;                       % 반복횟수를 1 증가시킨다.
    
if i == maxit || abs(er) <= error, break, end % 루프 탈출 조건을 지정한다.
                                              % 허용 오차보다 오차가 적거나
                                              % 최대 반복횟수만큼 반복한 경우
end