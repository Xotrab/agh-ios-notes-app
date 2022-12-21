# Specyfikacja realizowanej aplikacji

## Tytuł aplikacji

NotesApp

## Autor/Autorzy

- Bartosz Kałuża, bkaluza@student.agh.edu.pl
- Maciej Obuchowski, obuchowski@student.agh.edu.pl

## Wizja aplikacji

Aplikacja będzie służyła tworzeniu notatek w ramach tematów. Temat można interpretować jako folder na notatki. Notatkę można stworzyć ręcznie lub poprzez sczytanie tekstu z obrazka (np. ze zdjęcia). Dodatkowo w ramach notatki użytkownik będzie miał podstawowe możliwości wyróżniania tekstu.

## Wymagania

### Funkcjonalne:
Aplikacja powinna umożliwiać:
-  Tworzenie tematów
-  Tworzenie notatek w obrębie tematu
- Odczytanie tekstu z obrazka przy tworzeniu notatki
- Wyróżnianie segmentów tekstu notatki

### Pozafunkcjonalne:
 - Użytkownik może stworzyć do 25 tematów
 - W ramach tematu użytkownik może stworzyć do 25 notatek

## Wykorzystane narzędzia

### Framework(i) iOS SDK

Vision

### Frameworki/biblioteki zewnętrzne

1. Atributika - https://github.com/psharanda/Atributika - wyróżnianie segmentów tekstu
2. SQLite.swift - https://github.com/stephencelis/SQLite.swift - przechowywanie i dostęp do danych

## Dane

Przechowywaniu i przetwarzaniu podlegać będą dane dotyczące tematów, notatek oraz ich przynależności do tematów.

# Projekt i architektura aplikacji

## Wykaz i kompetencje modułów
- TopicView - widok definiujący wygląd jednego tematu z listy
- TopicListView - widok z listą tematów
- NoteView - widok definiujący wygląd jednej notatki z listy
- NotesListView - widok z listą notatek
- AddNoteView - widok służący do dodawania nowych notatek
- AddTopicView - widok służący do dodawania nowych tematów
- DatabaseService - serwis służący do pracy z bazą danych

## Projekt interfejsu użytkownika

### Widok 1 – TopicView

#### Zadanie
Definiuje wygląd elementu w liście tematów. Docelowo widok powinien zawierać nazwę tematu oraz przycisk do jego usuwania. Kliknięcie  w taki element powoduje nawigację do widoku z listą notatek w wybranym temacie. 

#### Wykorzystane elementy
- SwiftUI
#### Powiązania z innymi widokami
- NotesListView

### Widok 2 – TopicListView
#### Zadanie
Zawiera listę tematów stworzonych przez użytkownika. Lista zawiera elementy zdefiniowane przez widok TopicView. Oprócz listy widok zawiera przycisk pozwalający na stworzenie nowego tematu.

#### Wykorzystane elementy
- SwiftUI
#### Powiązania z innymi widokami
- TopicView
- AddTopicView

### Widok 3 – NoteView
#### Zadanie
Definiuje wygląd elementu w liście notatek. 

#### Wykorzystane elementy
- SwiftUI
#### Powiązania z innymi widokami
- NoteListView

### Widok 4 – NotesListView
#### Zadanie
Zawiera listę notatek dodanych przez użytkownika w ramach wybranego tematu. Oprócz listy widok zawiera przycisk pozwalający na dodanie nowej notatki w obrębie tematu. Dodatkowo widok pozwala na usunięcie wybranej notatki. Wybrane segmenty tekstu takie jak: linki, nagłówki poprzedzone # oraz oznaczenia osób poprzedzone @ są odpowiednio wyróżnione.

#### Wykorzystane elementy
- SwiftUI
- Atributika
#### Powiązania z innymi widokami
- NoteView
- AddNoteView
- DatabaseService

### Widok 5 – AddNoteView
#### Zadanie
Widok pozwala na stworzenie notatki lub na wyciągnięcie tekstu z załączonego obrazu. 

#### Wykorzystane elementy
- SwiftUI
- Vision
#### Powiązania z innymi widokami
- NoteListView
- DatabaseService

### Widok 6 – AddTopicView
#### Zadanie
Widok pozwala na stworzenie nowego tematu. Użytkownik podaje nazwę i zatwierdza.

#### Wykorzystane elementy
- SwiftUI
#### Powiązania z innymi widokami
- TopicListView
- DatabaseService
- 
## Scenariusze użycia

### Scenariusz 1 - Przegląd tematów

1. Użytkownik otwiera aplikację
2. Wyświetlana jest lista tematów

### Scenariusz 2 – Przegląd notatek w temacie
1. Użytkownik wyświetla listę tematów
2. Użytkownik klika wybrany temat
3. Aplikacja wyświetla listę notatek w danym temacie

### Scenariusz 3 – Dodanie tematu
1. Użytkownik wyświetla listę tematów
2. Użytkownik wciska przycisk dodania tematu
3. Użytkownik nadaje tematowi nazwę
4. Użytkownik zatwierdza dodanie tematu
5. Użytkownik jest przekierowany do listy tematów

### Scenariusz 4 – Dodanie notatki ręczne
1. Użytkownikowi wyświetlana jest lista tematów
2. Użytkownik wchodzi w wybrany temat
3. Użytkownik wciska przycisk dodania notatki
4. Użytkownik wypełnia treść notatki...
4a. ręcznie
4b. poprzez wgranie zdjęcia z tekstem i automatyczne zczytanie
5. Użytkownik wyróżnia wybrane przez siebie fragmenty tesktu poprzez poprzedzenie nagłówków znakiem #, oznaczeń osób znakiem @ (poprawne linki są wyróżniane automatycznie)
6. Użytkownik wprowadza potencjalne poprawki do tekstu
7. Użytkownik akceptuje nową notatkę
8. Użytkownik jest przekierowany do listy notatek w temacie

### Scenariusz 5 – Usunięcie notatki
1. Użytkownik wyświetla listę tematów
2. Użytkownik wybiera temat
3. Użytkownik wciska przycisk usunięcia koło notatki
4. Notatka zostaje usunięta

### Scenariusz 6 – Usunięcie tematu
1. Użytkownik wyświetla listę tematów
2. Użytkownik wciska przycisk usunięcia koło tematu
3. Temat zostaje usunięty

# Persystencja danych

## Wybrane rozwiązanie

- SQLite

## Sposób połączenia i wykonywania zapytań

- baza danych przechowywana jest w pliku, wykorzystano wyłącznie biblioteki opisane w poprzednich raportach

## Model danych

### Note:
- id: Int64
- topicId: Int64
- content: String

### Note:
- id: Int64
- name: String

# Zmiany wprowadzone w trakcie implementacji:
- zgodnie z ustaleniami z laboratorium, ze względu na niską ilość czasu zrezygnowaliśmy z funkcjonalności generowania plików PDF z listy notatek, która była częścią pierwotnego planu aplikacji. Żeby spełnić wymagania projektowe związane z dwoma zewnętrznymi bilbiotekami zdecydowaliśmy się na zaimplementowanie prostszej funkcjonalności jaką jest wyróżnianie fragmentów notatek. Do tego celu zastosowaliśmy biblioteką przytoczoną w sekcji biblioteki zewnętrzne.

# Podział zadań:
- Maciej Obuchowski - szkielet aplikacji wraz z persystencją danych
- Bartosz Kałuża - obsługa tworzenia notatek na podstawie załączonych zdjęć oraz wyróżnianie fragmentów tekstu
