// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pocketBaseHash() => r'75e30fe5b61560052b90e3402a779af684eab0c6';

/// See also [pocketBase].
@ProviderFor(pocketBase)
final pocketBaseProvider = Provider<PocketBase>.internal(
  pocketBase,
  name: r'pocketBaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pocketBaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PocketBaseRef = ProviderRef<PocketBase>;
String _$isAuthHash() => r'268ad4af1043ac20eeed8a761c9aef87df11fa9e';

/// See also [isAuth].
@ProviderFor(isAuth)
final isAuthProvider = AutoDisposeProvider<bool>.internal(
  isAuth,
  name: r'isAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAuthRef = AutoDisposeProviderRef<bool>;
String _$verificationHash() => r'8e5bf491977e59f77fcabbdb0b7f4fe957d77811';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [verification].
@ProviderFor(verification)
const verificationProvider = VerificationFamily();

/// See also [verification].
class VerificationFamily extends Family<AsyncValue<void>> {
  /// See also [verification].
  const VerificationFamily();

  /// See also [verification].
  VerificationProvider call(
    String token,
  ) {
    return VerificationProvider(
      token,
    );
  }

  @override
  VerificationProvider getProviderOverride(
    covariant VerificationProvider provider,
  ) {
    return call(
      provider.token,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'verificationProvider';
}

/// See also [verification].
class VerificationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [verification].
  VerificationProvider(
    String token,
  ) : this._internal(
          (ref) => verification(
            ref as VerificationRef,
            token,
          ),
          from: verificationProvider,
          name: r'verificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verificationHash,
          dependencies: VerificationFamily._dependencies,
          allTransitiveDependencies:
              VerificationFamily._allTransitiveDependencies,
          token: token,
        );

  VerificationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    FutureOr<void> Function(VerificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerificationProvider._internal(
        (ref) => create(ref as VerificationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _VerificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerificationProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerificationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `token` of this provider.
  String get token;
}

class _VerificationProviderElement
    extends AutoDisposeFutureProviderElement<void> with VerificationRef {
  _VerificationProviderElement(super.provider);

  @override
  String get token => (origin as VerificationProvider).token;
}

String _$writeTokenHash() => r'b2a3373b251280de7717c818200e0778c53a556a';

/// See also [writeToken].
@ProviderFor(writeToken)
const writeTokenProvider = WriteTokenFamily();

/// See also [writeToken].
class WriteTokenFamily extends Family<AsyncValue<void>> {
  /// See also [writeToken].
  const WriteTokenFamily();

  /// See also [writeToken].
  WriteTokenProvider call(
    String token,
  ) {
    return WriteTokenProvider(
      token,
    );
  }

  @override
  WriteTokenProvider getProviderOverride(
    covariant WriteTokenProvider provider,
  ) {
    return call(
      provider.token,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'writeTokenProvider';
}

/// See also [writeToken].
class WriteTokenProvider extends AutoDisposeFutureProvider<void> {
  /// See also [writeToken].
  WriteTokenProvider(
    String token,
  ) : this._internal(
          (ref) => writeToken(
            ref as WriteTokenRef,
            token,
          ),
          from: writeTokenProvider,
          name: r'writeTokenProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$writeTokenHash,
          dependencies: WriteTokenFamily._dependencies,
          allTransitiveDependencies:
              WriteTokenFamily._allTransitiveDependencies,
          token: token,
        );

  WriteTokenProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    FutureOr<void> Function(WriteTokenRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WriteTokenProvider._internal(
        (ref) => create(ref as WriteTokenRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _WriteTokenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WriteTokenProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WriteTokenRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `token` of this provider.
  String get token;
}

class _WriteTokenProviderElement extends AutoDisposeFutureProviderElement<void>
    with WriteTokenRef {
  _WriteTokenProviderElement(super.provider);

  @override
  String get token => (origin as WriteTokenProvider).token;
}

String _$readTokenHash() => r'd85a7b5930ce977ef2b753b96049eec07191b9ce';

/// See also [readToken].
@ProviderFor(readToken)
final readTokenProvider = AutoDisposeFutureProvider<String?>.internal(
  readToken,
  name: r'readTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$readTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReadTokenRef = AutoDisposeFutureProviderRef<String?>;
String _$deleteTokenHash() => r'9901a3b76bbe6e56a686f9ec6b4ab7e47b1ab7a2';

/// See also [deleteToken].
@ProviderFor(deleteToken)
final deleteTokenProvider = AutoDisposeFutureProvider<void>.internal(
  deleteToken,
  name: r'deleteTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deleteTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeleteTokenRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
