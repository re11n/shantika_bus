// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _newEmail = '';
  String _newPassword = '';

  Future<void> _changeEmail() async {
    final _oldPasswordController = TextEditingController();
    final _newEmailController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Email'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _oldPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter your current password",
                  ),
                ),
                TextField(
                  controller: _newEmailController,
                  decoration: const InputDecoration(
                    hintText: "Enter your new email",
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () async {
                // Create the credential
                AuthCredential credential = EmailAuthProvider.credential(
                  email: _auth.currentUser!.email!,
                  password: _oldPasswordController.text,
                );
                try {
                  // Reauthenticate
                  await _auth.currentUser!
                      .reauthenticateWithCredential(credential);

                  // Update the email
                  await _auth.currentUser!
                      .updateEmail(_newEmailController.text);

                  // Success message
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Email updated successfully.'),
                  ));

                  Navigator.of(context).pop();
                } catch (e) {
                  // Handle error
                  print('Failed to update email: $e');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Failed to update email: $e'),
                  ));
                }
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _changePassword() async {
    final _oldPasswordController = TextEditingController();
    final _newPasswordController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _oldPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter your current password",
                  ),
                ),
                TextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter your new password",
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () async {
                // Create the credential
                AuthCredential credential = EmailAuthProvider.credential(
                  email: _auth.currentUser!.email!,
                  password: _oldPasswordController.text,
                );
                try {
                  // Reauthenticate
                  await _auth.currentUser!
                      .reauthenticateWithCredential(credential);

                  // Update the password
                  await _auth.currentUser!
                      .updatePassword(_newPasswordController.text);

                  // Success message
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Password updated successfully.'),
                  ));

                  Navigator.of(context).pop();
                } catch (e) {
                  // Handle error
                  print('Failed to update password: $e');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Failed to update password: $e'),
                  ));
                }
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccount() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Hapus Akun"),
          content: const Text(
              "Apakah Anda yakin ingin menghapus akun Anda? Ini tidak dapat diurungkan."),
          actions: [
            TextButton(
              child: const Text("BATALKAN"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("HAPUS"),
              onPressed: () async {
                try {
                  await _auth.currentUser!.delete();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Akun berhasil dihapus.'),
                    ),
                  );
                } catch (e) {
                  print('Gagal menghapus akun: $e');
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Gagal menghapus akun: $e'),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Ubah Email'),
              onTap: _changeEmail,
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key),
              title: const Text('Ubah Password'),
              onTap: _changePassword,
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Hapus Akun'),
              onTap: _deleteAccount,
            ),
          ],
        ),
      ),
    );
  }
}
