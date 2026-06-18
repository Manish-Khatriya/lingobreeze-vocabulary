# LingoBreeze – My Vocabulary

A Flutter-based vocabulary learning feature that allows users to save words they want to learn later. Words are fetched from a Node.js API and stored in Firebase Firestore.

## Features

* View saved vocabulary words
* Add words from API
* Firebase Firestore integration
* Loading State
* Empty State
* Error State
* Pull-to-Refresh
* Clean & Modern UI
* Provider State Management

## Tech Stack

### Flutter

* Flutter
* Provider
* HTTP
* Firebase Firestore

### Backend

* Node.js
* Express.js

## API

GET /words

Returns a list of vocabulary words with:

* Word
* Meaning
* Translation

## Firebase

Collection: `vocabulary`

Example Document:

{
"word": "Apple",
"meaning": "A fruit",
"translation": "Manzana"
}

## Project Structure

flutter-app/

backend/

README.md

## Run Project

### Flutter App

flutter pub get

flutter run

### Backend

npm install

node server.js

## Estimated AI Contribution

UI Design Suggestions: 30%

Debugging & Error Resolution: 25%

Backend Structure Guidance: 20%

Architecture & Business Logic: Manual

Final Integration & Testing: Manual

## Demo

Demo Video: [Add Link Here]
