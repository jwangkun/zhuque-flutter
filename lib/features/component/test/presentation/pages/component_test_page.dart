import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 组件测试页面 - 用于快速验证所有新组件
class ComponentTestPage extends StatelessWidget {
  const ComponentTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('组件测试'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTestSection('通知栏组件', [
            _buildTestButton(context, 'NoticeBar 通知栏', '/component/notice-bar'),
          ]),
          _buildTestSection('步进器组件', [
            _buildTestButton(context, 'NumberBox 步进器', '/component/number-box'),
          ]),
          _buildTestSection('悬浮按钮组件', [
            _buildTestButton(context, 'Fab 悬浮按钮', '/component/fab'),
          ]),
          _buildTestSection('验证码组件', [
            _buildTestButton(context, 'VerifyCode 验证码', '/component/verify-code'),
          ]),
          _buildTestSection('吸顶组件', [
            _buildTestButton(context, 'Sticky 吸顶', '/component/sticky'),
          ]),
          _buildTestSection('滑动菜单组件', [
            _buildTestButton(context, 'SwipeAction 滑动菜单', '/component/swipe-action'),
          ]),
          _buildTestSection('索引列表组件', [
            _buildTestButton(context, 'IndexList 索引列表', '/component/index-list'),
          ]),
        ],
      ),
    );
  }

  Widget _buildTestSection(String title, List<Widget> buttons) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...buttons,
          ],
        ),
      ),
    );
  }

  Widget _buildTestButton(BuildContext context, String label, String route) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

/// 快速测试所有组件的页面
class QuickComponentTest extends StatelessWidget {
  const QuickComponentTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('快速组件测试')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          _buildQuickTestCard(context, '通知栏', '/component/notice-bar', Icons.campaign),
          _buildQuickTestCard(context, '步进器', '/component/number-box', Icons.plus_one),
          _buildQuickTestCard(context, '悬浮按钮', '/component/fab', Icons.add_circle),
          _buildQuickTestCard(context, '验证码', '/component/verify-code', Icons.verified),
          _buildQuickTestCard(context, '吸顶', '/component/sticky', Icons.vertical_align_top),
          _buildQuickTestCard(context, '滑动菜单', '/component/swipe-action', Icons.swipe),
          _buildQuickTestCard(context, '索引列表', '/component/index-list', Icons.sort_by_alpha),
        ],
      ),
    );
  }

  Widget _buildQuickTestCard(BuildContext context, String title, String route, IconData icon) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary.withValues(alpha: 0.1),
                AppColors.primary.withValues(alpha: 0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: AppColors.primary),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}