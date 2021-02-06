SET ECHO OFF
SET MARKUP HTML ON SPOOL ON
SPOOL emploiTemps.HTML
SELECT DISTINCT T.jourCoursDate as jours ,
                  C.intituleCourt ||'('||C.codeCours||')' as cours_classe ,
                    C.credits as credits_cours,
                    'Trimestre'|| C.periodeAcademiqueIdTrim  as periode_Trimestrielle,
                    ce.specialiteNomSpec || cd.classNiveauidNiveau as specialite,
                    T.tranche ||'hrs' as trancheHoraire
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
