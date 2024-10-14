// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queryRecordsHash() => r'9bc63aa96663f9f82e5ecd60778e923a0e68de62';

/// See also [QueryRecords].
@ProviderFor(QueryRecords)
final queryRecordsProvider =
    AutoDisposeNotifierProvider<QueryRecords, String?>.internal(
  QueryRecords.new,
  name: r'queryRecordsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$queryRecordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$QueryRecords = AutoDisposeNotifier<String?>;
String _$inputRecordsHash() => r'783ff9017cd6acd49e2184a0ee1a89c7d5b15aad';

/// See also [InputRecords].
@ProviderFor(InputRecords)
final inputRecordsProvider =
    AutoDisposeAsyncNotifierProvider<InputRecords, List<TreeViewItem>>.internal(
  InputRecords.new,
  name: r'inputRecordsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$inputRecordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InputRecords = AutoDisposeAsyncNotifier<List<TreeViewItem>>;
String _$outputRecordsHash() => r'f535a5ee861c496e1df19fc1570d601094a85132';

/// See also [OutputRecords].
@ProviderFor(OutputRecords)
final outputRecordsProvider = AutoDisposeAsyncNotifierProvider<OutputRecords,
    List<TreeViewItem>>.internal(
  OutputRecords.new,
  name: r'outputRecordsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$outputRecordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OutputRecords = AutoDisposeAsyncNotifier<List<TreeViewItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
