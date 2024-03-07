import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/contact_cubit.dart';
import 'home_screen.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Kontak Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ContactCubit, ContactState>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: username,
                    decoration: const InputDecoration(
                        filled: true, hintText: 'Nama', labelText: 'Nama'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tulis nama dengan benar';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: phoneNumber,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Nomor Telepon',
                        labelText: 'Nomor Telepon'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tulis nomor telepon dengan benar';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ContactCubit>().addContact(
                                username: username.text,
                                number: int.parse(phoneNumber.text),
                              );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Kontak Berhasil Ditambahkan!')),
                          );
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (route) => false);
                        }
                      },
                      child: const Text('Tambah ke Daftar Kontak'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
