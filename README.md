# timetable
3. creation de lobjet



CREATE VIEW Question3 AS
SELECT DISTINCT C.codeCours, T.jourCoursDate,T. TRANCHE,C.VOLUMEH FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours J
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cls
ON T.crsCodeCours=cls.crsCodeCours
JOIN Classe Cl
ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
WHERE T.jourCoursDate
IN ('lundi','mardi','mercredi','jeudi','vendredi','samedi') AND cls.classNiveauidNiveau=001;




4. 
alter table etudiant add password varchar(50);
update etudiant set password =&password(matricule) where matricule =&matricule ;

alter table enseignants add password varchar(50);
update enseignants set password = &password(matricule) where matricule =&matricule;





5. script de l'emploi de temps
SET ECHO OFF
SET MARKUP HTML ON SPOOL ON 
SPOOL emploi_temps_TIPAM2.HTML
SELECT DISTINCT T.jourCoursDate as jours ,
                  C.intituleCourt ||'('||C.codeCours||')' as cours ,
                    C.credits as credits_cours,
                    'trimestre'|| C.periodeAcademiqueIdTrim  as periode_trimestrielle,
                    ce.specialiteNomSpec || cd.classNiveauidNiveau as specialite,
                    T.tranche ||'heures' as tranche_horaire
FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours j
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cd
ON  T.crsCodeCours=cd.crsCodeCours
JOIN Classe ce
ON ce.specialiteNomSpec=cd.classSpecialiteNomspec
INNER JOIN ClassePeriodeacademique ca
ON C.periodeAcademiqueIdTrim=ca.PERIODEACADEMIQUEIDTRIM
WHERE ce.specialiteNomSpec='TIPAM'
AND   cd.classNiveauidNiveau=002
ORDER BY T.jourCoursDate ASC;
SPOOL OFF
SET MARKUP HTML OFF
SET ECHO ON



