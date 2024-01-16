import 'package:app/view/detailed_page/detailed_page_v.dart';
import 'package:app/view/homepage/homepage_vm.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  load() {
    Provider.of<HomeViewModel>(context, listen: false).getUser();
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   load();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),

        //
        body: Consumer<HomeViewModel>(builder: (context, value, child) {
          return Column(
            children: [
              //

              SizedBox(
                height: size.height * 0.75,
                child: (value.user == null || value.user!.isEmpty)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: value.user!.length,
                        itemBuilder: (context, index) {
                          var user = value.user![index];

                          return ListTile(
                            leading: CircleAvatar(),
                            title: Row(
                              children: [
                                Text(
                                  user.name ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Text(
                                  '2d ',
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              user.username ?? "",
                            ),
                            trailing: Icon(
                              Icons.accessible,
                              color: Colors.red,
                            ),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      argument: DetaildArgument(
                                          email: user.email!,
                                          name: user.name!,
                                          username: user.username!)),
                                )).then((value) => load()),
                          );
                        },
                      ),
              ),

              //

              ListTile(
                title: Text(value.randomUser?.company?.name ?? ""),
                subtitle: Text(value.randomUser?.company?.catchPhrase ?? ""),
                trailing: value.showloadingforfooter && value.randomUser == null
                    ? CircularProgressIndicator()
                    : SizedBox.shrink(),
              ),
            ],
          );
        }));
  }
}
