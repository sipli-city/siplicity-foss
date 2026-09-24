// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recordsHash() => r'8a6d7bf8d0461cfc10d4c782c0ce494adb893479';

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

abstract class _$Records
    extends BuildlessAutoDisposeAsyncNotifier<List<TreeViewItem>> {
  late final bool output;

  FutureOr<List<TreeViewItem>> build(
    bool output,
  );
}

/// See also [Records].
@ProviderFor(Records)
const recordsProvider = RecordsFamily();

/// See also [Records].
class RecordsFamily extends Family<AsyncValue<List<TreeViewItem>>> {
  /// See also [Records].
  const RecordsFamily();

  /// See also [Records].
  RecordsProvider call(
    bool output,
  ) {
    return RecordsProvider(
      output,
    );
  }

  @override
  RecordsProvider getProviderOverride(
    covariant RecordsProvider provider,
  ) {
    return call(
      provider.output,
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
  String? get name => r'recordsProvider';
}

/// See also [Records].
class RecordsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Records, List<TreeViewItem>> {
  /// See also [Records].
  RecordsProvider(
    bool output,
  ) : this._internal(
          () => Records()..output = output,
          from: recordsProvider,
          name: r'recordsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recordsHash,
          dependencies: RecordsFamily._dependencies,
          allTransitiveDependencies: RecordsFamily._allTransitiveDependencies,
          output: output,
        );

  RecordsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.output,
  }) : super.internal();

  final bool output;

  @override
  FutureOr<List<TreeViewItem>> runNotifierBuild(
    covariant Records notifier,
  ) {
    return notifier.build(
      output,
    );
  }

  @override
  Override overrideWith(Records Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecordsProvider._internal(
        () => create()..output = output,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        output: output,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Records, List<TreeViewItem>>
      createElement() {
    return _RecordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecordsProvider && other.output == output;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, output.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecordsRef on AutoDisposeAsyncNotifierProviderRef<List<TreeViewItem>> {
  /// The parameter `output` of this provider.
  bool get output;
}

class _RecordsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Records, List<TreeViewItem>>
    with RecordsRef {
  _RecordsProviderElement(super.provider);

  @override
  bool get output => (origin as RecordsProvider).output;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
