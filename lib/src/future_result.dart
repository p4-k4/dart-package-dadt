import 'package:dadt/src/result.dart';

/// Represents a future-based result, which can either be a success or a failure.
///
/// [S] represents the type of the success value, and [F] represents the type of the failure value.
class FutureResult<S, F> {
  /// Constructs a [FutureResult] instance with a [future] function and an [onError] callback.
  ///
  /// The [future] function should return a [Future] representing the asynchronous operation,
  /// and [onError] is a callback to handle errors and convert them into a failure value.
  FutureResult(this.future, this.onError);

  /// The function returning a [Future] representing the asynchronous operation.
  final Future<S> Function() future;

  /// The callback to handle errors and convert them into a failure value.
  final F Function(Object e, StackTrace s) onError;

  /// Executes the asynchronous operation represented by the [future] function and returns
  /// a [Result] indicating success with a value of type [S] or failure with a value of type [F].
  ///
  /// If the asynchronous operation completes successfully, it returns a [Success] instance.
  /// If an error occurs, it catches the error, invokes [onError] callback, and returns a [Failure] instance.
  Future<Result<S, F>> get run async {
    try {
      final result = await future();
      return Success<S, F>(result);
    } catch (e, s) {
      return Failure<S, F>(onError(e, s));
    }
  }
}
