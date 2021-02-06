

update Etudiant set password = ora_hash(matricule) where matricule=&valeur;


