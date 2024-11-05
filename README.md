# Product Display App

A Flutter app that displays a list of products and provides a detailed view of each product. This app leverages **Clean Architecture**, **BLoC** for state management, **Firestore** for real-time pricing, and **SQLite (Sqflite)** for offline caching.

## Features

- **Product List**: View a list of products with essential information.
- **Product Details**: Get detailed information on selected products, including an image, description, and real-time price updates.
- **Real-Time Price**: Uses Firestore to display the product price in real-time, making sure users always see the latest price.
- **Offline Support**: Caches product data locally using SQLite, allowing users to view product information even without an internet connection.

## Tech Stack

- **Flutter**: Front-end framework for building cross-platform mobile applications.
- **Clean Architecture**: Follows the principles of Clean Architecture, allowing for separation of concerns, modularity, and easier testing.
- **BLoC (Business Logic Component)**: Used for state management, keeping UI components independent of business logic.
- **Firebase Firestore**: Used for real-time data, specifically for updating product prices.
- **Sqflite**: Local SQLite database for offline storage of product data.

## Project Structure

The project follows the **Clean Architecture** structure, which divides the codebase into three main layers:

1. **Data Layer**: Handles data sources (remote, local), repositories, and data models.
    - `data/models`: Defines data models for interacting with different data sources.
    - `data/datasources`: Contains local and remote data sources (Firestore for remote, SQLite for local).
    - `data/repositories`: Implements data repository classes that provide data to the domain layer.

2. **Domain Layer**: Contains business logic and use cases.
    - `domain/entities`: Defines core data models for use across the app.
    - `domain/repositories`: Abstract classes defining the contract for data sources.
    - `domain/usecases`: Business logic and operations.

3. **Presentation Layer**: Manages the UI and state.
    - `presentation/bloc`: Implements state management with BLoC for different features.
    - `presentation/screens`: UI screens for product list and product details.
    - `presentation/widgets`: Reusable UI components.

## Getting Started

### Prerequisites

- **Flutter**: Install Flutter SDK (>= 2.0.0).
- **Firebase**: Set up Firebase for the project by creating a Firebase project and enabling Firestore.

### Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/your-username/product-display-app.git
   cd product-display-app
