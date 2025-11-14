import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 颜色演示组件
class ColorDemoPage extends StatelessWidget {
  const ColorDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('配色'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '主色调'),
            const SizedBox(height: 12),
            _buildColorGrid([
              ColorInfo('主色', AppColors.primary, '#00A870'),
              ColorInfo('主色-浅', AppColors.primaryLight, '#5CDBD3'),
              ColorInfo('主色-深', AppColors.primaryDark, '#009A6A'),
              ColorInfo('主色-浅淡', AppColors.primaryLightest, '#DDF8F0'),
            ]),
            const SizedBox(height: 24),

            _buildSectionTitle(context, '辅助色'),
            const SizedBox(height: 12),
            _buildColorGrid([
              ColorInfo('辅色', AppColors.secondary, '#1E9FFF'),
              ColorInfo('辅色-深', AppColors.secondaryDark, '#198CFF'),
            ]),
            const SizedBox(height: 24),

            _buildSectionTitle(context, '功能色'),
            const SizedBox(height: 12),
            _buildColorGrid([
              ColorInfo('成功色', AppColors.success, '#5CB85C'),
              ColorInfo('警告色', AppColors.warning, '#F0AD4E'),
              ColorInfo('警告色-深', AppColors.warningDark, '#EBA63A'),
              ColorInfo('危险色', AppColors.danger, '#DD524D'),
              ColorInfo('危险色-深', AppColors.dangerDark, '#B9221E'),
            ]),
            const SizedBox(height: 24),

            _buildSectionTitle(context, '中性色'),
            const SizedBox(height: 12),
            _buildColorGrid([
              ColorInfo('纯白色', AppColors.white, '#FFFFFF'),
              ColorInfo('白色-暗', AppColors.whiteDark, '#FAFAFA'),
              ColorInfo('浅灰-极浅', AppColors.grayLightest, '#F5F5F5'),
              ColorInfo('浅灰-很浅', AppColors.grayLighter, '#F0F0F0'),
              ColorInfo('浅灰', AppColors.grayLight, '#E5E5E5'),
              ColorInfo('浅灰-浅', AppColors.grayLightish, '#D8D8D8'),
              ColorInfo('灰色', AppColors.gray, '#CCCCCC'),
              ColorInfo('灰-深', AppColors.grayDarkish, '#BBBBBB'),
              ColorInfo('灰色-深', AppColors.grayDark, '#999999'),
              ColorInfo('灰色-很深', AppColors.grayDarker, '#666666'),
              ColorInfo('灰色-极深', AppColors.grayDarkest, '#333333'),
              ColorInfo('浅黑色', AppColors.blackLight, '#222222'),
              ColorInfo('黑色', AppColors.black, '#000000'),
            ]),
            const SizedBox(height: 24),

            _buildSectionTitle(context, '渐变色'),
            const SizedBox(height: 12),
            _buildGradientGrid([
              GradientInfo('主色渐变', AppColors.primaryGradient),
              GradientInfo('主色渐变-反向', AppColors.primaryGradientReverse),
              GradientInfo('辅色渐变', AppColors.secondaryGradient),
              GradientInfo('成功色渐变', AppColors.successGradient),
              GradientInfo('警告色渐变', AppColors.warningGradient),
              GradientInfo('危险色渐变', AppColors.dangerGradient),
            ]),
            const SizedBox(height: 24),

            _buildSectionTitle(context, '文本色'),
            const SizedBox(height: 12),
            _buildColorGrid([
              ColorInfo('主要文本', AppColors.textPrimary, '#333333'),
              ColorInfo('次要文本', AppColors.textSecondary, '#999999'),
              ColorInfo('辅助文本', AppColors.textTertiary, '#CCCCCC'),
              ColorInfo('反白文本', AppColors.textInverse, '#FFFFFF'),
              ColorInfo('链接主色', AppColors.linkPrimary, '#00A870'),
              ColorInfo('链接辅色', AppColors.linkSecondary, '#1E9FFF'),
            ]),
            const SizedBox(height: 24),
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
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildColorGrid(List<ColorInfo> colors) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final colorInfo = colors[index];
        return _buildColorCard(
          colorInfo.name,
          colorInfo.color,
          colorInfo.hex,
        );
      },
    );
  }

  Widget _buildColorCard(String name, Color color, String hexCode) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 在深色背景上使用白色文字，浅色背景上使用黑色文字
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: _getContrastColor(color).withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: _getContrastColor(color),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  hexCode,
                  style: TextStyle(
                    color: _getContrastColor(color),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientGrid(List<GradientInfo> gradients) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: gradients.length,
      itemBuilder: (context, index) {
        final gradientInfo = gradients[index];
        return Container(
          decoration: BoxDecoration(
            gradient: gradientInfo.gradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Text(
                gradientInfo.name,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // 获取对比色（用于确保文字在背景上可见）
  Color _getContrastColor(Color color) {
    // 计算颜色的亮度
    final brightness = ThemeData.estimateBrightnessForColor(color);
    return brightness == Brightness.dark ? AppColors.white : AppColors.black;
  }
}

class ColorInfo {
  final String name;
  final Color color;
  final String hex;

  ColorInfo(this.name, this.color, this.hex);
}

class GradientInfo {
  final String name;
  final Gradient gradient;

  GradientInfo(this.name, this.gradient);
}
