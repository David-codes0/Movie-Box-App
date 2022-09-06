
import 'package:flutter/cupertino.dart';
import 'package:vidflix/utility/dialogs/generic_dialog.dart';

Future<void> showPasswordResetDialog (BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'context.loc.password_reset',
    content: 'context.loc.password_reset_dialog_prompt',
    optionsBuilder:() => {
      'context.loc.ok' : null,
    },
  );
}