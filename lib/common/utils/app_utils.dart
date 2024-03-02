import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';



hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String formatVoucherValue({int? voucher}) {
  String value = '';
  int valueCeil = ((voucher ?? 0) / 1000).ceil();
  value = '-${valueCeil}K';
  return value;
}

String formatCurrency(dynamic number, {bool isVnd = true}) {
  String numberConvert;

  if (isNullEmptyFalseOrZero(number) || !isNumeric(number)) {
    numberConvert = '0';
  } else {
    numberConvert = number.toString();
  }

  String newMoney = '';
  int isDouble = numberConvert.indexOf('.');
  if (isDouble != -1) {
    numberConvert =
        numberConvert.replaceRange(isDouble, numberConvert.length, '');
  }
  if (numberConvert.length > 3) {
    int head = numberConvert.length % 3;
    newMoney += numberConvert.substring(0, head);
    if (newMoney.isNotEmpty) {
      newMoney += '.';
    }
    for (int i = head; i < numberConvert.length; i = i + 3) {
      newMoney += numberConvert.substring(i, i + 3);
      if ((i + 3) != numberConvert.length) newMoney += '.';
    }
    return newMoney + (isVnd ? ' đ' : ' ¥');
  }

  return numberConvert + (isVnd ? ' đ' : ' ¥');
}

String formatPhoneNumber(String phoneNumber) {
  var filterText = phoneNumber;
  if (isNullEmpty(filterText)) return '';
  filterText = filterText.replaceAll(' ', '');
  if (filterText.length < 2) return filterText;
  final firstChars = filterText.substring(0, 2);
  if (firstChars == '09' ||
      firstChars == '08' ||
      firstChars == '07' ||
      firstChars == '03' ||
      firstChars == '05') {
    if (filterText.length > 3) {
      filterText = '${filterText.substring(0, 3)} ${filterText.substring(3)}';
    }
    if (filterText.length > 7) {
      filterText = '${filterText.substring(0, 7)} ${filterText.substring(7)}';
    }
  }
  return filterText.trim();
}

bool isNullEmpty(Object? o) => o == null || "" == o || o == "null";

bool isNullEmptyOrFalse(Object? o) => o == null || false == o || "" == o;

bool isNullEmptyFalseOrZero(Object? o) =>
    o == null || false == o || 0 == o || "" == o || "0" == o;

bool isNullEmptyList<T>(List<T>? t) => t == null || [] == t || t.isEmpty;

bool isNullEmptyMap<T>(Map<T, T>? t) => t == null || {} == t || t.isEmpty;

bool isNumeric(dynamic s) {
  String sConvert = s.toString();
  if (isNullEmpty(sConvert)) {
    return false;
  }
  return (double.tryParse(sConvert) != null || int.tryParse(sConvert) != null);
}

bool isNullOrWhiteSpace(String? o) =>
    o == null || "" == o.trim() || o.trim() == "null";

Future<bool> checkPermission(Permission permission) async {
  final status = await permission.request();
  return status.isGranted;
}




Future<bool> checkConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    // if (Get.context != null) {
    //   showTopSnackBarError(
    //       Get.context!, TranslationConstants.noConnectionError.tr);
    // }

    return false;
  }
  return true;
}



