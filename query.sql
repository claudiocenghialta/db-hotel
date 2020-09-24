-- 1.  Seleziona tutti gli ospiti che sono stati identificati con
--     la carta di identità.

SELECT *
FROM dbhotel.`ospiti`
WHERE `document_type` = 'CI';


-- 2.  Seleziona tutti gli ospiti che sono nati dopo il 1988
SELECT *
FROM dbhotel.`ospiti`
WHERE YEAR(`date_of_birth`) >= 1988;


-- 3.  Seleziona tutti gli ospiti che hanno più di 20 anni
--     (al momento dell’esecuzione della query)
SELECT *, (NOW()-`date_of_birth`)
FROM `ospiti`
WHERE `date_of_birth`<= DATE_SUB(CURDATE(),INTERVAL 21 YEAR);


-- 4.  Seleziona tutti gli ospiti il cui nome inizia con la D
SELECT *
FROM `ospiti`
WHERE `name` LIKE  'D%';


-- 5. Calcolare il totale degli ospiti paganti
SELECT COUNT(`pagante_id`)
FROM `pagamenti` ;

-- 6.  Qual è il prezzo massimo pagato?
SELECT MAX(`price`)
FROM `pagamenti`;

-- 7. Seleziona gli ospiti riconosciuti con patente e nati nel 1975
SELECT *
FROM `ospiti`
WHERE `document_type`='Driver License' AND YEAR(`date_of_birth`)=1975;

-- 8. Quanti posti letto ha l’hotel in totale?
SELECT SUM(`beds`)
FROM `stanze`
