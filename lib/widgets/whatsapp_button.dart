import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            openwhatsapp();
          },
          child: Container(
            padding: EdgeInsets.all(40),
            child: Text(" contact US"),
          ),
        ),

      ),
    );
  }

  openwhatsapp() async{
    var whatsapp ="+919144040888";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURL_ios)){
        await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));

      }

    }else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));

      }


    }

  }

}


