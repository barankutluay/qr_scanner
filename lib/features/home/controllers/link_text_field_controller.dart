import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';

class LinkTextFieldController {
  static TextFormFieldCubit Function(BuildContext context) read =
      (BuildContext context) => context.read<TextFormFieldCubit>();

  static TextFormFieldCubit Function(BuildContext context) watch =
      (BuildContext context) => context.watch<TextFormFieldCubit>();

  static bool validateLink(BuildContext context, String value) {
    final Uri? uri = Uri.tryParse(value);

    if (value.isEmpty) return false;

    if (uri == null || (!uri.hasScheme || !uri.hasAuthority)) return false;

    return true;
  }

  static String? validationText(String value) {
    final Uri? uri = Uri.tryParse(value);

    const String emptyMessage = 'This field cannot be empty';
    const String notValidMessage = 'Please enter a valid link';

    if (value.isEmpty) return emptyMessage;

    if (uri == null || (!uri.hasScheme || !uri.hasAuthority)) {
      return notValidMessage;
    }

    return null;
  }
}
