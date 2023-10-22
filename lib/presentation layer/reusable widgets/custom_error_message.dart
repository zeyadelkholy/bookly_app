import 'package:booklyapp/Core/utils/App_Styles.dart';
import 'package:flutter/cupertino.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({Key? key, required this.errorMessage})
      : super(key: key);

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errorMessage,
      style: Styles.textStyle18,
          textAlign:TextAlign.center ,
    ));
  }
}
