import 'package:motion_snackbar/motion_snackbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Snackbars',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(title: 'Animated Snackbars'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Snackbars'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Directional Snackbar Examples',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Animates from bottom to top when appearing, and top to bottom when disappearing',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                SizedBox(height: 20),
                _buildSnackbarButton(
                  context: context,
                  title: 'Show Success Snackbar',
                  color: Color(0xFF28A745),
                  onPressed: () {
                    SnackbarUtils.showSuccessSnackbar(
                      context: context,
                      message: 'Success!',
                      description: 'Operation completed successfully.',
                    );
                  },
                ),
                SizedBox(height: 16),
                _buildSnackbarButton(
                  context: context,
                  title: 'Show Error Snackbar',
                  color: Color(0xFFC72C41),
                  onPressed: () {
                    SnackbarUtils.showErrorSnackbar(
                      context: context,
                      message: 'Error!',
                      description: 'Something went wrong. Please try again.',
                    );
                  },
                ),
                SizedBox(height: 16),
                _buildSnackbarButton(
                  context: context,
                  title: 'Show Info Snackbar',
                  color: Color(0xFF007BFF),
                  onPressed: () {
                    SnackbarUtils.showInfoSnackbar(
                      context: context,
                      message: 'Information',
                      description: 'Here is some useful information for you.',
                    );
                  },
                ),
                SizedBox(height: 16),
                _buildSnackbarButton(
                  context: context,
                  title: 'Show Warning Snackbar',
                  color: Color(0xFFFFC107),
                  onPressed: () {
                    SnackbarUtils.showWarningSnackbar(
                      context: context,
                      message: 'Warning!',
                      description: 'This action may have consequences.',
                    );
                  },
                ),
                SizedBox(height: 16),
                _buildSnackbarButton(
                  context: context,
                  title: 'Show Custom Snackbar',
                  color: Colors.purple,
                  onPressed: () {
                    SnackbarUtils.showAnimatedSnackbar(
                      context: context,
                      message: 'Custom Snackbar',
                      description:
                          'This is a custom snackbar with purple color.',
                      color: Colors.purple,
                      duration: Duration(milliseconds: 3000),
                    );
                  },
                ),
                SizedBox(height: 16),
                _buildSnackbarButton(
                  context: context,
                  title: 'Show Long Duration Snackbar',
                  color: Colors.teal,
                  onPressed: () {
                    SnackbarUtils.showAnimatedSnackbar(
                      context: context,
                      message: 'Long Duration',
                      description: 'This snackbar stays visible for 5 seconds.',
                      color: Colors.teal,
                      duration: Duration(seconds: 5),
                    );
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'How to use:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1. Import the utility:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "import 'package:animated_snackbars/motion_snackbar.dart';",
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: Colors.purple.shade700,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '2. Show a snackbar:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        """SnackbarUtils.showSuccessSnackbar(
  context: context,
  message: 'Success!',
  description: 'Operation completed successfully.',
);""",
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: Colors.purple.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSnackbarButton({
    required BuildContext context,
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 14),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
      ),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
