// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$featureSegmentsHash() => r'72bf07ba787afb23b1839b0d9b5e9f109f11d79f';

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

abstract class _$FeatureSegments
    extends BuildlessAutoDisposeAsyncNotifier<List<Segment>> {
  late final ReportType report;

  FutureOr<List<Segment>> build(
    ReportType report,
  );
}

/// See also [FeatureSegments].
@ProviderFor(FeatureSegments)
const featureSegmentsProvider = FeatureSegmentsFamily();

/// See also [FeatureSegments].
class FeatureSegmentsFamily extends Family<AsyncValue<List<Segment>>> {
  /// See also [FeatureSegments].
  const FeatureSegmentsFamily();

  /// See also [FeatureSegments].
  FeatureSegmentsProvider call(
    ReportType report,
  ) {
    return FeatureSegmentsProvider(
      report,
    );
  }

  @override
  FeatureSegmentsProvider getProviderOverride(
    covariant FeatureSegmentsProvider provider,
  ) {
    return call(
      provider.report,
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
  String? get name => r'featureSegmentsProvider';
}

/// See also [FeatureSegments].
class FeatureSegmentsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FeatureSegments, List<Segment>> {
  /// See also [FeatureSegments].
  FeatureSegmentsProvider(
    ReportType report,
  ) : this._internal(
          () => FeatureSegments()..report = report,
          from: featureSegmentsProvider,
          name: r'featureSegmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$featureSegmentsHash,
          dependencies: FeatureSegmentsFamily._dependencies,
          allTransitiveDependencies:
              FeatureSegmentsFamily._allTransitiveDependencies,
          report: report,
        );

  FeatureSegmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.report,
  }) : super.internal();

  final ReportType report;

  @override
  FutureOr<List<Segment>> runNotifierBuild(
    covariant FeatureSegments notifier,
  ) {
    return notifier.build(
      report,
    );
  }

  @override
  Override overrideWith(FeatureSegments Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeatureSegmentsProvider._internal(
        () => create()..report = report,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        report: report,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FeatureSegments, List<Segment>>
      createElement() {
    return _FeatureSegmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeatureSegmentsProvider && other.report == report;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, report.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeatureSegmentsRef on AutoDisposeAsyncNotifierProviderRef<List<Segment>> {
  /// The parameter `report` of this provider.
  ReportType get report;
}

class _FeatureSegmentsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FeatureSegments,
        List<Segment>> with FeatureSegmentsRef {
  _FeatureSegmentsProviderElement(super.provider);

  @override
  ReportType get report => (origin as FeatureSegmentsProvider).report;
}

String _$featuresHash() => r'a4f397da7b9e89fac3a3334130185a0d14f5d859';

abstract class _$Features
    extends BuildlessAutoDisposeAsyncNotifier<List<Map<dynamic, dynamic>>> {
  late final ReportType report;

  FutureOr<List<Map<dynamic, dynamic>>> build(
    ReportType report,
  );
}

/// See also [Features].
@ProviderFor(Features)
const featuresProvider = FeaturesFamily();

/// See also [Features].
class FeaturesFamily extends Family<AsyncValue<List<Map<dynamic, dynamic>>>> {
  /// See also [Features].
  const FeaturesFamily();

  /// See also [Features].
  FeaturesProvider call(
    ReportType report,
  ) {
    return FeaturesProvider(
      report,
    );
  }

  @override
  FeaturesProvider getProviderOverride(
    covariant FeaturesProvider provider,
  ) {
    return call(
      provider.report,
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
  String? get name => r'featuresProvider';
}

/// See also [Features].
class FeaturesProvider extends AutoDisposeAsyncNotifierProviderImpl<Features,
    List<Map<dynamic, dynamic>>> {
  /// See also [Features].
  FeaturesProvider(
    ReportType report,
  ) : this._internal(
          () => Features()..report = report,
          from: featuresProvider,
          name: r'featuresProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$featuresHash,
          dependencies: FeaturesFamily._dependencies,
          allTransitiveDependencies: FeaturesFamily._allTransitiveDependencies,
          report: report,
        );

  FeaturesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.report,
  }) : super.internal();

  final ReportType report;

  @override
  FutureOr<List<Map<dynamic, dynamic>>> runNotifierBuild(
    covariant Features notifier,
  ) {
    return notifier.build(
      report,
    );
  }

  @override
  Override overrideWith(Features Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeaturesProvider._internal(
        () => create()..report = report,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        report: report,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Features, List<Map<dynamic, dynamic>>>
      createElement() {
    return _FeaturesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeaturesProvider && other.report == report;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, report.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeaturesRef
    on AutoDisposeAsyncNotifierProviderRef<List<Map<dynamic, dynamic>>> {
  /// The parameter `report` of this provider.
  ReportType get report;
}

class _FeaturesProviderElement extends AutoDisposeAsyncNotifierProviderElement<
    Features, List<Map<dynamic, dynamic>>> with FeaturesRef {
  _FeaturesProviderElement(super.provider);

  @override
  ReportType get report => (origin as FeaturesProvider).report;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
