/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

// To parse this JSON data, do
//
//     final result = resultFromMap(jsonString);

import 'dart:convert';

class Result<T> {
  Result({
    this.status = false,
    this.isError = false,
    this.error,
    this.text,
    this.messages,
  });

  bool? status = false;
  bool? isError = false;
  String? error;
  String? text;
  String? messages;

  /// TO PARSE INTO MODEL USE .fromMap()
  T? body;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        status: json["status"] == null ? null : json["status"],
        error: json["error"] == null ? null : json["error"],
        text: json["text"] == null ? null : json["text"],
        messages: json["messages"] == null ? null : json["messages"],
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "error": error == null ? null : error,
        "text": text == null ? null : text,
        "messages": messages == null ? null : messages,
      };

  @override
  String toString() {
    return 'Result{status: $status, isError: $isError, error: $error, text: $text, messages: $messages, body: $body}';
  }

}
