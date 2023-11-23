Create database Entreprise;
use Entreprise;

-- Création de la table Departements
CREATE TABLE Departements (
    DNO INT PRIMARY KEY,
    DNOM VARCHAR(50),
    DIR VARCHAR(50),
    VILLE VARCHAR(50)
);
CREATE TABLE Employes (
    ENO INT PRIMARY KEY,
    ENOM VARCHAR(50),
    PROF VARCHAR(50),
    DATEEMB DATE,
    SAL DECIMAL(10, 2),
    COMM DECIMAL(10, 2),
    DNO INT,
    FOREIGN KEY (DNO) REFERENCES Departements(DNO)
);

INSERT INTO Departements (DNO, DNOM, DIR, VILLE) VALUES (1, 'Dprt_1', 'DIR_1', 'Ville_1');
INSERT INTO Departements (DNO, DNOM, DIR, VILLE) VALUES (2, 'Dprt_2', 'DIR_2', 'Ville_2');
INSERT INTO Departements (DNO, DNOM, DIR, VILLE) VALUES (3, 'Dprt_3', 'DIR_3', 'Ville_3');
INSERT INTO Departements (DNO, DNOM, DIR, VILLE) VALUES (4, 'Dprt_4', 'DIR_4', 'Ville_4');
INSERT INTO Departements (DNO, DNOM, DIR, VILLE) VALUES (5, 'Dprt_5', 'DIR_5', 'Ville_5');
INSERT INTO Departements (DNO, DNOM, DIR, VILLE) VALUES (6, 'Dprt_6', 'DIR_6', 'Ville_6');
INSERT INTO Departements (DNO, DNOM, DIR, VILLE) VALUES (7, 'Dprt_7', 'DIR_7', 'Ville_7');

INSERT INTO Employes (ENO, ENOM, PROF, DATEEMB, SAL, COMM, DNO) VALUES (1, 'Emp_1', 'PROF_1', '2023-01-01', 500000, 1000, 1);
INSERT INTO Employes (ENO, ENOM, PROF, DATEEMB, SAL, COMM, DNO) VALUES (2, 'Emp_2', 'PROF_2', '2023-02-01', 600000, 1200, 2);
INSERT INTO Employes (ENO, ENOM, PROF, DATEEMB, SAL, COMM, DNO) VALUES (3, 'Emp_3', 'PROF_1', '2023-03-01', 550000, NULL, 1);
INSERT INTO Employes (ENO, ENOM, PROF, DATEEMB, SAL, COMM, DNO) VALUES (4, 'Emp_4', 'PROF_3', '2023-04-01', 700000, 1500, 3);
INSERT INTO Employes (ENO, ENOM, PROF, DATEEMB, SAL, COMM, DNO) VALUES (5, 'Emp_5', 'PROF_2', '2023-05-01', 650000, 1300, 2);
INSERT INTO Employes (ENO, ENOM, PROF, DATEEMB, SAL, COMM, DNO) VALUES (6, 'Emp_6', 'PROF_3', '2023-06-01', 720000, 1600, 3);
INSERT INTO Employes (ENO, ENOM, PROF, DATEEMB, SAL, COMM, DNO) VALUES (7, 'Emp_7', 'PROF_1', '2023-07-01', 580000, NULL, 1);

-- 1. Liste des employés ayant une commission
SELECT * FROM Employés WHERE COMM IS NOT NULL;

-- 2. Noms, emplois et salaires des employés par emploi croissant, et pour chaque emploi, par salaire décroissant
SELECT ENOM, PROF, SAL FROM Employés ORDER BY PROF ASC, SAL DESC;

-- 3. Salaire moyen des employés
SELECT AVG(SAL) AS SalaireMoyen FROM Employés;

-- 4. Salaire moyen du département Production
SELECT AVG(SAL) AS SalaireMoyenProduction FROM Employés WHERE DNO = 1;

-- 5. Numéros de département et leur salaire maximum
SELECT DNO, MAX(SAL) AS SalaireMaximum FROM Employés GROUP BY DNO;

-- 6. Professions et leur salaire moyen
SELECT PROF, AVG(SAL) AS SalaireMoyen FROM Employés GROUP BY PROF;

-- 7. Salaire moyen par profession le plus bas
SELECT PROF, MIN(AVG(SAL)) AS SalaireMoyenPlusBas FROM Employés GROUP BY PROF;
