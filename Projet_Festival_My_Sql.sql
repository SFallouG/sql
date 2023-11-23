Create DATABASE festival;
use festival;

CREATE TABLE Representation (
    Num_Rep INT PRIMARY KEY,
    Titre_Rep VARCHAR(85),
    Lieu VARCHAR(85)
);

CREATE TABLE Musicien (
    Num_mus INT PRIMARY KEY,
    Nom VARCHAR(80),
    Num_Rep INT,
    FOREIGN KEY (Num_Rep) REFERENCES Representation(Num_Rep)
);

CREATE TABLE Programmer (
    Date DATE,
    Num_Rep INT,
    Tarif INT,
    FOREIGN KEY (Num_Rep) REFERENCES Representation(Num_Rep)
);

INSERT INTO Representation (Num_Rep, Titre_Rep, Lieu) VALUES (1, 'Concert de Mbalax', 'Grand Theatre');
INSERT INTO Representation (Num_Rep, Titre_Rep, Lieu) VALUES (2, 'Festival de Hip-Hop', 'Stade Amitie');
INSERT INTO Representation (Num_Rep, Titre_Rep, Lieu) VALUES (3, 'Festival de Musique ', 'Plage Beceao');
INSERT INTO Representation (Num_Rep, Titre_Rep, Lieu) VALUES (4, 'Soirée de Reggae', 'Monaco plage');
INSERT INTO Representation (Num_Rep, Titre_Rep, Lieu) VALUES (5, 'Concert de Tam Tam', 'Sorano');

INSERT INTO Musicien (Num_mus, Nom, Num_Rep) VALUES (101, 'wally seck', 1);
INSERT INTO Musicien (Num_mus, Nom, Num_Rep) VALUES (102, 'Dip doundou guiss', 2);
INSERT INTO Musicien (Num_mus, Nom, Num_Rep) VALUES (103, 'Youssou Ndour', 3);
INSERT INTO Musicien (Num_mus, Nom, Num_Rep) VALUES (104, 'Stephen Marley', 4);
INSERT INTO Musicien (Num_mus, Nom, Num_Rep) VALUES (105, 'Mamadou Ndiaye rose', 5);

INSERT INTO Programmer (Date, Num_Rep, Tarif) VALUES ('2023-11-01', 1, 10000);
INSERT INTO Programmer (Date, Num_Rep, Tarif) VALUES ('2023-12-15', 2, 5000);
INSERT INTO Programmer (Date, Num_Rep, Tarif) VALUES ('2023-07-25', 3, 3000);
INSERT INTO Programmer (Date, Num_Rep, Tarif) VALUES ('2023-12-01', 4, 2000);
INSERT INTO Programmer (Date, Num_Rep, Tarif) VALUES ('2023-12-31', 5, 5000);

SELECT Titre_Rep FROM Representation;

SELECT Titre_Rep FROM Representation WHERE Lieu = 'Sorano';

SELECT Musicien.Nom, Representation.Titre_Rep
FROM Musicien 
JOIN Representation ON Musicien.Num_Rep = Representation.Num_Rep;

SELECT Titre_Rep, Lieu, Tarif FROM Representation
JOIN Programmer ON Representation.Num_Rep = Programmer.Num_Rep
WHERE Date = '2023-07-25';

SELECT COUNT(*) AS Nombre_Musiciens FROM Musicien WHERE Num_Rep = 20;

SELECT Titre_Rep, Date, Tarif FROM Representation
JOIN Programmer ON Representation.Num_Rep = Programmer.Num_Rep WHERE Tarif <= 20000;
