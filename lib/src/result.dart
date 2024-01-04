/// A sealed class representing the result of an operation, which can be either a success or a failure.
///
/// [S] represents the type of the success value, and [F] represents the type of the failure value.
sealed class Result<S, F> {}

/// Represents a successful result with a value of type [S].
class Success<S, F> implements Result<S, F> {
  /// Constructs a [Success] instance with the specified [success] value.
  Success(this.success);
  
  /// The value representing the success result.
  final S success;
}

/// Represents a failure result with a value of type [F].
class Failure<S, F> implements Result<S, F> {
  /// Constructs a [Failure] instance with the specified [failure] value.
  Failure(this.failure);
  
  /// The value representing the failure result.
  final F failure;
}
