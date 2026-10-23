import 'package:grpc/grpc.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pbgrpc.dart';

final siplicityServiceClient = SiplicityServiceClient(
  ClientChannel(
    'localhost',
    port: 51911,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  ),
);
