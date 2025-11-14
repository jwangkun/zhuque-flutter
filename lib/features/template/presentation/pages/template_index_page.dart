import 'package:flutter/material.dart';

/// 模板演示首页
class TemplateIndexPage extends StatelessWidget {
  const TemplateIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('模板'),
      ),
      body: const Center(
        child: Text('模板页面'),
      ),
    );
  }
}