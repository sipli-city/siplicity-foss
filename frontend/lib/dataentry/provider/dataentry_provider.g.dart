// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataentry_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countEntriesHash() => r'a7d9cc48ef55977358ebbd3c43270bad7772e6b8';

/// See also [countEntries].
@ProviderFor(countEntries)
final countEntriesProvider = AutoDisposeFutureProvider<int>.internal(
  countEntries,
  name: r'countEntriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countEntriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountEntriesRef = AutoDisposeFutureProviderRef<int>;
String _$dataEntryHash() => r'c5fd254d55ae829028f4b16702bdfaf48e08794c';

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

abstract class _$DataEntry
    extends BuildlessAutoDisposeAsyncNotifier<List<(int, List<String>)>> {
  late final int page;

  FutureOr<List<(int, List<String>)>> build(
    int page,
  );
}

/// See also [DataEntry].
@ProviderFor(DataEntry)
const dataEntryProvider = DataEntryFamily();

/// See also [DataEntry].
class DataEntryFamily extends Family<AsyncValue<List<(int, List<String>)>>> {
  /// See also [DataEntry].
  const DataEntryFamily();

  /// See also [DataEntry].
  DataEntryProvider call(
    int page,
  ) {
    return DataEntryProvider(
      page,
    );
  }

  @override
  DataEntryProvider getProviderOverride(
    covariant DataEntryProvider provider,
  ) {
    return call(
      provider.page,
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
  String? get name => r'dataEntryProvider';
}

/// See also [DataEntry].
class DataEntryProvider extends AutoDisposeAsyncNotifierProviderImpl<DataEntry,
    List<(int, List<String>)>> {
  /// See also [DataEntry].
  DataEntryProvider(
    int page,
  ) : this._internal(
          () => DataEntry()..page = page,
          from: dataEntryProvider,
          name: r'dataEntryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dataEntryHash,
          dependencies: DataEntryFamily._dependencies,
          allTransitiveDependencies: DataEntryFamily._allTransitiveDependencies,
          page: page,
        );

  DataEntryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  FutureOr<List<(int, List<String>)>> runNotifierBuild(
    covariant DataEntry notifier,
  ) {
    return notifier.build(
      page,
    );
  }

  @override
  Override overrideWith(DataEntry Function() create) {
    return ProviderOverride(
      origin: this,
      override: DataEntryProvider._internal(
        () => create()..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DataEntry, List<(int, List<String>)>>
      createElement() {
    return _DataEntryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DataEntryProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DataEntryRef
    on AutoDisposeAsyncNotifierProviderRef<List<(int, List<String>)>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _DataEntryProviderElement extends AutoDisposeAsyncNotifierProviderElement<
    DataEntry, List<(int, List<String>)>> with DataEntryRef {
  _DataEntryProviderElement(super.provider);

  @override
  int get page => (origin as DataEntryProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
