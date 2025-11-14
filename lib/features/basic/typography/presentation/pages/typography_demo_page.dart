import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 字体排版演示组件
class TypographyDemoPage extends StatelessWidget {
  const TypographyDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('字体'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '字体层级'),
            const SizedBox(height: 16),
            _buildFontHierarchy(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '字体样式'),
            const SizedBox(height: 16),
            _buildFontStyles(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '文本对齐'),
            const SizedBox(height: 16),
            _buildTextAlignment(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '文本颜色'),
            const SizedBox(height: 16),
            _buildTextColors(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '文本装饰'),
            const SizedBox(height: 16),
            _buildTextDecorations(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '段落样式'),
            const SizedBox(height: 16),
            _buildParagraphStyles(context),
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

  Widget _buildFontHierarchy(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('标题样式'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Display Large',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Display Medium',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Display Small',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 16),
              Text(
                'Headline Large',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Headline Medium',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Headline Small',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                'Title Large',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Title Medium',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Title Small',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('正文样式'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Body Large',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Body Medium',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Body Small',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Text(
                'Label Large',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Label Medium',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Label Small',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFontStyles(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('字重'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thin (w100) - 极细',
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
              const SizedBox(height: 8),
              Text(
                'Extra Light (w200) - 特细',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              const SizedBox(height: 8),
              Text(
                'Light (w300) - 细',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 8),
              Text(
                'Regular (w400) - 正常',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 8),
              Text(
                'Medium (w500) - 中等',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Text(
                'Semi Bold (w600) - 半粗',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'Bold (w700) - 粗',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                'Extra Bold (w800) - 特粗',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                'Black (w900) - 极粗',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('样式'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '正常文本',
                style: TextStyle(fontStyle: FontStyle.normal),
              ),
              const SizedBox(height: 8),
              Text(
                '斜体文本',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 8),
              Text(
                '下划线文本',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              const SizedBox(height: 8),
              Text(
                '删除线文本',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextAlignment(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('对齐方式'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: Colors.grey.shade100,
                child: const Text(
                  '左对齐文本',
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: Colors.grey.shade100,
                child: const Text(
                  '居中对齐文本',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: Colors.grey.shade100,
                child: const Text(
                  '右对齐文本',
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: Colors.grey.shade100,
                child: const Text(
                  '两端对齐文本，这是一个比较长的文本，用于演示两端对齐的效果',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextColors(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('主要颜色'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '主要文本',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(height: 8),
              Text(
                '次要文本',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '辅助文本',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '禁用文本',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('功能色'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '链接文本',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 8),
              Text(
                '成功文本',
                style: TextStyle(color: Colors.green),
              ),
              const SizedBox(height: 8),
              Text(
                '警告文本',
                style: TextStyle(color: Colors.orange),
              ),
              const SizedBox(height: 8),
              Text(
                '错误文本',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextDecorations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('装饰效果'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '下划线文本',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              const SizedBox(height: 8),
              Text(
                '删除线文本',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              const SizedBox(height: 8),
              Text(
                '上划线文本',
                style: TextStyle(decoration: TextDecoration.overline),
              ),
              const SizedBox(height: 8),
              Text(
                '组合装饰',
                style: TextStyle(
                  decoration: TextDecoration.combine([TextDecoration.underline, TextDecoration.lineThrough]),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '彩色下划线',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '虚线装饰',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildParagraphStyles(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('段落样式'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '这是一个段落的示例文本。在实际应用中，文本内容可能会很长，需要合理的行高和间距来确保良好的可读性。',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(height: 16),
              const Text(
                '这是一个行高为 1.8 的段落，更大的行高可以提供更好的阅读体验，特别是在移动设备上。',
                style: TextStyle(height: 1.8),
              ),
              const SizedBox(height: 16),
              const Text(
                '这是一个首行缩进的段落示例。在某些场景下，比如文章正文，首行缩进可以提升文本的正式感和可读性。',
                style: TextStyle(height: 1.6),
              ),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, height: 1.5),
                  children: [
                    TextSpan(
                      text: '这是一个富文本示例，',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: '可以包含不同的样式',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '，',
                    ),
                    TextSpan(
                      text: '颜色',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: '，和',
                    ),
                    TextSpan(
                      text: '装饰',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: '。',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}