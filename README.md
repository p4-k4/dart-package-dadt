# Dart Functional Utilities

This Dart package provides a set of functional programming utilities to handle common patterns such as optional values, boolean algebra, and result handling. It leverages Dart's strong typing to provide a type-safe and expressive way to handle these scenarios.

## Why Use This Package?

- **Type Safety:** Leverage Dart's strong typing to ensure that your code is type-safe and catches errors at compile-time.

- **Functional Patterns:** Implement common functional programming patterns such as sealed classes, optional values, and result handling.

- **Expressive API:** Write clear and expressive code using sealed classes and functional constructs to represent various scenarios in your application.

## Features

### Sealed Class: Boolean

The `Boolean` sealed class provides a type-safe representation of boolean values. It includes two subclasses, `True` and `False`, allowing for expressive handling of boolean logic.

#### Example:

```dart
final result = Boolean.from(true);
if (result is True) {
  print("It's true!");
} else if (result is False) {
  print("It's false!");
}
```

### Sealed Class: Option

The `Option` sealed class represents an optional value. It includes two subclasses, `Some` for non-null values and `None` for null or absent values.

#### Example:

```dart
final option = Option.from("Hello, World!");
if (option is Some<String>) {
  print("Value: ${option.value}");
} else if (option is None<String>) {
  print("No value present.");
}
```

### Sealed Class: Result

The `Result` sealed class represents the result of an operation, with subclasses `Success` and `Failure`. It allows for clear and type-safe handling of success and failure scenarios.

#### Example:

```dart
final result = Success<int, String>(42);
if (result is Success<int, String>) {
  print("Success: ${result.success}");
} else if (result is Failure<int, String>) {
  print("Failure: ${result.failure}");
}
```

### FutureResult

The `FutureResult` class combines the future pattern with result handling, providing an easy way to represent asynchronous operations that may succeed or fail.

#### Example:

```dart
final futureResult = FutureResult<int, String>(
  () => Future.delayed(Duration(seconds: 2), () => 42),
  (error, stackTrace) => "Error occurred: $error",
);

final result = await futureResult.run;
print(result); // Success or Failure
```

## Installation

Add this package to your `pubspec.yaml` file:

```yaml
dependencies:
  functional_utilities: ^1.0.0
```

Then run:

```bash
dart pub get
```

## Contributing

Feel free to open issues, submit pull requests, or suggest new features. We appreciate your contributions!

## License

This Dart package is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
