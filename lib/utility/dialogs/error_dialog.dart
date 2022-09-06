import 'package:flutter/cupertino.dart';
import 'package:vidflix/utility/dialogs/generic_dialog.dart';



Future<void> showErrorDialog (BuildContext context, String text) {
  return showGenericDialog<void>(
    context: context,
    title: '',
    content: text,
    optionsBuilder: () => {
    'OK' : null,
   },);
}



