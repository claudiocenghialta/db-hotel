-- 1) Conta gli ospiti raggruppandoli per anno di nascita 
SELECT YEAR(`date_of_birth`),
    COUNT(`id`)
FROM `ospiti`
GROUP BY YEAR(`date_of_birth`);


-- 2) Somma i prezzi dei pagamenti raggruppandoli per status
SELECT
    `status`, SUM(`price`)
FROM
    `pagamenti`
GROUP BY `status`

-- 3) Conta quante volte è stata prenotata ogni stanza
SELECT
    stanze.room_number, COUNT(prenotazioni.id)
FROM
    `prenotazioni`
JOIN
	`stanze`
ON 
	prenotazioni.stanza_id = stanze.id
GROUP BY
	stanze.room_number


-- 4) Stampare tutti gli ospiti per ogni prenotazione
SELECT
    prenotazioni_has_ospiti.prenotazione_id, ospiti.name, ospiti.lastname
FROM
    `prenotazioni_has_ospiti`
JOIN
	`ospiti`
ON
	prenotazioni_has_ospiti.ospite_id = ospiti.id


-- 5) Stampare Nome, Cognome,Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018
SELECT
    prenotazioni.id AS 'id prenotazione', prenotazioni.created_at, ospiti.id AS 'id ospite', ospiti.name, ospiti.lastname, pagamenti.price, paganti.ospite_id AS 'id pagante', paganti.name, paganti.lastname, EXTRACT(YEAR_MONTH FROM prenotazioni.created_at) AS 'YYYYMM'
FROM
    `prenotazioni`
JOIN
	`prenotazioni_has_ospiti`
ON
	prenotazioni_has_ospiti.prenotazione_id = prenotazioni.id
JOIN
	`pagamenti`
ON
	pagamenti.prenotazione_id = prenotazioni.id
JOIN
	`ospiti`
ON
	ospiti.id = prenotazioni_has_ospiti.ospite_id
JOIN
	`paganti`
ON
	paganti.id = pagamenti.pagante_id
WHERE
	EXTRACT(YEAR_MONTH FROM prenotazioni.created_at)= 201805

-- 6) Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano
-- 7) Prendi i dati di fatturazione per la prenotazione con id = 7