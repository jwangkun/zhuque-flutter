import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 关于页面 - 展示应用信息和功能介绍
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppHeader(context),
            const SizedBox(height: 32),
            _buildFeaturesSection(),
            const SizedBox(height: 24),
            _buildTechStackSection(),
            const SizedBox(height: 24),
            _buildVersionSection(),
            const SizedBox(height: 24),
            _buildContactSection(),
            const SizedBox(height: 32),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  // 应用头部信息
  Widget _buildAppHeader(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.secondary],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.flutter_dash,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '朱雀UI Flutter',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.grayDarker,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '基于TDesign的Flutter组件库',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.gray,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'v1.0.0',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 功能特色
  Widget _buildFeaturesSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '功能特色',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.grayDarker,
              ),
            ),
            const SizedBox(height: 16),
            _buildFeatureItem(
              Icons.palette,
              '丰富的组件库',
              '提供40+个常用组件，涵盖基础、导航、数据展示、反馈等各个方面',
              AppColors.primary,
            ),
            const SizedBox(height: 12),
            _buildFeatureItem(
              Icons.design_services,
              'TDesign设计规范',
              '严格遵循腾讯TDesign设计体系，保持一致的用户体验',
              AppColors.secondary,
            ),
            const SizedBox(height: 12),
            _buildFeatureItem(
              Icons.color_lens,
              '完整的主题系统',
              '支持亮色/暗色主题切换，提供丰富的配色方案',
              AppColors.success,
            ),
            const SizedBox(height: 12),
            _buildFeatureItem(
              Icons.widgets,
              '高度可定制',
              '每个组件都支持丰富的自定义选项，满足不同的业务需求',
              AppColors.warning,
            ),
            const SizedBox(height: 12),
            _buildFeatureItem(
              Icons.speed,
              '性能优化',
              '经过性能优化的组件实现，确保流畅的用户体验',
              AppColors.danger,
            ),
          ],
        ),
      ),
    );
  }

  // 技术栈
  Widget _buildTechStackSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '技术栈',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.grayDarker,
              ),
            ),
            const SizedBox(height: 16),
            _buildTechItem('Flutter', '3.x', '跨平台UI框架'),
            const SizedBox(height: 12),
            _buildTechItem('Dart', '3.x', '现代化编程语言'),
            const SizedBox(height: 12),
            _buildTechItem('TDesign', '最新版', '腾讯设计体系'),
            const SizedBox(height: 12),
            _buildTechItem('GoRouter', '最新版', '声明式路由管理'),
            const SizedBox(height: 12),
            _buildTechItem('Provider', '最新版', '状态管理方案'),
          ],
        ),
      ),
    );
  }

  // 版本信息
  Widget _buildVersionSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '版本信息',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.grayDarker,
              ),
            ),
            const SizedBox(height: 16),
            _buildVersionItem('当前版本', 'v1.0.0', '稳定版'),
            const SizedBox(height: 12),
            _buildVersionItem('发布日期', '2025-11-15', '首次发布'),
            const SizedBox(height: 12),
            _buildVersionItem('Flutter版本', '3.16+', '推荐版本'),
            const SizedBox(height: 12),
            _buildVersionItem('Dart版本', '3.2+', '推荐版本'),
          ],
        ),
      ),
    );
  }

  // 联系方式
  Widget _buildContactSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '联系我们',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.grayDarker,
              ),
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              Icons.email,
              '邮箱支持',
              'jwangkun@gamil.com',
              '点击发送邮件',
              () => _launchEmail(),
            ),
            const SizedBox(height: 12),
            _buildContactItem(
              Icons.code,
              '开源仓库',
              'GitHub - ZhuQue-UI',
              '查看源代码',
              () => _launchGithub(),
            ),
            const SizedBox(height: 12),
            _buildContactItem(
              Icons.description,
              '官方文档',
              'TDesign 官方文档',
              '查看详细文档',
              () => _launchDocumentation(),
            ),
          ],
        ),
      ),
    );
  }

  // 页脚
  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          Text(
            'Made with ❤️ by ZhuQue UI Team',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.gray,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '© 2024 ZhuQue UI. All rights reserved.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.gray.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  // 功能项
  Widget _buildFeatureItem(IconData icon, String title, String description, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grayDarker,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.gray,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 技术项
  Widget _buildTechItem(String name, String version, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.grayDarker,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            version,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // 版本项
  Widget _buildVersionItem(String label, String value, String status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.gray,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.grayDarker,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.success,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 联系项
  Widget _buildContactItem(
    IconData icon,
    String title,
    String subtitle,
    String action,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grayDarker,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  action,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.gray.withValues(alpha: 0.5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 启动邮箱
  void _launchEmail() {
    // TODO: 实现邮箱启动逻辑
    debugPrint('启动邮箱: support@zhuque-ui.com');
  }

  // 启动GitHub
  void _launchGithub() {
    // TODO: 实现GitHub启动逻辑
    debugPrint('启动GitHub仓库');
  }

  // 启动文档
  void _launchDocumentation() {
    // TODO: 实现文档启动逻辑
    debugPrint('启动TDesign官方文档');
  }
}