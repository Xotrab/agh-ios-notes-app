# Specyfikacja realizowanej aplikacji

## Tytuł aplikacji

NotesApp

## Autor/Autorzy

- Bartosz Kałuża, bkaluza@student.agh.edu.pl
- Maciej Obuchowski, obuchowski@student.agh.edu.pl

## Wizja aplikacji

Aplikacja będzie służyła tworzeniu notatek w ramach tematów. Temat można interpretować jako folder na notatki. Notatkę można stworzyć ręcznie lub poprzez sczytanie tekstu z obrazka (np. ze zdjęcia). 

## Wymagania

### Funkcjonalne:
Aplikacja powinna umożliwiać:
-  Tworzenie tematów
-  Tworzenie notatek w obrębie tematu
- Odczytanie tekstu z obrazka przy tworzeniu notatki
- Generowanie pliku pdf ze wszystkimi notatkami z danego tematu

### Pozafunkcjonalne:
 - Użytkownik może stworzyć do 25 tematów
 - W ramach tematu użytkownik może stworzyć do 25 notatek

## Wykorzystane narzędzia

### Framework(i) iOS SDK

CoreML

### Frameworki/biblioteki zewnętrzne

1. PDFGenerator - https://github.com/sgr-ksmt/PDFGenerator - generowanie pdf z notatkami
2. SQLite.swift - https://github.com/stephencelis/SQLite.swift - przechowywanie i dostęp do danych

## Dane

Przechowywaniu i przetwarzaniu podlegać będą dane dotyczące tematów, notatek oraz ich przynależności do tematów.

## Repozytorium

https://github.com/Xotrab/agh-ios-notes-app
