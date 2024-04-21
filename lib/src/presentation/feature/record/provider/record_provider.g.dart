// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalRecordPageNumberHash() =>
    r'1fba7408a8c0769a066e7e0edf4a8d273a90c2ba';

/// See also [totalRecordPageNumber].
@ProviderFor(totalRecordPageNumber)
final totalRecordPageNumberProvider = AutoDisposeFutureProvider<int>.internal(
  totalRecordPageNumber,
  name: r'totalRecordPageNumberProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalRecordPageNumberHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TotalRecordPageNumberRef = AutoDisposeFutureProviderRef<int>;
String _$recordsHash() => r'4634cff9a135b7431cc5e3bdda5b7ff0cb695e9c';

/// See also [records].
@ProviderFor(records)
final recordsProvider =
    AutoDisposeFutureProvider<ResultList<RecordModel>>.internal(
  records,
  name: r'recordsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecordsRef = AutoDisposeFutureProviderRef<ResultList<RecordModel>>;
String _$successfulRecordHash() => r'70697af3c06c8a66977244a2a00c3690ea2dc4c8';

/// See also [successfulRecord].
@ProviderFor(successfulRecord)
final successfulRecordProvider =
    AutoDisposeFutureProvider<List<SuccessfulRecord>>.internal(
  successfulRecord,
  name: r'successfulRecordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$successfulRecordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SuccessfulRecordRef
    = AutoDisposeFutureProviderRef<List<SuccessfulRecord>>;
String _$recordPageNumberHash() => r'6c9a7683ee063a1d83bb92ce587f6f909bffb56b';

/// See also [RecordPageNumber].
@ProviderFor(RecordPageNumber)
final recordPageNumberProvider =
    AutoDisposeNotifierProvider<RecordPageNumber, int>.internal(
  RecordPageNumber.new,
  name: r'recordPageNumberProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recordPageNumberHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecordPageNumber = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
