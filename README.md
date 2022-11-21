# Mondiali 2022

## Progetto di Programmazione di Sistemi Mobile a.a. 2021/22
Applicazione iOS sul mondiale in Qatar del 2022, realizzata come progetto per il corso di studi "Programmazione di Sistemi Mobile".

Presenta informazioni sul torneo, sugli stadi, sulle squadre, sui gironi e sulle partite del torneo. Inoltre:
* si possono attivare le notifiche per le partite desiderate.
* è possibile creare e condividere la propria squadra del torneo (scegliendo 11 giocatori tra i convocati).
* si può prevedere il vincitore del torneo (partendo dai gironi fino alla finale).

*L'app è collegata a Cloud Firestore (Firebase) ma, dato il limite di letture, tutte le informazioni sono copiate anche nei JSON della cartella [Resources](https://github.com/marsild/Mondiali2022/tree/main/Mondiali%202022/Mondiali%202022/Resources). Il codice relativo a Firebase è stato commentato, quindi la dipendenza dalla libreria si può togliere.

## Issues
- In GIRONI, ELIMINAZIONE e CALENDARIO (Tab bar): Swipe dx sbagliato se eseguito **subito dopo** essere tornati indietro (con swipe sx) da altre pagine.
- In GIRONI, ELIMINAZIONE e CALENDARIO (Tab bar): Swipe funziona anche quando si apre una squadra/partita.
- Nell'elenco degli stadi (nelle informazioni del torneo) a volte l'immagine è erroneamente uguale per tutti gli stadi.

## To Do
- Loading Screen nelle mappe
- Gestione risultati e punti girone
- [“Apri in Apple maps”](https://codewithchris.com/swiftui/swiftui-apple-maps/) sotto gli stadi
- Elenco delle partite per ciascun girone 
- Più moduli in crea squadra
- Elenco giocatori, ordinabili per: ruolo, nome, squadra
- Informazioni giocatori (foto)
- Swipe lungo da sinistra per aprire menù
- Pallini in calendario nelle date in cui c'è una partita
- Schermata iniziale per spiegare a cosa servono le notifiche, prima di chiedere consenso
- Migliorare codice (codice riutilizzabile, commenti,...)
- In CalendarioView: fare comparire “nessuna partita in programma” quando non ci sono partite (e non in base alla data)

## Link Utili
- [Stadi](https://www.fifa.com/fifaplus/en/cat/4b0QLgOgdGrLB0IhsNHSV1)
- [Partite](https://digitalhub.fifa.com/m/6a616c6cf19bc57a/original/FWC-2022-Match-Schedule.pdf)


Se pubblicata nell'App Store: https://github.com/SvenTiigi/YouTubePlayerKit#app-store-review 

## LICENZA
[GNU General Public License v3.0](https://github.com/marsild/Mondiali2022/blob/main/LICENSE)

## AUTORE
**Cognome e Nome**: Spahiu Marsild

**Matricola**: 916048

**Email**: marsild.spahiu@studio.unibo.it

