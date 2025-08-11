


  import 'package:day_3/pages/profile_page.dart';
import 'package:day_3/widgets/icon_text._widget.dart';
import 'package:flutter/material.dart';

Container customDrawer(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Color.fromRGBO(255, 70, 0, 1),
                      child: Text('A', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                    )),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text('aziz rasool', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(  
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                      },
                      child: iconAndText('assets/vectors/prof.png', 'View Profile')),
                    const SizedBox(height: 40,),
                    iconAndText('assets/vectors/voucher.png', 'Vouchers'),
                    const SizedBox(height: 40,),
                    iconAndText('assets/vectors/discount.png', 'Others'),
                    const SizedBox(height: 40,),
                    iconAndText('assets/vectors/help.png', 'Help Center'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const SizedBox(height: 40),
                Text('Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 40),
                Text('Terms & Conditions / Privacy', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 40,),
                Text('log Out', style:TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                
                ],),
              )
            ],
          ),
        );
  }