import 'package:grpc/grpc.dart';
import 'package:siplicity/gen/siplicity/v1/siplicity.pbgrpc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'constants.g.dart';

@riverpod
SiplicityServiceClient siplicityClient(SiplicityClientRef ref) {
  return SiplicityServiceClient(
    ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    ),
  );
}
