import 'package:json_annotation/json_annotation.dart';

part 'signed_result.g.dart';

@JsonSerializable(explicitToJson: true)
class SignedResult {
  // https://github.com/ecadlabs/taquito/blob/e5c9dcc54b5a806dbe7c0d0a2e8232a8bcde2074/packages/taquito-utils/src/taquito-utils.ts#L56
  // signature is hex 64

  /// b58c encoded signature from bytes hash
  String sig; // b58cencode(signature, prefix.sig),
  String prefixSig; // b58cencode(signature, pref[this.curve].sig),
  String bytes; // Original bytes
  String sbytes; // bytes + hex signature

  SignedResult(
      {required this.bytes,
      required this.sig,
      required this.prefixSig,
      required this.sbytes});

  factory SignedResult.fromJson(Map<String, dynamic> json) =>
      _$SignedResultFromJson(json);

  Map<String, dynamic> toJson() => _$SignedResultToJson(this);
}
