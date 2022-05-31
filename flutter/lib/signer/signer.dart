import 'dart:typed_data';
import 'package:blockchain_mobile_signer/signer/response/signed_result.dart';

/// Basic Signer that provides developers with signing interfaces for any blockchain.
/// This is not yet the final version yet. Anything would be subjected to change
///
abstract class Signer {

  Future<SignedResult> sign(String op, Uint8List bytes);

  String? get publicKey;
  String? get address;
  String? get secretKey;

// <Bool>verifySignature
}

