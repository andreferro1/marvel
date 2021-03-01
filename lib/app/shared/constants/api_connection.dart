import 'dart:convert';
import 'package:crypto/crypto.dart';

var urlBase = "https://gateway.marvel.com:443/v1/public";
var publickey = "ab5016d180cef2bcf3a34f5da8bf684c";
var privatekey = "8df904f20621127dba149f02474a9dc8eb751309";
var ts = new DateTime.now().toString();
var stringToHash = ts + privatekey + publickey;
var hash = generateMd5(stringToHash);

var urlKey = "&ts=" + ts + "&apikey=" + publickey + "&hash=" + hash;

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
