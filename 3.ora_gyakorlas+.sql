SELECT UGYFEL_FK, SZOBA_FK, IIF(MONTH(METTOL) IN (6,7,8), 'Igen', 'NEM') AS 'NYári szezon'
FROM Foglalas
WHERE UGYFEL_FK = 'laszlo2' And GYERMEK_SZAM = 0


SELECT szh.TIPUS,
        YEAR(f.MEDDIG) AS 'Év',
        MONTH (f.METTOL) AS 'Hónap',
        COUNT(*)
FROM Foglalas f JOIN Szoba sz on f.SZOBA_FK = sz.SZOBA_ID
                JOIN Szallashely szh ON sz.SZALLAS_FK =szh.SZALLAS_ID
WHERE DATEDIFF(day, f.METTOL, f.MEDDIG) >= 5
GROUP BY szh.TIPUS, YEAR(f.METTOL), MONTH(f.METTOL)