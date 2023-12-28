import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/amazon.png",
              width: 500,
              height: 300,
            ),
            const SizedBox(
              height: 0,
            ),
            const Text(
              "AMAZON",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}

class loginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  loginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(175, 96, 224, 194),
          title: const Text("  AMAZON "),
        ),
        body: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: username,
                    decoration: const InputDecoration(
                        labelText: 'Username', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                        labelText: 'Password', border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            )));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 208, 208),
      appBar: AppBar(
        title: const Text("  AMAZON "),
        backgroundColor: const Color.fromARGB(175, 96, 224, 194),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: GridViewWithScroll(),
          ),
          const SizedBox(height: 25),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 500,
            ),
            child: const listviews(),
          ),
        ],
      ),
    );
  }
}

List<String> imagelist = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCisojHF_3512YZ2bzZUr9ULb33Y3H8N0gcg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREx8da9YjEDbU5CBSgg56IIVi4gTA5bi0X_A&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTghvVPBZKxAYjb6zDZhogrYNmblRy0YiWC0Q&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTQjukhWVG7CEF7xZLNP_W3k2DTmX-NuxdUg&usqp=CAU"
];

class GridViewWithScroll extends StatelessWidget {
  final List<String> items = List.generate(4, (index) => 'Item $index');

  GridViewWithScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(imagelist[index]), fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}

class listviews extends StatefulWidget {
  const listviews({super.key});

  @override
  State<listviews> createState() => _listviewsstate();
}

class _listviewsstate extends State<listviews> {
  static List<String> item = [
    "Snekers",
    "Running Shoe",
    "Sunglass",
    "Rolex Watch",
    "Rolling bag"
  ];
  static List<String> describtion = [
    "Inklenzo Men's/Boys Cuff Canvas Sneaker Shoes for Daily Use    Rs:799",
    "Coaster Inspired Casual/Outdoor/Running Sneakers Shoes for Men    Rs:699",
    "ELEGANTE Ponderable UV Protection Coating Round Sunglasses    Rs:499",
    "ROLEX  Watch(Black Dial Gold & Silver Colored Strap)   Rs:37599 ",
    "Rockland Double Handle Rolling Backpack     Rs:1249 "
  ];

  static List url = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxZRgkqIoWyYeTT4YUQRO_3whrkdKvG_J5_Zz9G1WN7S2r_BRfWJKADbT0ie_JqjWV-Zg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc0fR0U1FBdCIHYXGkmM8WSdIOlxGZ2rEGjg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKt3fMUkr5zZtDENsEZfrKLIdwXeYMz-7Urg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyiXIPtLc4v_5djCdstGeCyYUEoclXXtfdhQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk5g9GUkAromDepGdmBHOyEC5rC8dWQmvz_Q&usqp=CAU"
  ];
  final List<fasionmodel> fasionlist = List.generate(
      item.length,
      (index) => fasionmodel(
          name: ("${item[index]}"),
          imageurl: ("${url[index]}"),
          desc: ("${describtion[index]} ")));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: fasionlist.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: ListTile(
                title: Text(fasionlist[index].name),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(fasionlist[index].imageurl),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          fasiondetails(details: fasionlist[index])));
                },
              ),
            ),
          );
        });
  }
}

class fasionmodel {
  final String name, imageurl, desc;

  fasionmodel({required this.name, required this.imageurl, required this.desc});
}

class fasiondetails extends StatelessWidget {
  fasiondetails({super.key, required this.details});
  final fasionmodel details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(details.name),
        backgroundColor: const Color.fromARGB(175, 96, 224, 194),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              details.imageurl,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(details.desc),
          ],
        ),
      ),
    );
  }
}
