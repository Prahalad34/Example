import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late PageController _pageController;
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }


  String? _selectedTime;

  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }
  int activepage = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 5,),
              Text('Example'),

            ],
          ),
        ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: SizedBox(
                width:double.infinity,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height/2,
                      // width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black),
                          image: DecorationImage(
                              image: AssetImage('assets/family.png'), fit: BoxFit.cover)),
                    ),



                    Text("Lorem Ipsum",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting Industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: TextStyle(fontSize: 15, color: Colors.grey)),


                    TextButton(
                        onPressed: _show, child:  Text(
                        _selectedTime != null ? _selectedTime! :''),

                    ),

            //   PageView.builder(
            //     itemCount: images.length,
            // pageSnapping: true,
            //    onPageChanged: (page) {
            //   setState(() {
            //    activepage = page;
            //  });
            // },
            // itemBuilder: (context, pagePosition) {
            //   return Container(
            //     margin: EdgeInsets.all(10),
            //     child: Image.network(images[pagePosition]),
            //   );
            // }
            //   )

                  ],
                ),
              ),
            ),
          )),
    );
  }
}
