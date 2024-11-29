# Smart Forms Flutter App

Smart Forms is a customizable form builder application that allows users to create forms with various field types. The application leverages Flutter's powerful UI capabilities and GetX for state management. The app is designed with scalability and maintainability in mind.

## Table of Contents

- [Architecture](#architecture)
- [Folder Structure](#folder-structure)
- [Good Practices](#good-practices)
- [Why not bindings](#why-not-bindings)
- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Contributing](#contributing)



## Architecture

The architecture of the Smart Forms app follows the **MVVM like(Model-View-ViewModel)** pattern combined with **GetX** for state management. This allows for clear separation of concerns, making the app easy to scale and maintain.

### Key Architectural Components:

- **Model**: Represents the data structure of the form fields, their types, and other configurations.
- **View**: Contains the UI components responsible for rendering the interface and interacting with the user.
- **Controller (GetX)**: Handles state changes and business logic. The controller communicates between the ViewModel and View and updates the UI based on state changes.
- **Factories**: Handles the creation of objects or widgets based on the data received from the controller.

## Folder Structure


```
├── constants.dart
├── main.dart
├── models
│   ├── field_type.dart
│   ├── form_field.dart
│   ├── form_fields
│   │   ├── checkbox_group_form_field_model.dart
│   │   ├── dropdown_form_field_model.dart
│   │   └── form_text_field_model.dart
│   └── form_model.dart
└── presentation
    ├── components
    │   ├── buttons.dart
    │   ├── checkbox_group.dart
    │   ├── components.dart
    │   ├── dashed_input_list_item.dart
    │   ├── draggable_input.dart
    │   ├── dropdown.dart
    │   ├── dropdown_field_configs.dart
    │   ├── notch_area.dart
    │   ├── selectable_icon.dart
    │   ├── text.dart
    │   ├── text_field.dart
    │   └── ui_constants.dart
    ├── factories
    │   ├── form_field_factory.dart
    │   └── form_field_to_widget_factory.dart
    └── pages
        ├── add_field
        │   ├── add_field_page.dart
        │   ├── add_field_page_controller.dart
        │   ├── field_type_selector.dart
        │   ├── options_list_manager.dart
        │   └── text_option_selector.dart
        ├── form_list_page
        │   ├── form_list_page.dart
        │   └── form_list_page_controller.dart
        ├── form_page
        │   ├── form_field_list.dart
        │   ├── form_field_list_item.dart
        │   ├── form_page.dart
        │   ├── form_page_action_button.dart
        │   └── form_page_controller.dart
        ├── form_preview_page
        │   └── form_preview_page.dart
        ├── new_form_page
        │   └── new_form_page.dart
        └── opening_page
            └── opening_page.dart
```

### Explanation of Key Folders:
#### Root Files
- **`constants.dart`**: Contains global constants used across the project, such as default values, colors, icons, and styles.
- **`main.dart`**: The entry point of the application, responsible for initializing the app and its main widget tree.


- **`components/`**: This folder contains reusable UI elements like buttons, form fields, and custom widgets. Components are small, self-contained, and easily testable.

- **`models/`**: This folder holds all the data structures used throughout the app. For instance, the `form_field.dart` model defines the structure of a form field. For escalability, the models have more delegations than holding the data. Our `FormField` model have also the responsibility of handling the initialization of its corresponding data to the view_controller. **This was made this way to hold in a single place most of the information needed to handle the field logically. This way it becomes more readable and easier to maintain and scale. e.g. Add more types of field. I also used other techniques to apply SOLID principles and keep the code clean easier to scale.**

**It is also possible to extract this delegation to a separate class, but I think it was just a matter of time to do it.**

- **pages**: The UI components that represent the different pages or screens in the app. Views are connected to the controllers and display the data they manage. For sake of scalability, I decided to create a new folder for each page/view. This way, it's easier to navigate and find the files you need to deal with when scaling or maintaining a certain view.

## Good Practices
1. **Modular Structure**: The project is divided into logical layers (e.g., models, presentation) for maintainability and scalability.
2. **Reusable Components**: UI components are centralized under `components`, ensuring consistency and reducing code duplication.
3. **Factory Pattern**: Factories dynamically generate objects or widgets, reducing conditional logic in the main codebase.
4. **State Management**: Controllers (e.g., `add_field_page_controller.dart`) manage the business logic and state for corresponding UI pages.
5. **Separation of Concerns**: Clear distinction between business logic (in `models`), controllers (in `*_controller.dart` files), and views (in `pages`).
6. **Naming Conventions**: Clear and descriptive names are used for files, classes, and variables to make the code easy to understand.
7. **Comments and Documentation**: Complex logic and functions are well-documented to ensure future developers can easily understand and extend the app.
8. **Reactive State Management**: GetX is used for managing the state of the app. Observables (Rx) are used to manage data, and GetX's dependency injection system ensures that controllers are accessible throughout the app without the need for context.

9. **Unit Tests**: Each controller, model, and service can be independently unit tested. By isolating logic in controllers, it's easy to write tests for each component.

10. **Scalable Form Builder**: The form builder component is built to handle multiple field types (`text`, `dropdown`, `checkbox`, etc.) with the ability to add new field types in the future.


## Why not bindings?

In this project, the  structure already establishes a clear separation of concerns between models, controllers, and presentation layers, which reduces the need for an additional abstraction like GetX bindings. (Im aware that the form models have more responsibilities, that was a development decision explained previously). GetX bindings, while convenient for small projects or straightforward state management, can obscure the flow of dependency initialization, making debugging and testing more challenging in a complex application like this. By avoiding bindings, we prioritize a more transparent architecture.

## Getting Started

### Prerequisites

Ensure that you have the following installed:

- Flutter SDK (latest stable version)
- Dart SDK
- An IDE (VS Code, Android Studio, etc.)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-repository/smart-forms.git
   ```
2. Navigate to the project directory:

    ```bash
    cd smart-forms
    ```
3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app:

    ```bash
    flutter run
    ```
