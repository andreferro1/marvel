import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class BiometricsLogin {
  final localAuth = LocalAuthentication();

  Future<bool> auth() async {
    const iosStrings = const IOSAuthMessages(
        cancelButton: 'cancel',
        goToSettingsButton: 'settings',
        goToSettingsDescription: 'Please set up your Touch ID.',
        lockOut: 'Please reenable your Touch ID');

    const androidStrings = const AndroidAuthMessages(
      signInTitle: 'Biometric',
      cancelButton: 'Cancel',
      fingerprintHint: 'Fingerprint sensor',
      goToSettingsButton: 'Settings',
      goToSettingsDescription: 'Please authenticate with your fingerprint!!',
    );

    return await localAuth.authenticateWithBiometrics(
        localizedReason: 'Please authenticate with your fingerprint!',
        useErrorDialogs: false,
        iOSAuthStrings: iosStrings,
        androidAuthStrings: androidStrings);
  }

  Future<bool> isBiometricsAuth() => localAuth.canCheckBiometrics;

  Future<bool> containBiometric() async {
    final localAuth = LocalAuthentication();
    List<BiometricType> availableBiometrics =
        await localAuth.getAvailableBiometrics();

    if (availableBiometrics.contains(BiometricType.face) ||
        availableBiometrics.contains(BiometricType.fingerprint)) {
      return true;
    }
    return false;
  }
}
