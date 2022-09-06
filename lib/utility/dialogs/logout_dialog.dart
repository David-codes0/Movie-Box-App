
import 'package:flutter/cupertino.dart';
import 'package:vidflix/utility/dialogs/generic_dialog.dart';


Future<bool> showLogoutDialog(BuildContext context){
  return showGenericDialog<bool>(
    context: context,
    title: 'Log out',
    content: 'Do you want to log out',
    optionsBuilder: () => {
      'Cancel' : false,
      'Logout': true,
    } ,
  ).then(
    (value) => value ?? false,
    );
}