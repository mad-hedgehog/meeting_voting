// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosHash() => r'354334e46e1ebdff413103dd3b8e3ac75b4502e1';

/// See also [todos].
@ProviderFor(todos)
final todosProvider = AutoDisposeFutureProvider<List<Todo>>.internal(
  todos,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodosRef = AutoDisposeFutureProviderRef<List<Todo>>;
String _$postVoteHash() => r'cc7bfd260ebbde2964ecfa256e9cd74104702494';

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

/// See also [postVote].
@ProviderFor(postVote)
const postVoteProvider = PostVoteFamily();

/// See also [postVote].
class PostVoteFamily extends Family<AsyncValue<void>> {
  /// See also [postVote].
  const PostVoteFamily();

  /// See also [postVote].
  PostVoteProvider call(
    List<String> todoIds,
    DateTime dateTime,
  ) {
    return PostVoteProvider(
      todoIds,
      dateTime,
    );
  }

  @override
  PostVoteProvider getProviderOverride(
    covariant PostVoteProvider provider,
  ) {
    return call(
      provider.todoIds,
      provider.dateTime,
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
  String? get name => r'postVoteProvider';
}

/// See also [postVote].
class PostVoteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [postVote].
  PostVoteProvider(
    List<String> todoIds,
    DateTime dateTime,
  ) : this._internal(
          (ref) => postVote(
            ref as PostVoteRef,
            todoIds,
            dateTime,
          ),
          from: postVoteProvider,
          name: r'postVoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postVoteHash,
          dependencies: PostVoteFamily._dependencies,
          allTransitiveDependencies: PostVoteFamily._allTransitiveDependencies,
          todoIds: todoIds,
          dateTime: dateTime,
        );

  PostVoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todoIds,
    required this.dateTime,
  }) : super.internal();

  final List<String> todoIds;
  final DateTime dateTime;

  @override
  Override overrideWith(
    FutureOr<void> Function(PostVoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostVoteProvider._internal(
        (ref) => create(ref as PostVoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        todoIds: todoIds,
        dateTime: dateTime,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PostVoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostVoteProvider &&
        other.todoIds == todoIds &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, todoIds.hashCode);
    hash = _SystemHash.combine(hash, dateTime.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostVoteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `todoIds` of this provider.
  List<String> get todoIds;

  /// The parameter `dateTime` of this provider.
  DateTime get dateTime;
}

class _PostVoteProviderElement extends AutoDisposeFutureProviderElement<void>
    with PostVoteRef {
  _PostVoteProviderElement(super.provider);

  @override
  List<String> get todoIds => (origin as PostVoteProvider).todoIds;
  @override
  DateTime get dateTime => (origin as PostVoteProvider).dateTime;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
