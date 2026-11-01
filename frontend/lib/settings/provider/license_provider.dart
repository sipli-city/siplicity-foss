import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'license_provider.g.dart';

@riverpod
class License extends _$License {
  @override
  Future<(bool, String, String, String)> build() async {
    GetLicensedResponse resp =
        await siplicityServiceClient.getLicensed(GetLicensedRequest());
    return (resp.success, resp.message, resp.key, resp.license);
  }

  Future<void> putLicense(String key, String license) async {
    await siplicityServiceClient
        .putLicense(PutLicenseRequest(key: key, license: license));
    ref.invalidateSelf();
  }
}
