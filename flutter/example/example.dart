// Copyright (c), Magic Labs
// All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:blockchain_signer/signer/remote/remote_signer.dart';
import 'package:blockchain_signer/signer/response/signed_result.dart';

///
/// This is a simple example of using blockchain signer interface to sign
/// given payloads. The payload will be sent to designated wallet provider for signature
///
Future<void> main() async {
  TezosSigner signer = TezosSigner(provider);

  await signer.init();

  /// operation in hex
  const operationInHex = 'a356d122';
  /// watermark in bytes
  const watermarkInBytes = Uint8List.fromList(crypto.hexDecode('03'));
  SignedResult res = await signer.sign(operationInHex, watermarkInBytes);

  /// This creates a signature object from taquito
  /// https://github.com/ecadlabs/taquito/blob/e5c9dcc54b5a806dbe7c0d0a2e8232a8bcde2074/packages/taquito-signer/src/ec-key.ts#L62
  print(res.sig);
  print(res.sbytes);
  print(res.bytes);
  print(res.prefixSig);
}

///
/// This is a simple example of using blockchain signer interface to build
/// Tezos remote signer module on the wallet provider side
///
class TezosSigner extends BlockchainModule implements RemoteSigner {
  TezosSigner(RpcProvider provider)
      : super(provider);

  late String _pk;
  late String _pkh;

  static TezosSigner? instance;

  @override
  String get address => _pkh;

  @override
  String get publicKey => _pk;


  @override
  String get secretKey =>
      throw UnsupportedError('Secret key is not available');

  /// sends unsigned payload to the Signer and wait for it to be signed
  ///
  /// @param [op] Operation to sign
  /// @param [magicByte] Magic bytes 1 for block, 2 for endorsement, 3 for generic, 5 for the PACK format of michelson
  Future<void> init() async {
    await response = sendToProvider(method: TezosMethod.taquito_getPublicKeyAndHash, params: []);
    _pk = response.result.pk;
    _pkh = response.result.pkh;
  }
  @override
  Future<SignedResult> sign(String op, Uint8List magicByte) async {
    final params = {"bytes": op, "watermark": magicByte};

    await response = sendToProvider(method: TezosMethod.taquito_sign, params: [params]);
    return response;
  }
}

