import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';


bool isRTL({required String text,required BuildContext context}) {
  if (text.isEmpty) return Directionality.of(context) == TextDirection.rtl;
  return intl.Bidi.detectRtlDirectionality(text);
}