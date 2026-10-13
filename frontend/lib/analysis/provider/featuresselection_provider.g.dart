// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featuresselection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$featuresSelectionHash() => r'35716e53edcdf1610db099563c6bcbaef6b6a95f';

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

abstract class _$FeaturesSelection extends BuildlessNotifier<Iterable<int>> {
  late final ReportType report;

  Iterable<int> build(
    ReportType report,
  );
}

/// See also [FeaturesSelection].
@ProviderFor(FeaturesSelection)
const featuresSelectionProvider = FeaturesSelectionFamily();

/// See also [FeaturesSelection].
class FeaturesSelectionFamily extends Family<Iterable<int>> {
  /// See also [FeaturesSelection].
  const FeaturesSelectionFamily();

  /// See also [FeaturesSelection].
  FeaturesSelectionProvider call(
    ReportType report,
  ) {
    return FeaturesSelectionProvider(
      report,
    );
  }

  @override
  FeaturesSelectionProvider getProviderOverride(
    covariant FeaturesSelectionProvider provider,
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
  String? get name => r'featuresSelectionProvider';
}

/// See also [FeaturesSelection].
class FeaturesSelectionProvider
    extends NotifierProviderImpl<FeaturesSelection, Iterable<int>> {
  /// See also [FeaturesSelection].
  FeaturesSelectionProvider(
    ReportType report,
  ) : this._internal(
          () => FeaturesSelection()..report = report,
          from: featuresSelectionProvider,
          name: r'featuresSelectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$featuresSelectionHash,
          dependencies: FeaturesSelectionFamily._dependencies,
          allTransitiveDependencies:
              FeaturesSelectionFamily._allTransitiveDependencies,
          report: report,
        );

  FeaturesSelectionProvider._internal(
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
  Iterable<int> runNotifierBuild(
    covariant FeaturesSelection notifier,
  ) {
    return notifier.build(
      report,
    );
  }

  @override
  Override overrideWith(FeaturesSelection Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeaturesSelectionProvider._internal(
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
  NotifierProviderElement<FeaturesSelection, Iterable<int>> createElement() {
    return _FeaturesSelectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeaturesSelectionProvider && other.report == report;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, report.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeaturesSelectionRef on NotifierProviderRef<Iterable<int>> {
  /// The parameter `report` of this provider.
  ReportType get report;
}

class _FeaturesSelectionProviderElement
    extends NotifierProviderElement<FeaturesSelection, Iterable<int>>
    with FeaturesSelectionRef {
  _FeaturesSelectionProviderElement(super.provider);

  @override
  ReportType get report => (origin as FeaturesSelectionProvider).report;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
