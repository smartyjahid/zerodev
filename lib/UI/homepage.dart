import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_navigation/side_navigation.dart';

import '../Constant.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchEditingController = TextEditingController();

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    Widget Serchfield = TextFormField(
      keyboardType: TextInputType.text,
      validator: (input) {
        if (input!.isEmpty) {
          return "please input something";
        } else {
          return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      //maxLength: 10,
      controller: searchEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(15, 2, 2, 1),

        hintText: Search_title_key,
        prefixIcon: Icon(Icons.search),

        prefixIconConstraints: BoxConstraints(
            minWidth: 50, minHeight: 25, maxWidth: 51, maxHeight: 25),
        // errorText: Validator.validateMobile(edtMobile.text, context),
      ),
    );
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: screensize.width * 0.14,
              ),
              Expanded(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            child: Image.asset('assets/images/home_logo.png')),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: screensize.width - 20,
                          child: Serchfield,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ///
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
                            primary: Colors.deepPurpleAccent,
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            "Search it",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      ]),
                ), //views.elementAt(selectedIndex),
              ),
            ],
          ),
          Row(
            children: [
              /// Pretty similar to the BottomNavigationBar!
              SideNavigationBar(
                theme: SideNavigationBarTheme(
                  backgroundColor: ColorPrimary,
                  itemTheme: SideNavigationBarItemTheme(
                      selectedItemColor: Colors.white,
                      selectedBackgroundColor: bgColor),
                  dividerTheme: SideNavigationBarDividerTheme(
                      showHeaderDivider: true,
                      showMainDivider: true,
                      showFooterDivider: false),
                  togglerTheme: SideNavigationBarTogglerTheme(
                      expandIconColor: Colors.white,
                      shrinkIconColor: Colors.white),
                ),
                toggler: SideBarToggler(
                    expandIcon: Icons.arrow_back,
                    shrinkIcon: Icons.arrow_forward),
                initiallyExpanded: false,
                selectedIndex: selectedIndex,
                items: const [
                  SideNavigationBarItem(
                    icon: Icons.browse_gallery,
                    label: 'Safe Browser',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.hide_source_rounded,
                    label: 'Channel',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.online_prediction_sharp,
                    label: 'Network Player',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.download_done_sharp,
                    label: 'Quick Downloader',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Settings',
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),

              /// Make it take the rest of the available width
            ],
          ),
          Positioned(
              right: 13,
              top: 20,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.network_cell,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
