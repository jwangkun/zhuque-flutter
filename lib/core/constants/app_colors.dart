import 'package:flutter/material.dart';

/// 朱雀UI配色体系
class AppColors {
  // ========== 主色调 ==========

  /// 主色 - 绿色
  static const Color primary = Color(0xFF00A870);

  /// 主色-浅
  static const Color primaryLight = Color(0xFF5CDBD3);

  /// 主色-深
  static const Color primaryDark = Color(0xFF009A6A);

  /// 主色-浅淡
  static const Color primaryLightest = Color(0xFFDDF8F0);

  // ========== 辅助色调 ==========

  /// 辅色 - 蓝色
  static const Color secondary = Color(0xFF1E9FFF);

  /// 辅色-深
  static const Color secondaryDark = Color(0xFF198CFF);

  // ========== 功能色调 ==========

  /// 成功色 - 绿色
  static const Color success = Color(0xFF5CB85C);

  /// 警告色 - 橙色
  static const Color warning = Color(0xFFF0AD4E);

  /// 警告色-深
  static const Color warningDark = Color(0xFFEBA63A);

  /// 危险色 - 红色
  static const Color danger = Color(0xFFDD524D);

  /// 危险色-深
  static const Color dangerDark = Color(0xFFB9221E);

  // ========== 中性色 ==========

  /// 纯白色
  static const Color white = Color(0xFFFFFFFF);

  /// 白色-暗
  static const Color whiteDark = Color(0xFFFAFAFA);

  /// 浅灰-极浅
  static const Color grayLightest = Color(0xFFF5F5F5);

  /// 浅灰-很浅
  static const Color grayLighter = Color(0xFFF0F0F0);

  /// 浅灰
  static const Color grayLight = Color(0xFFE5E5E5);

  /// 浅灰-浅
  static const Color grayLightish = Color(0xFFD8D8D8);

  /// 灰色
  static const Color gray = Color(0xFFCCCCCC);

  /// 灰-深
  static const Color grayDarkish = Color(0xFFBBBBBB);

  /// 灰色-深
  static const Color grayDark = Color(0xFF999999);

  /// 灰色-很深
  static const Color grayDarker = Color(0xFF666666);

  /// 灰色-极深
  static const Color grayDarkest = Color(0xFF333333);

  /// 浅黑色
  static const Color blackLight = Color(0xFF222222);

  /// 黑色
  static const Color black = Color(0xFF000000);

  // ========== 渐变色 ==========

  /// 主色渐变 - 绿色
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF00A870), Color(0xFF5CDBD3)],
  );

  /// 主色渐变-反向
  static const LinearGradient primaryGradientReverse = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF5CDBD3), Color(0xFF00A870)],
  );

  /// 辅色渐变 - 蓝色
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E9FFF), Color(0xFF81D4FA)],
  );

  /// 成功色渐变 - 绿色
  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF5CB85C), Color(0xFF90EE90)],
  );

  /// 警告色渐变 - 橙色
  static const LinearGradient warningGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF0AD4E), Color(0xFFFFD54F)],
  );

  /// 危险色渐变 - 红色
  static const LinearGradient dangerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFDD524D), Color(0xFFFF8A80)],
  );

  // ========== 背景色 ==========

  /// 页面背景色
  static const Color background = Color(0xFFF5F5F5);

  /// 卡片背景色
  static const Color cardBackground = white;

  /// 模态框背景色
  static const Color modalBackground = white;

  // ========== 文本色 ==========

  /// 主要文本色
  static const Color textPrimary = grayDarkest;

  /// 次要文本色
  static const Color textSecondary = grayDark;

  /// 辅助文本色
  static const Color textTertiary = gray;

  /// 反白文本色
  static const Color textInverse = white;

  /// 主要链接色
  static const Color linkPrimary = primary;

  /// 次要链接色
  static const Color linkSecondary = secondary;

  // ========== 边框色 ==========

  /// 边框色
  static const Color border = grayLight;

  /// 边框色-深
  static const Color borderDark = gray;

  /// 分割线颜色
  static const Color divider = grayLight;

  // ========== 遮罩色 ==========

  /// 遮罩层 - 浅色
  static const Color maskLight = Color(0x80000000);

  /// 遮罩层 - 深色
  static const Color maskDark = Color(0xD9000000);

  // ========== 特殊颜色 ==========

  /// 信息色 - 蓝色
  static const Color info = Color(0xFF17A2B8);

  /// 信息色渐变
  static const LinearGradient infoGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF17A2B8), Color(0xFF4FC3F7)],
  );

  /// 禁用色
  static const Color disabled = grayLight;

  /// 禁用文本色
  static const Color disabledText = gray;

  // ========== 透明色 ==========

  /// 全透明
  static const Color transparent = Color(0x00000000);

  // ========== 工具方法 ==========

  /// 根据颜色名称获取颜色
  static Color? getColorByName(String name) {
    final Map<String, Color> colorMap = {
      'primary': primary,
      'primaryLight': primaryLight,
      'primaryDark': primaryDark,
      'secondary': secondary,
      'success': success,
      'warning': warning,
      'danger': danger,
      'white': white,
      'black': black,
      'gray': gray,
      'textPrimary': textPrimary,
      'textSecondary': textSecondary,
    };
    return colorMap[name];
  }

  /// 根据颜色名称获取渐变色
  static LinearGradient? getGradientByName(String name) {
    final Map<String, LinearGradient> gradientMap = {
      'primary': primaryGradient,
      'primaryReverse': primaryGradientReverse,
      'secondary': secondaryGradient,
      'success': successGradient,
      'warning': warningGradient,
      'danger': dangerGradient,
      'info': infoGradient,
    };
    return gradientMap[name];
  }
}
