import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _User? loggedInUser;
  bool _isAuth = false;
  String? loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    setLoading();
    try {
      await Future.delayed(const Duration(seconds: 3));
      _User? user = _User(name: 'userName', email: 'hello World');
      if (user != null) {
        loggedInUser = user;
        setName();
        setLoading();
        setState(() {});
      }
    } catch (e) {
      setLoading();
      print(e);
    }
  }

  setLoading() {
    _isAuth = !_isAuth;
    // setState(() {}); burada da olur
  }

  void setName() {
    loggedUser = loggedInUser?.email;
    // setState(() {}); burada da olur
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: (loggedUser == null || (loggedUser?.isEmpty ?? true))
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  loggedUser!,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://placeimg.com/640/480/people"),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_active_outlined, color: Colors.black, size: 27))
          ],
        ),
        body: !_isAuth
            ? SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [Text('data')],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}

class _User {
  String? name;
  String? email;
  _User({
    this.name,
    this.email,
  });
}
