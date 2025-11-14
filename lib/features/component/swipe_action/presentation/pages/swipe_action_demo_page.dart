import 'package:flutter/material.dart';
import 'package:tuniao/core/theme/app_colors.dart';

class SwipeActionDemoPage extends StatefulWidget {
  const SwipeActionDemoPage({Key? key}) : super(key: key);

  @override
  State<SwipeActionDemoPage> createState() => _SwipeActionDemoPageState();
}

class _SwipeActionDemoPageState extends State<SwipeActionDemoPage> {
  final List<Map<String, dynamic>> _items = List.generate(10, (index) => {
    return {
      'id': index,
      'title': '列表项 ${index + 1}',
      'subtitle': '这是列表项 ${index + 1} 的描述信息',
      'isRead': index % 2 == 0,
    };
  });

  void _handleDelete(int index) {
    setState(() {
      _items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('已删除 ${_items[index]['title']}')),
    );
  }

  void _handleArchive(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('已归档 ${_items[index]['title']}')),
    );
  }

  void _handleMarkAsRead(int index) {
    setState(() {
      _items[index]['isRead'] = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('已标记为已读')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SwipeAction 滑动菜单'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.gray1,
            child: Row(
              children: [
                Icon(Icons.info_outline, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '向左滑动列表项查看操作菜单，向右滑动可以执行其他操作',
                    style: TextStyle(color: AppColors.gray6, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return TnSwipeAction(
                  key: ValueKey(item['id']),
                  actions: [
                    SwipeActionItem(
                      label: '删除',
                      icon: Icons.delete_outline,
                      color: AppColors.danger,
                      onTap: () => _handleDelete(index),
                    ),
                    SwipeActionItem(
                      label: '归档',
                      icon: Icons.archive_outlined,
                      color: AppColors.warning,
                      onTap: () => _handleArchive(index),
                    ),
                    SwipeActionItem(
                      label: '标记',
                      icon: Icons.mark_email_read_outlined,
                      color: AppColors.success,
                      onTap: () => _handleMarkAsRead(index),
                    ),
                  ],
                  leftActions: [
                    SwipeActionItem(
                      label: '收藏',
                      icon: Icons.star_outline,
                      color: AppColors.primary,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('已收藏 ${item['title']}')),
                        );
                      },
                    ),
                  ],
                  child: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: item['isRead']
                            ? AppColors.primary.withOpacity(0.1)
                            : AppColors.warning.withOpacity(0.1),
                        child: Icon(
                          item['isRead'] ? Icons.mail_outline : Icons.markunread,
                          color: item['isRead'] ? AppColors.primary : AppColors.warning,
                        ),
                      ),
                      title: Text(
                        item['title'],
                        style: TextStyle(
                          fontWeight: item['isRead'] ? FontWeight.normal : FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(item['subtitle']),
                      trailing: const Icon(Icons.chevron_left, color: AppColors.gray4),
                    ),
                  ),
                );
              },
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
        color: AppColors.gray8,
      ),
    );
  }
}

// SwipeAction滑动菜单组件实现
class TnSwipeAction extends StatefulWidget {
  final Widget child;
  final List<SwipeActionItem> actions;
  final List<SwipeActionItem> leftActions;
  final double actionWidth;
  final double actionExtentRatio;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool closeOnTap;
  final bool closeOnScroll;
  final double dismissThreshold;
  final void Function()? onDismissed;

  const TnSwipeAction({
    Key? key,
    required this.child,
    this.actions = const [],
    this.leftActions = const [],
    this.actionWidth = 80,
    this.actionExtentRatio = 0.3,
    this.animationDuration = const Duration(milliseconds: 250),
    this.animationCurve = Curves.easeOutCubic,
    this.closeOnTap = true,
    this.closeOnScroll = true,
    this.dismissThreshold = 0.7,
    this.onDismissed,
  }) : super(key: key);

  @override
  State<TnSwipeAction> createState() => _TnSwipeActionState();
}

class _TnSwipeActionState extends State<TnSwipeAction>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _dragExtent = 0.0;
  double _maxDragExtent = 0.0;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.animationCurve,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDragStart(DragStartDetails details) {
    _maxDragExtent = widget.actions.length * widget.actionWidth;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final delta = details.primaryDelta ?? 0;
    _dragExtent += delta;

    // 限制拖拽范围
    if (_dragExtent > 0) {
      _dragExtent = 0; // 不允许向右拖拽超过起始位置
    } else if (_dragExtent.abs() > _maxDragExtent) {
      _dragExtent = -_maxDragExtent;
    }

    setState(() {});
  }

  void _handleDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    final shouldOpen = _dragExtent.abs() > _maxDragExtent * 0.3 || velocity.abs() > 100;

    if (shouldOpen) {
      _open();
    } else {
      _close();
    }
  }

  void _open() {
    setState(() {
      _isOpen = true;
      _dragExtent = -_maxDragExtent;
    });
  }

  void _close() {
    setState(() {
      _isOpen = false;
      _dragExtent = 0;
    });
  }

  void _handleActionTap(VoidCallback onTap) {
    onTap();
    if (widget.closeOnTap) {
      _close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: Stack(
        children: [
          // 背景操作按钮
          Positioned.fill(
            child: Row(
              children: [
                // 左侧操作按钮
                if (widget.leftActions.isNotEmpty)
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: widget.leftActions.map((action) {
                          return _buildActionButton(action, true);
                        }).toList(),
                      ),
                    ),
                  ),
                const Spacer(),
                // 右侧操作按钮
                if (widget.actions.isNotEmpty)
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: widget.actions.map((action) {
                          return _buildActionButton(action, false);
                        }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // 主内容
          Transform.translate(
            offset: Offset(_dragExtent, 0),
            child: widget.child,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(SwipeActionItem action, bool isLeft) {
    return GestureDetector(
      onTap: () => _handleActionTap(action.onTap),
      child: Container(
        width: widget.actionWidth,
        height: double.infinity,
        color: action.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(action.icon, color: Colors.white, size: 24),
            if (action.label.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                action.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SwipeActionItem {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  SwipeActionItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}

// 简化的滑动操作组件
class TnSimpleSwipeAction extends StatelessWidget {
  final Widget child;
  final List<SwipeActionItem> actions;
  final double actionWidth;

  const TnSimpleSwipeAction({
    Key? key,
    required this.child,
    this.actions = const [],
    this.actionWidth = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: AppColors.danger,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: AppColors.primary,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: const Icon(Icons.archive, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          // 删除操作
          return true;
        } else if (direction == DismissDirection.startToEnd) {
          // 归档操作
          return true;
        }
        return false;
      },
      onDismissed: (direction) {
        if (actions.isNotEmpty) {
          actions[0].onTap();
        }
      },
      child: child,
    );
  }
}

// 滑动操作控制器
class SwipeActionController {
  final Map<Key, _TnSwipeActionState> _states = {};

  void closeAll() {
    _states.forEach((key, state) {
      state._close();
    });
  }

  void open(Key key) {
    final state = _states[key];
    state?._open();
  }

  void close(Key key) {
    final state = _states[key];
    state?._close();
  }

  void register(Key key, _TnSwipeActionState state) {
    _states[key] = state;
  }

  void unregister(Key key) {
    _states.remove(key);
  }
}

// 全局滑动操作管理器
class SwipeActionManager {
  static final SwipeActionController _controller = SwipeActionController();

  static SwipeActionController get instance => _controller;

  static void closeAll() {
    _controller.closeAll();
  }

  static void open(Key key) {
    _controller.open(key);
  }

  static void close(Key key) {
    _controller.close(key);
  }

  static void register(Key key, _TnSwipeActionState state) {
    _controller.register(key, state);
  }

  static void unregister(Key key) {
    _controller.unregister(key);
  }
}

// 使用示例的演示页面
class SwipeActionExamplePage extends StatelessWidget {
  const SwipeActionExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => '示例项目 ${index + 1}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('滑动操作示例'),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return TnSimpleSwipeAction(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(items[index]),
                subtitle: Text('这是${items[index]}的描述信息'),
                leading: Icon(Icons.item, color: AppColors.primary),
              ),
            ),
            actions: [
              SwipeActionItem(
                label: '删除',
                icon: Icons.delete,
                color: AppColors.danger,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('删除了 ${items[index]}')),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}