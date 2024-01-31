/// A typedef representing an asynchronous result that can either be a [Success] or a [Failure].
///
/// It is defined as a [Future] containing a [Result]
typedef AsyncResult<S, F> = Future<Result<S, F>>;

/// Represents a result that can either be a [Success] or a [Failure].
///
/// This class is abstract and cannot be instantiated directly.
sealed class Result<S, F> {
  /// Creates a [Result] instance based on the value of [s].
  ///
  /// If [s] is not [null], returns a [Success] instance with the provided value.
  /// Otherwise, returns a [Failure] instance with the provided failure value [f].
  factory Result.fromNullable(S? s, F f) => s != null ? Success(s) : Null(f);

  /// Considers a succesful [Result] that is null as [Failure].
  static AsyncResult<S?, F> fromFuture<S, F>({
    required Future<S?> Function() future,
    required F f,
    bool failNullValues = true,
  }) async {
    try {
      final result = await future();
      if (result == null) {
        if (failNullValues) {
          return Failure(f);
        } else {
          return Success(result);
        }
      } else {
        return Success(result);
      }
    } catch (e, s) {
      return Error(f, e, s);
    }
  }
}

class Null<S, F> implements Result<S, F> {
  Null(this.n);
  final F n;
}

/// Represents a successful result with a value of type [S].
class Success<S, F> implements Result<S, F> {
  /// Creates a [Success] instance with the provided value [s].
  Success(this.s);

  /// The value of the successful result.
  final S s;
}

/// Represents a failed result with a failure value of type [F].
class Failure<S, F> implements Result<S, F> {
  /// Creates a [Failure] instance with the provided failure value [f].
  Failure(this.f);

  /// The failure value.
  final F f;
}

/// Represents an error result with a failure value of type [F], an error object, and a stack trace.
class Error<S, F> implements Result<S, F> {
  /// Creates an [Error] instance with the provided failure value [f], error object [e], and stack trace [s].
  Error(this.f, this.e, this.s);

  /// The failure value.
  final F f;

  /// The error object associated with the error result.
  final Object e;

  /// The stack trace associated with the error result.
  final StackTrace s;
}
