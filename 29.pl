% Rules for diagnosing diseases based on symptoms
has_symptom(john, fever).
has_symptom(john, cough).
has_symptom(susan, headache).
has_symptom(susan, sore_throat).

disease(flu) :- has_symptom(_, fever), has_symptom(_, cough).
disease(cold) :- has_symptom(_, headache), has_symptom(_, sore_throat).

% Forward chaining inference rule
diagnose(Person, Disease) :-
    has_symptom(Person, Symptom),
    disease(Disease),
    not(has_symptom(Person, _)),
    assert(has_symptom(Person, Symptom)),
    write(Person), write(" has "), write(Disease), write(" due to "), write(Symptom), nl,
    fail.

% Goal for diagnosis
goal :-
    diagnose(_, _),
    write("Diagnosis complete."), nl.

% Sample queries
% To initiate forward chaining and diagnose diseases:
% 1. goal.
% 2. has_symptom(jane, cough). (Adding new symptoms)
% 3. goal. (Run goal again to re-diagnose)
