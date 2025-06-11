import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Data/models/UserModel.dart';
import 'package:flutterpolo/Presentation/providers/user/user_provider.dart';
import 'package:flutterpolo/Presentation/widgets/SnackBar.dart';
import 'UserCreateScreen.dart';
import 'UserEditScreen.dart';

class UsersScreen extends ConsumerStatefulWidget {
  const UsersScreen({super.key});

  @override
  ConsumerState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(userNotifierProvider.notifier).getUsers());
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userNotifierProvider, (previous, next) {
      if (next.error == null && next.users != null && next.users is List<UserModel>) {
        final users = next.users;
      }
      if (next.error == null && next.isLoading != previous?.isLoading) {
        setState(() {
          isLoading = next.isLoading ?? false;
        });
      }
    });

    final userState = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFEA6307), Color(0xFFF09849)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/polo.png', width: 40, height: 40),
        ),
        title: Text(
          "User Management",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 32, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Color(0xFFF6F1F8),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color(0xFFF3EFFF),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "User List",
                      style: TextStyle(
                        color: Color(0xFF7B4BBA),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    // ElevatedButton.icon(
                    //   onPressed: () async {
                    //     final result = await Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const UserCreateScreen(),
                    //       ),
                    //     );
                    //     if (result != null) {
                    //       await ref.read(userNotifierProvider.notifier).createUser(result);
                    //       ref.read(userNotifierProvider.notifier).getUsers();
                    //     }
                    //   },
                    //   icon: Icon(Icons.add, color: Colors.white),
                    //   label: Text("Add New User", style: TextStyle(color: Colors.white)),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Color(0xFFEA6307),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search users...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    // Implement search logic here later
                  },
                ),
                SizedBox(height: 20),
                userState.isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : userState.users == null || userState.users!.isEmpty
                        ? Center(child: Text("No users found."))
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columnSpacing: 25,
                                    dataRowHeight: 60,
                                    headingRowColor: MaterialStateProperty.resolveWith((states) => Color(0xFFF3EFFF)),
                                    columns: const [
                                      DataColumn(label: Text('Username', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B4BBA)))),
                                      DataColumn(label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B4BBA)))),
                                      DataColumn(label: Text('Phone', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B4BBA)))),
                                      DataColumn(label: Text('Role', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B4BBA)))),
                                      DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7B4BBA)))),
                                    ],
                                    rows: userState.users!.map((user) {
                                      return DataRow(
                                        color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                          if (userState.users!.indexOf(user) % 2 == 0) {
                                            return Color(0xFFF9F7FB);
                                          }
                                          return null;
                                        }),
                                        cells: [
                                          DataCell(Text(user.username ?? '')),
                                          DataCell(Text(user.email ?? '')),
                                          DataCell(Text(user.phoneNumber ?? '')),
                                          DataCell(Text(user.role ?? '')),
                                          DataCell(Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Tooltip(
                                                message: 'Edit User',
                                                child: IconButton(
                                                  icon: Icon(Icons.edit, color: Colors.blueAccent, size: 20),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => UserEditScreen(user: user),
                                                      ),
                                                    ).then((_) {
                                                      ref.read(userNotifierProvider.notifier).getUsers();
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Tooltip(
                                                message: 'Delete User',
                                                child: IconButton(
                                                  icon: Icon(Icons.delete, color: Colors.redAccent, size: 20),
                                                  onPressed: () async {
                                                    final confirm = await showDialog<bool>(
                                                      context: context,
                                                      builder: (context) => AlertDialog(
                                                        title: Text('Delete User'),
                                                        content: Text('Are you sure you want to delete this user?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(context, false),
                                                            child: Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(context, true),
                                                            child: Text('Delete', style: TextStyle(color: Colors.red)),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                    if (confirm == true) {
                                                      ref.read(userNotifierProvider.notifier).deleteUser(user.id);
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          )),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

