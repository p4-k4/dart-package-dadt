/// A sealed class representing an optional value in a type-safe manner.
///
/// Use the [Option.from] factory method to create an instance based on a value.
/// It returns an instance of [Some] if the input value is non-null, and [None] otherwise.
sealed class Option<T> {
  /// Constructs an [Option] instance based on the provided value.
  ///
  /// If [value] is non-null, it returns an instance of [Some]; otherwise, it returns [None].
  factory Option.from(T value) => value != null ? Some<T>(value) : None<T>();
}

/// Represents a non-null value in the optional context.
class Some<T> implements Option<T> {
  /// Constructs a [Some] instance with the specified [value].
  Some(this.value);
  
  /// The non-null value wrapped by this [Some] instance.
  final T value;
}

/// Represents a null or absent value in the optional context.
class None<T> implements Option<T> {}
