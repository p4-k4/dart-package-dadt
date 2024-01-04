/// A sealed class representing a boolean value in a type-safe manner.
///
/// Use [Boolean.from] factory method to create an instance based on a boolean value.
/// It returns an instance of [True] if the input boolean is true, and [False] otherwise.
sealed class Boolean {
  /// Constructs a [Boolean] instance based on the provided boolean value.
  ///
  /// If [boolean] is true, it returns an instance of [True]; otherwise, it returns [False].
  factory Boolean.from(bool boolean) => boolean ? True() : False();
}

/// Represents the true boolean value.
class True implements Boolean {
  const True();
}

/// Represents the false boolean value.
class False implements Boolean {
  const False();
}
