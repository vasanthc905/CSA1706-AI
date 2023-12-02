% Facts about symptoms and diseases
symptom(john, fever).
symptom(john, cough).
symptom(john, fatigue).

symptom(susan, headache).
symptom(susan, sore_throat).
symptom(susan, fatigue).

disease(fever, flu).
disease(cough, flu).
disease(fatigue, flu).

disease(headache, cold).
disease(sore_throat, cold).
disease(fatigue, cold).

% Rule to determine if a person has a particular disease based on symptoms
has_disease(Person, Disease) :-
    symptom(Person, Symptom),
    disease(Symptom, Disease).

% Query example
% To check if John has the flu, you can use:
% has_disease(john, flu).
