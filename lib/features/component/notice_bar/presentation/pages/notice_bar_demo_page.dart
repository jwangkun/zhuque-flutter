import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

class NoticeBarDemoPage extends StatefulWidget {
  const NoticeBarDemoPage({Key? key}) : super(key: key);

  @override
  State<NoticeBarDemoPage> createState() => _NoticeBarDemoPageState();
}

class _NoticeBarDemoPageState extends State<NoticeBarDemoPage> {
  bool _showNotice1 = true;
  bool _showNotice2 = true;
  bool _showNotice3 = true;
  bool _showNotice4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoticeBar 通知栏'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            _buildSectionTitle('基础用法'),
            const SizedBox(height: 16),
            if (_showNotice1)
              TnNoticeBar(
                text: '这是一条普通的通知信息，用于向用户展示重要内容',
                onClose: () => setState(() => _showNotice1 = false),
              ),
            const SizedBox(height: 24),

            _buildSectionTitle('通知类型'),
            const SizedBox(height: 16),
            if (_showNotice2)
              TnNoticeBar(
                text: '这是一条信息类型的通知',
                type: NoticeType.info,
                onClose: () => setState(() => _showNotice2 = false),
              ),
            const SizedBox(height: 12),
            if (_showNotice3)
              TnNoticeBar(
                text: '这是一条成功类型的通知，展示操作成功的信息',
                type: NoticeType.success,
                onClose: () => setState(() => _showNotice3 = false),
              ),
            const SizedBox(height: 12),
            if (_showNotice4)
              TnNoticeBar(
                text: '这是一条警告类型的通知，提醒用户注意某些事项',
                type: NoticeType.warning,
                onClose: () => setState(() => _showNotice4 = false),
              ),
            const SizedBox(height: 12),
            TnNoticeBar(
              text: '这是一条错误类型的通知，用于展示错误信息',
              type: NoticeType.error,
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('滚动播放'),
            const SizedBox(height: 16),
            const TnNoticeBar(
              text: '这是一条很长的通知信息，当内容超出容器宽度时会自动滚动播放，确保用户能够看到完整的内容',
              marquee: true,
              speed: Duration(seconds: 8),
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('自定义图标'),
            const SizedBox(height: 16),
            TnNoticeBar(
              text: '使用自定义前缀图标的通知',
              prefixIcon: Icon(Icons.notifications_active, size: 16, color: AppColors.primary),
            ),
            const SizedBox(height: 12),
            TnNoticeBar(
              text: '使用自定义后缀图标的通知',
              suffixIcon: Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.gray),
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('无关闭按钮'),
            const SizedBox(height: 16),
            const TnNoticeBar(
              text: '这条通知没有关闭按钮，用户无法手动关闭',
            ),
          ],
        ),
        ),
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

// 通知栏组件实现
enum NoticeType { info, warning, error, success }

class TnNoticeBar extends StatefulWidget {
  final String text;
  final NoticeType type;
  final bool marquee;
  final Duration speed;
  final VoidCallback? onClose;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  const TnNoticeBar({
    Key? key,
    required this.text,
    this.type = NoticeType.info,
    this.marquee = false,
    this.speed = const Duration(seconds: 10),
    this.onClose,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.textStyle,
  }) : super(key: key);

  @override
  State<TnNoticeBar> createState() => _TnNoticeBarState();
}

class _TnNoticeBarState extends State<TnNoticeBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ScrollController? _scrollController;
  double _textWidth = 0;
  double _containerWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.speed,
      vsync: this,
    );

    if (widget.marquee) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _startMarquee();
      });
    }
  }

  void _startMarquee() {
    if (_textWidth > _containerWidth) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  Color _getBackgroundColor(BuildContext context) {
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    switch (widget.type) {
      case NoticeType.info:
        return AppColors.primary.withOpacity(0.1);
      case NoticeType.warning:
        return AppColors.warning.withOpacity(0.1);
      case NoticeType.error:
        return AppColors.danger.withOpacity(0.1);
      case NoticeType.success:
        return AppColors.success.withOpacity(0.1);
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (widget.type) {
      case NoticeType.info:
        return AppColors.primary;
      case NoticeType.warning:
        return AppColors.warning;
      case NoticeType.error:
        return AppColors.danger;
      case NoticeType.success:
        return AppColors.success;
    }
  }

  Widget _getIcon(BuildContext context) {
    if (widget.prefixIcon != null) return widget.prefixIcon!;

    switch (widget.type) {
      case NoticeType.info:
        return Icon(Icons.info_outline, size: 16, color: AppColors.primary);
      case NoticeType.warning:
        return Icon(Icons.warning_amber, size: 16, color: AppColors.warning);
      case NoticeType.error:
        return Icon(Icons.error_outline, size: 16, color: AppColors.danger);
      case NoticeType.success:
        return Icon(Icons.check_circle_outline, size: 16, color: AppColors.success);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _getBackgroundColor(context),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _getIcon(context),
          const SizedBox(width: 8),
          Expanded(
            child: widget.marquee
                ? _buildMarqueeText()
                : Text(
                    widget.text,
                    style: (widget.textStyle ?? Theme.of(context).textTheme.bodyMedium)
                        ?.copyWith(color: _getTextColor(context)),
                  ),
          ),
          if (widget.suffixIcon != null) ...[
            const SizedBox(width: 8),
            widget.suffixIcon!,
          ],
          if (widget.onClose != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: widget.onClose,
              child: Icon(
                Icons.close,
                size: 16,
                color: _getTextColor(context),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMarqueeText() {
    return LayoutBuilder(
      builder: (context, constraints) {
        _containerWidth = constraints.maxWidth;
        return SizedBox(
          width: _containerWidth, // 限制宽度
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            physics: const ClampingScrollPhysics(), // 防止过度滚动
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-_controller.value * (_textWidth + _containerWidth), 0),
                  child: child,
                );
              },
              child: Text(
                widget.text,
                style: (widget.textStyle ?? Theme.of(context).textTheme.bodyMedium)
                    ?.copyWith(color: _getTextColor(context)),
              ),
            ),
          ),
        );
      },
    );
  }
}