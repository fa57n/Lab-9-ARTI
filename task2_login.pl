% Task 2: Login System

% Dataset
user(ali, '1234').
user(sara, '5678').
user(fatima, 'abcd').

% Start login
login :-
    login_attempt(3).

% Check username and password
login_attempt(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (
        user(Username, Password)
    ->
        writeln('Login Successful')
    ;
        writeln('Login Unsuccessful'),
        Remaining is Attempts - 1,
        login_attempt(Remaining)
    ).

% Maximum attempts exceeded
login_attempt(0) :-
    writeln('Sorry, you exceeded the maximum number of attempts, try again later.').
