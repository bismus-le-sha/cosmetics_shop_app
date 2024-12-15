import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/mockito.dart';
import 'package:shop/core/util/network.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnection internetConnection;

  setUp(() {
    internetConnection = MockInternetConnection();
    networkInfoImpl = NetworkInfoImpl(internetConnection);
  });

  group('isConnected', () {
    test('should forward the call to InternetConnection.hasInternetAccess',
        () async {
      //arrange
      final testHasInternetAccess = Future.value(true);
      when(internetConnection.hasInternetAccess)
          .thenAnswer((realInvocation) => testHasInternetAccess);
      //act
      final result = networkInfoImpl.isConnected;
      //assert
      verify(internetConnection.hasInternetAccess);
      expect(result, testHasInternetAccess);
    });
  });

  group('onConnectivityChanged', () {
    test(
        'should forward the call to InternetConnectionCheckerPlus.onStatusChange',
        () async {
      // arrange
      final testStream = Stream<InternetStatus>.fromIterable([
        InternetStatus.connected,
        InternetStatus.disconnected,
      ]);
      when(internetConnection.onStatusChange).thenAnswer((_) => testStream);

      // act
      final result = networkInfoImpl.onConnectivityChanged;

      // assert
      verify(internetConnection.onStatusChange);
      expect(
          result,
          emitsInOrder(
              [InternetStatus.connected, InternetStatus.disconnected]));
    });
  });
}
