import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  bool switchLocationValue = false;
  bool swithPersonalizationValue = false;
  String regionValue = 'Toshkent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: Column(
          children: [
            Text('Explore Settings',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87
            ),),
            Text('@abdujabbor17',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87
              ),)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Location',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                fontWeight: FontWeight.w500
              ),),
            SizedBox(height: 24,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Show content in this location',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400
                        ),),
                      SizedBox(height: 5,),
                      Text('When this is on, you\`ll see what\`s happening around you right now',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300
                        ),),
                    ],
                  ),
                ),

                Switch(
                    value: switchLocationValue,
                    onChanged: (val){
                      switchLocationValue = val;
                      setState(() {});
                    }),
              ]),
            SizedBox(height: 24,),
            Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Show content in this location',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400
                          ),),
                        SizedBox(height: 5,),
                        Text('When this is on, you\`ll see what\`s happening around you right now',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w300
                          ),),
                      ],
                    ),
                  ),
                  Switch(
                      value: switchLocationValue,
                      onChanged: (val){
                        switchLocationValue = val;
                        setState(() {});
                      }),
                ]),
                SizedBox(height: 10,),
                // Divider(thickness: 1,),
                SizedBox(height: 20,),
                DropdownButton<String>(
                  hint: Text('Select your region'),
                  value: regionValue,
                    items: <String>['Toshkent', 'Samarkand', 'Buxoro', 'Xorazim'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue){
                    regionValue = newValue!;
                    setState(() {});
                      print('New value selected: $newValue');
                    }),
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )
                              ),
                              child: Column(
                                children: [
                                  Text("This is a bottom sheet"),
                                  SizedBox(height: 10,),
                                  ElevatedButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text('Pop'))
                                ],
                              )
                            );
                          }
                      );
                    },
                    child: Text('Show BottomSheet')
                ),
               // Divider(thickness: 1,),
            SizedBox(height: 10,),
            PopupMenuButton(
              // onSelected: (value) {
              //   if(value == 'Delete'){
              //     print('Successfuly deleted');
              //   } else {
              //     print('Please Edit');
              //   }
              // },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    value: 'Delete',
                      child: InkWell(
                        onTap: (){
                          print("Successfuly deleted with InkWell");
                        },
                        child: Text('Delete'),),
                  ),
                  PopupMenuItem(
                    value: 'Edit',
                    child: Text('Edit'),
                  ),
                ],
            )
          ],
        ),
      ),
    );
  }
}
