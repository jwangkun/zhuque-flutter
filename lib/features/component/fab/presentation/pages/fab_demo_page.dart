import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

class FabDemoPage extends StatefulWidget {
  const FabDemoPage({Key? key}) : super(key: key);

  @override
  State<FabDemoPage> createState() => _FabDemoPageState();
}

class _FabDemoPageState extends State<FabDemoPage> {
  bool _showFab1 = true;
  bool _showFab2 = true;
  bool _showFab3 = true;
  bool _showFab4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fab 悬浮按钮'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('基础用法'),
            const SizedBox(height: 16),
            const Text('基础悬浮按钮，点击右下角悬浮按钮查看效果'),
            const SizedBox(height: 24),

            _buildSectionTitle('不同类型'),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _showFab1 = !_showFab1),
                  child: Text(_showFab1 ? '隐藏基础Fab' : '显示基础Fab'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _showFab2 = !_showFab2),
                  child: Text(_showFab2 ? '隐藏迷你Fab' : '显示迷你Fab'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _showFab3 = !_showFab3),
                  child: Text(_showFab3 ? '隐藏扩展Fab' : '显示扩展Fab'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('自定义样式'),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _showFab4 = !_showFab4),
                  child: Text(_showFab4 ? '隐藏自定义Fab' : '显示自定义Fab'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('功能说明'),
            const SizedBox(height: 16),
            const FeatureCard(
              title: '悬浮按钮特点',
              features: [
                '支持多种位置和尺寸',
                '可自定义图标和颜色',
                '支持扩展菜单模式',
                '自动隐藏和显示动画',
                '响应式交互设计',
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          if (_showFab1)
            Positioned(
              right: 16,
              bottom: 100,
              child: TnFab(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('基础Fab被点击')),
                ),
                child: const Icon(Icons.add),
              ),
            ),
          if (_showFab2)
            Positioned(
              right: 16,
              bottom: 170,
              child: TnFab(
                size: FabSize.mini,
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('迷你Fab被点击')),
                ),
                child: const Icon(Icons.edit),
              ),
            ),
          if (_showFab3)
            Positioned(
              right: 16,
              bottom: 240,
              child: TnFab(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('扩展Fab被点击')),
                ),
                child: const Icon(Icons.navigation),
                label: '导航',
                extended: true,
              ),
            ),
          if (_showFab4)
            Positioned(
              right: 16,
              bottom: 320,
              child: TnFab(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('自定义Fab被点击')),
                ),
                child: const Icon(Icons.favorite),
                backgroundColor: AppColors.danger,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.grayDarker,
      ),
    );
  }
}

// Fab悬浮按钮实现
enum FabSize { normal, mini }
enum FabPosition { rightBottom, leftBottom, rightTop, leftTop, center }

class TnFab extends StatefulWidget {
 final Widget child;
  final VoidCallback? onPressed;
  final FabSize size;
  final FabPosition position;
  final bool autoHide;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final ShapeBorder? shape;
  final String? label;
  final bool extended;
  final double elevation;
  final double? customSize;
  final Duration animationDuration;
  final Curve animationCurve;

  const TnFab({
    Key? key,
    required this.child,
    this.onPressed,
    this.size = FabSize.normal,
    this.position = FabPosition.rightBottom,
    this.autoHide = false,
    this.backgroundColor,
    this.foregroundColor,
    this.shape,
    this.label,
    this.extended = false,
    this.elevation = 6.0,
    this.customSize,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
  }) : super(key: key);

  @override
  State<TnFab> createState() => _TnFabState();
}

class _TnFabState extends State<TnFab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.animationCurve,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  double _getFabSize() {
    if (widget.customSize != null) return widget.customSize!;

    switch (widget.size) {
      case FabSize.mini:
        return 40.0;
      case FabSize.normal:
      default:
        return 56.0;
    }
  }

  EdgeInsets _getPositionInsets() {
    const double padding = 16.0;

    switch (widget.position) {
      case FabPosition.rightBottom:
        return const EdgeInsets.only(right: padding, bottom: padding);
      case FabPosition.leftBottom:
        return const EdgeInsets.only(left: padding, bottom: padding);
      case FabPosition.rightTop:
        return const EdgeInsets.only(right: padding, top: padding);
      case FabPosition.leftTop:
        return const EdgeInsets.only(left: padding, top: padding);
      case FabPosition.center:
        return const EdgeInsets.all(padding);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fabSize = _getFabSize();

    Widget fab = AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: widget.extended && widget.label != null
          ? FloatingActionButton.extended(
              onPressed: widget.onPressed,
              backgroundColor: widget.backgroundColor,
              foregroundColor: widget.foregroundColor,
              shape: widget.shape,
              elevation: widget.elevation,
              icon: widget.child,
              label: Text(widget.label!),
            )
          : FloatingActionButton(
              onPressed: widget.onPressed,
              backgroundColor: widget.backgroundColor,
              foregroundColor: widget.foregroundColor,
              shape: widget.shape,
              elevation: widget.elevation,
              child: widget.child,
            ),
    );

    return Container(
      margin: _getPositionInsets(),
      width: widget.extended ? null : fabSize,
      height: fabSize,
      child: fab,
    );
  }
}

// 扩展Fab菜单组件
class TnFabMenu extends StatefulWidget {
  final List<FabMenuItem> items;
  final Widget mainFab;
  final FabPosition position;
  final Duration animationDuration;
  final Curve animationCurve;
  final double spacing;
  final bool autoClose;

  const TnFabMenu({
    Key? key,
    required this.items,
    required this.mainFab,
    this.position = FabPosition.rightBottom,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.spacing = 16.0,
    this.autoClose = true,
  }) : super(key: key);

  @override
  State<TnFabMenu> createState() => _TnFabMenuState();
}

class _TnFabMenuState extends State<TnFabMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // 菜单项
        ...List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          return AnimatedPositioned(
            duration: widget.animationDuration,
            curve: widget.animationCurve,
            right: _isExpanded ? 16 : 0,
            bottom: _isExpanded ? 100 + (index * 60) : 16,
            child: AnimatedOpacity(
              duration: widget.animationDuration,
              opacity: _isExpanded ? 1.0 : 0.0,
              child: FloatingActionButton(
                heroTag: 'fab_menu_$index',
                onPressed: () {
                  item.onPressed();
                  if (widget.autoClose) {
                    _toggleMenu();
                  }
                },
                backgroundColor: item.backgroundColor,
                mini: true,
                child: item.child,
              ),
            ),
          );
        }),

        // 主悬浮按钮
        TnFab(
          onPressed: _toggleMenu,
          child: AnimatedRotation(
            duration: widget.animationDuration,
            turns: _isExpanded ? 0.125 : 0,
            child: widget.mainFab,
          ),
        ),
      ],
    );
  }
}

class FabMenuItem {
  final Widget child;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final String? tooltip;

  FabMenuItem({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.tooltip,
  });
}

// 演示用的FeatureCard组件
class FeatureCard extends StatelessWidget {
  final String title;
  final List<String> features;

  const FeatureCard({
    Key? key,
    required this.title,
    required this.features,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grayLightest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.grayDarker,
            ),
          ),
          const SizedBox(height: 8),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 14, color: AppColors.success),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    feature,
                    style: const TextStyle(fontSize: 12, color: AppColors.gray),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}