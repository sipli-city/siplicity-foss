// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$featuresHash() => r'd5a73d2ca05ed5e983bdc9cf9233a2655cf1c9e9';

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

abstract class _$Features
    extends BuildlessAutoDisposeAsyncNotifier<PreparedFeatureCountResponse> {
  late final ReportType report;
  late final int? max;

  FutureOr<PreparedFeatureCountResponse> build({
    required ReportType report,
    int? max,
  });
}

/// See also [Features].
@ProviderFor(Features)
const featuresProvider = FeaturesFamily();

/// See also [Features].
class FeaturesFamily extends Family<AsyncValue<PreparedFeatureCountResponse>> {
  /// See also [Features].
  const FeaturesFamily();

  /// See also [Features].
  FeaturesProvider call({
    required ReportType report,
    int? max,
  }) {
    return FeaturesProvider(
      report: report,
      max: max,
    );
  }

  @override
  FeaturesProvider getProviderOverride(
    covariant FeaturesProvider provider,
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
  String? get name => r'featuresProvider';
}

/// See also [Features].
class FeaturesProvider extends AutoDisposeAsyncNotifierProviderImpl<Features,
    PreparedFeatureCountResponse> {
  /// See also [Features].
  FeaturesProvider({
    required ReportType report,
    int? max,
  }) : this._internal(
          () => Features()
            ..report = report
            ..max = max,
          from: featuresProvider,
          name: r'featuresProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$featuresHash,
          dependencies: FeaturesFamily._dependencies,
          allTransitiveDependencies: FeaturesFamily._allTransitiveDependencies,
          report: report,
          max: max,
        );

  FeaturesProvider._internal(
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
  FutureOr<PreparedFeatureCountResponse> runNotifierBuild(
    covariant Features notifier,
  ) {
    return notifier.build(
      report: report,
      max: max,
    );
  }

  @override
  Override overrideWith(Features Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeaturesProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<Features,
      PreparedFeatureCountResponse> createElement() {
    return _FeaturesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeaturesProvider &&
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

mixin FeaturesRef
    on AutoDisposeAsyncNotifierProviderRef<PreparedFeatureCountResponse> {
  /// The parameter `report` of this provider.
  ReportType get report;

  /// The parameter `max` of this provider.
  int? get max;
}

class _FeaturesProviderElement extends AutoDisposeAsyncNotifierProviderElement<
    Features, PreparedFeatureCountResponse> with FeaturesRef {
  _FeaturesProviderElement(super.provider);

  @override
  ReportType get report => (origin as FeaturesProvider).report;
  @override
  int? get max => (origin as FeaturesProvider).max;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
