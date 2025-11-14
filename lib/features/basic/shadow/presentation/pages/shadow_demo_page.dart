import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 阴影演示组件
class ShadowDemoPage extends StatelessWidget {
  const ShadowDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('阴影'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '基础阴影'),
            const SizedBox(height: 16),
            _buildBasicShadows(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '阴影层级'),
            const SizedBox(height: 16),
            _buildShadowLevels(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '彩色阴影'),
            const SizedBox(height: 16),
            _buildColoredShadows(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '内阴影'),
            const SizedBox(height: 16),
            _buildInnerShadows(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '渐变阴影'),
            const SizedBox(height: 16),
            _buildGradientShadows(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '应用场景'),
            const SizedBox(height: 16),
            _buildApplicationScenarios(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _buildBasicShadows(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础阴影效果'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildShadowCard('无阴影', Colors.white, null),
            _buildShadowCard('默认阴影', Colors.white, [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ]),
            _buildShadowCard('柔和阴影', Colors.white, [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget _buildShadowLevels(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('不同层级的阴影'),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildShadowCard('Level 1', Colors.white, [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ]),
            _buildShadowCard('Level 2', Colors.white, [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ]),
            _buildShadowCard('Level 3', Colors.white, [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ]),
            _buildShadowCard('Level 4', Colors.white, [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ]),
            _buildShadowCard('Level 5', Colors.white, [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ]),
            _buildShadowCard('Level 6', Colors.white, [
              BoxShadow(
                color: Colors.black.withOpacity(0.24),
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget _buildColoredShadows(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('主色调阴影'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildShadowCard('主色', AppColors.primary.withOpacity(0.1), [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ]),
            _buildShadowCard('辅色', AppColors.secondary.withOpacity(0.1), [
              BoxShadow(
                color: AppColors.secondary.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ]),
            _buildShadowCard('成功', AppColors.success.withOpacity(0.1), [
              BoxShadow(
                color: AppColors.success.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ]),
          ],
        ),
        const SizedBox(height: 16),
        const Text('渐变色阴影'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildGradientShadowCard('渐变1', [
              BoxShadow(
                color: Colors.purple.withOpacity(0.3),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ]),
            _buildGradientShadowCard('渐变2', [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ]),
            _buildGradientShadowCard('渐变3', [
              BoxShadow(
                color: Colors.teal.withOpacity(0.3),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget _buildInnerShadows(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('内阴影效果'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildInnerShadowCard('内阴影1'),
            _buildInnerShadowCard('内阴影2'),
            _buildInnerShadowCard('内阴影3'),
          ],
        ),
      ],
    );
  }

  Widget _buildGradientShadows(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('多层阴影'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildShadowCard('多层1', Colors.white, [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ]),
            _buildShadowCard('多层2', Colors.white, [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ]),
          ],
        ),
        const SizedBox(height: 16),
        const Text('特殊效果'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSpecialShadowCard('霓虹效果', [
              BoxShadow(
                color: Colors.pink.withOpacity(0.8),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 0),
              ),
              BoxShadow(
                color: Colors.pink.withOpacity(0.6),
                blurRadius: 40,
                spreadRadius: 4,
                offset: const Offset(0, 0),
              ),
            ]),
            _buildSpecialShadowCard('发光效果', [
              BoxShadow(
                color: Colors.cyan.withOpacity(0.8),
                blurRadius: 30,
                spreadRadius: 3,
                offset: const Offset(0, 0),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget _buildApplicationScenarios(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('卡片阴影'),
        const SizedBox(height: 12),
        _buildScenarioCard('信息卡片', '用于展示内容的卡片'),
        const SizedBox(height: 16),
        const Text('按钮阴影'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildElevatedButton('悬浮按钮'),
            _buildElevatedButton('主要按钮'),
            _buildElevatedButton('次要按钮'),
          ],
        ),
        const SizedBox(height: 16),
        const Text('输入框阴影'),
        const SizedBox(height: 12),
        _buildInputField('输入框阴影示例'),
      ],
    );
  }

  Widget _buildShadowCard(String title, Color bgColor, List<BoxShadow>? shadows) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: shadows,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildGradientShadowCard(String title, List<BoxShadow> shadows) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade200, Colors.blue.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: shadows,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildInnerShadowCard(String title) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            blurRadius: 8,
            offset: const Offset(-4, -4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildSpecialShadowCard(String title, List<BoxShadow> shadows) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade300, Colors.pink.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: shadows,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildScenarioCard(String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildInputField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        hint,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
      ),
    );
  }
}