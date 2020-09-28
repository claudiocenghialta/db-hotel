/* 
 
 1) 
 Fai un 'analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti. */
SELECT HOUR(`created_at`) AS 'Ora del giorno',
    COUNT(`id`) AS 'conteggio prenotazioni'
FROM `prenotazioni`
GROUP BY HOUR(`created_at`)
ORDER BY COUNT(`id`) DESC;
/*
 
 2)
 Le stanze sono state tutte prenotate almeno una volta? (Visualizzare le stanze non ancora prenotate) 
 */
SELECT stanze.id,
    stanze.room_number,
    COUNT(prenotazioni.id)
FROM `stanze`
    LEFT JOIN `prenotazioni` ON stanze.id = prenotazioni.stanza_id
GROUP BY stanze.id,
    stanze.room_number
HAVING COUNT(prenotazioni.id) = 0;
/* 
 
 3)
 Come si chiamano gli ospiti che hanno fatto più di due prenotazioni? 
 */
SELECT ospiti.id,
    ospiti.name,
    ospiti.lastname,
    COUNT(
        prenotazioni_has_ospiti.prenotazione_id
    )
FROM `prenotazioni_has_ospiti`
    JOIN ospiti ON prenotazioni_has_ospiti.ospite_id = ospiti.id
GROUP BY ospiti.id,
    ospiti.name,
    ospiti.lastname
HAVING COUNT(
        prenotazioni_has_ospiti.prenotazione_id
    ) > 2;