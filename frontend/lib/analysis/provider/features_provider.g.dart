// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$featureSegmentsHash() => r'e579def8077bd3e7a1b106f92a4d2f42b5cbbee9';

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
  late final int? max;

  FutureOr<List<Segment>> build({
    required ReportType report,
    int? max,
  });
}

/// See also [FeatureSegments].
@ProviderFor(FeatureSegments)
const featureSegmentsProvider = FeatureSegmentsFamily();

/// See also [FeatureSegments].
class FeatureSegmentsFamily extends Family<AsyncValue<List<Segment>>> {
  /// See also [FeatureSegments].
  const FeatureSegmentsFamily();

  /// See also [FeatureSegments].
  FeatureSegmentsProvider call({
    required ReportType report,
    int? max,
  }) {
    return FeatureSegmentsProvider(
      report: report,
      max: max,
    );
  }

  @override
  FeatureSegmentsProvider getProviderOverride(
    covariant FeatureSegmentsProvider provider,
  ) {
    return call(
      report: provider.report,
      max: provider.max,
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
  FeatureSegmentsProvider({
    required ReportType report,
    int? max,
  }) : this._internal(
          () => FeatureSegments()
            ..report = report
            ..max = max,
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
          max: max,
        );

  FeatureSegmentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.report,
    required this.max,
  }) : super.internal();

  final ReportType report;
  final int? max;

  @override
  FutureOr<List<Segment>> runNotifierBuild(
    covariant FeatureSegments notifier,
  ) {
    return notifier.build(
      report: report,
      max: max,
    );
  }

  @override
  Override overrideWith(FeatureSegments Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeatureSegmentsProvider._internal(
        () => create()
          ..report = report
          ..max = max,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        report: report,
        max: max,
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
    return other is FeatureSegmentsProvider &&
        other.report == report &&
        other.max == max;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, report.hashCode);
    hash = _SystemHash.combine(hash, max.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeatureSegmentsRef on AutoDisposeAsyncNotifierProviderRef<List<Segment>> {
  /// The parameter `report` of this provider.
  ReportType get report;

  /// The parameter `max` of this provider.
  int? get max;
}

class _FeatureSegmentsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FeatureSegments,
        List<Segment>> with FeatureSegmentsRef {
  _FeatureSegmentsProviderElement(super.provider);

  @override
  ReportType get report => (origin as FeatureSegmentsProvider).report;
  @override
  int? get max => (origin as FeatureSegmentsProvider).max;
}

String _$featureTuplesHash() => r'e21c1d44caac173eaddd710a713e4361accc1e9c';

abstract class _$FeatureTuples
    extends BuildlessAutoDisposeAsyncNotifier<List<Map<dynamic, dynamic>>> {
  late final ReportType report;
  late final int? max;

  FutureOr<List<Map<dynamic, dynamic>>> build({
    required ReportType report,
    int? max,
  });
}

/// See also [FeatureTuples].
@ProviderFor(FeatureTuples)
const featureTuplesProvider = FeatureTuplesFamily();

/// See also [FeatureTuples].
class FeatureTuplesFamily
    extends Family<AsyncValue<List<Map<dynamic, dynamic>>>> {
  /// See also [FeatureTuples].
  const FeatureTuplesFamily();

  /// See also [FeatureTuples].
  FeatureTuplesProvider call({
    required ReportType report,
    int? max,
  }) {
    return FeatureTuplesProvider(
      report: report,
      max: max,
    );
  }

  @override
  FeatureTuplesProvider getProviderOverride(
    covariant FeatureTuplesProvider provider,
  ) {
    return call(
      report: provider.report,
      max: provider.max,
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
  String? get name => r'featureTuplesProvider';
}

/// See also [FeatureTuples].
class FeatureTuplesProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FeatureTuples, List<Map<dynamic, dynamic>>> {
  /// See also [FeatureTuples].
  FeatureTuplesProvider({
    required ReportType report,
    int? max,
  }) : this._internal(
          () => FeatureTuples()
            ..report = report
            ..max = max,
          from: featureTuplesProvider,
          name: r'featureTuplesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$featureTuplesHash,
          dependencies: FeatureTuplesFamily._dependencies,
          allTransitiveDependencies:
              FeatureTuplesFamily._allTransitiveDependencies,
          report: report,
          max: max,
        );

  FeatureTuplesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.report,
    required this.max,
  }) : super.internal();

  final ReportType report;
  final int? max;

  @override
  FutureOr<List<Map<dynamic, dynamic>>> runNotifierBuild(
    covariant FeatureTuples notifier,
  ) {
    return notifier.build(
      report: report,
      max: max,
    );
  }

  @override
  Override overrideWith(FeatureTuples Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeatureTuplesProvider._internal(
        () => create()
          ..report = report
          ..max = max,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        report: report,
        max: max,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FeatureTuples,
      List<Map<dynamic, dynamic>>> createElement() {
    return _FeatureTuplesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeatureTuplesProvider &&
        other.report == report &&
        other.max == max;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, report.hashCode);
    hash = _SystemHash.combine(hash, max.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeatureTuplesRef
    on AutoDisposeAsyncNotifierProviderRef<List<Map<dynamic, dynamic>>> {
  /// The parameter `report` of this provider.
  ReportType get report;

  /// The parameter `max` of this provider.
  int? get max;
}

class _FeatureTuplesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FeatureTuples,
        List<Map<dynamic, dynamic>>> with FeatureTuplesRef {
  _FeatureTuplesProviderElement(super.provider);

  @override
  ReportType get report => (origin as FeatureTuplesProvider).report;
  @override
  int? get max => (origin as FeatureTuplesProvider).max;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
