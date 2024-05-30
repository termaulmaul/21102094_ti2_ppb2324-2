import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout, // Implement logout functionality
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote, // Implement add note functionality
        child: const Icon(Icons.add),
      ),
      body: _buildBody(), // Implement body content
    );
  }

  // Function to handle logout
  void _logout() {
    // Add logout functionality here
    // For example, navigating to a login screen or clearing user data
    Navigator.pushReplacementNamed(context, '/login');
  }

  // Function to handle adding a note
  void _addNote() {
    // Add functionality to add a new note
    // For example, navigating to a note creation screen
    Navigator.pushNamed(context, '/add_note');
  }

  // Function to build the body content of the Scaffold
  Widget _buildBody() {
    // Example body content
    return Center(
      child: Text(
        'Welcome to your notes!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
