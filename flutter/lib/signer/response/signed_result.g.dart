// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signed_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignedResult _$SignedResultFromJson(Map<String, dynamic> json) => SignedResult(
      bytes: json['bytes'] as String,
      sig: json['sig'] as String,
      prefixSig: json['prefixSig'] as String,
      sbytes: json['sbytes'] as String,
    );

Map<String, dynamic> _$SignedResultToJson(SignedResult instance) =>
    <String, dynamic>{
      'bytes': instance.bytes,
      'sig': instance.sig,
      'prefixSig': instance.prefixSig,
      'sbytes': instance.sbytes,
    };
