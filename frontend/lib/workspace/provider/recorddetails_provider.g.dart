// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recorddetails_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recordDetailsHash() => r'cd64859c37acb7c058f398e901d3f413e61c5ca2';

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

abstract class _$RecordDetails
    extends BuildlessAutoDisposeAsyncNotifier<GetRecordResponse> {
  late final int item;

  FutureOr<GetRecordResponse> build(
    int item,
  );
}

/// See also [RecordDetails].
@ProviderFor(RecordDetails)
const recordDetailsProvider = RecordDetailsFamily();

/// See also [RecordDetails].
class RecordDetailsFamily extends Family<AsyncValue<GetRecordResponse>> {
  /// See also [RecordDetails].
  const RecordDetailsFamily();

  /// See also [RecordDetails].
  RecordDetailsProvider call(
    int item,
  ) {
    return RecordDetailsProvider(
      item,
    );
  }

  @override
  RecordDetailsProvider getProviderOverride(
    covariant RecordDetailsProvider provider,
  ) {
    return call(
      provider.item,
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
  String? get name => r'recordDetailsProvider';
}

/// See also [RecordDetails].
class RecordDetailsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RecordDetails, GetRecordResponse> {
  /// See also [RecordDetails].
  RecordDetailsProvider(
    int item,
  ) : this._internal(
          () => RecordDetails()..item = item,
          from: recordDetailsProvider,
          name: r'recordDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recordDetailsHash,
          dependencies: RecordDetailsFamily._dependencies,
          allTransitiveDependencies:
              RecordDetailsFamily._allTransitiveDependencies,
          item: item,
        );

  RecordDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.item,
  }) : super.internal();

  final int item;

  @override
  FutureOr<GetRecordResponse> runNotifierBuild(
    covariant RecordDetails notifier,
  ) {
    return notifier.build(
      item,
    );
  }

  @override
  Override overrideWith(RecordDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecordDetailsProvider._internal(
        () => create()..item = item,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        item: item,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RecordDetails, GetRecordResponse>
      createElement() {
    return _RecordDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecordDetailsProvider && other.item == item;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, item.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecordDetailsRef
    on AutoDisposeAsyncNotifierProviderRef<GetRecordResponse> {
  /// The parameter `item` of this provider.
  int get item;
}

class _RecordDetailsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RecordDetails,
        GetRecordResponse> with RecordDetailsRef {
  _RecordDetailsProviderElement(super.provider);

  @override
  int get item => (origin as RecordDetailsProvider).item;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
