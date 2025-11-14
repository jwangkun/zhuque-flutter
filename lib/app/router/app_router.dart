import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/basic/color/presentation/pages/color_demo_page.dart';
import '../../features/basic/icon/presentation/pages/icon_demo_page.dart';
import '../../features/basic/button/presentation/pages/button_demo_page.dart';
import '../../features/basic/typography/presentation/pages/typography_demo_page.dart';
import '../../features/basic/shadow/presentation/pages/shadow_demo_page.dart';
import '../../features/basic/border/presentation/pages/border_demo_page.dart';
import '../../features/basic/flex/presentation/pages/flex_demo_page.dart';
import '../../features/basic/title/presentation/pages/title_demo_page.dart';
import '../../features/component/presentation/pages/component_index_page.dart';
import '../../features/component/form/presentation/pages/form_demo_page.dart';
import '../../features/component/navigation/presentation/pages/navigation_demo_page.dart';
import '../../features/component/data_display/presentation/pages/data_display_demo_page.dart';
import '../../features/component/feedback/presentation/pages/feedback_demo_page.dart';
import '../../features/component/loading/presentation/pages/loading_demo_page.dart';
import '../../features/component/overlay/presentation/pages/overlay_demo_page.dart';
import '../../features/component/layout/presentation/pages/layout_demo_page.dart';
import '../../features/index/presentation/pages/index_page.dart';
import '../../features/template/presentation/pages/template_index_page.dart';
import '../../features/about/presentation/pages/about_page.dart';

/// 应用路由配置
class AppRoutes {
  static const String index = '/';
  static const String basic = '/basic';
  static const String component = '/component';
  static const String template = '/template';
  static const String about = '/about';

  // 基础组件
  static const String color = '/basic/color';
  static const String icon = '/basic/icon';
  static const String button = '/basic/button';
  static const String typography = '/basic/typography';
  static const String border = '/basic/border';
  static const String shadow = '/basic/shadow';
  static const String flex = '/basic/flex';
  static const String title = '/basic/title';

  // 组件演示
  static const String list = '/component/list';
  static const String navbar = '/component/navbar';
  static const String tabs = '/component/tabs';
  static const String sticky = '/component/sticky';
  static const String noticeBar = '/component/notice-bar';
  static const String swiper = '/component/swiper';
  static const String collapse = '/component/collapse';
  static const String swipeCell = '/component/swipe-cell';
  static const String shareSheet = '/component/share-sheet';
  static const String pullRefresh = '/component/pull-refresh';
  static const String toast = '/component/toast';
  static const String modal = '/component/modal';
  static const String popup = '/component/popup';
  static const String form = '/component/form';
  static const String input = '/component/input';
  static const String radio = '/component/radio';
  static const String checkbox = '/component/checkbox';
  static const String rate = '/component/rate';
  static const String slider = '/component/slider';
  static const String stepper = '/component/stepper';
  static const String uploader = '/component/uploader';
  static const String calendar = '/component/calendar';
  static const String cascader = '/component/cascader';
  static const String datetimePicker = '/component/datetime-picker';
  static const String picker = '/component/picker';
  static const String progress = '/component/progress';
  static const String skeleton = '/component/skeleton';
  static const String tag = '/component/tag';
  static const String badge = '/component/badge';
  static const String empty = '/component/empty';
  static const String grid = '/component/grid';
  static const String navBar = '/component/nav-bar';
  static const String pagination = '/component/pagination';
  static const String sideBar = '/component/side-bar';
  static const String tabBar = '/component/tab-bar';
  static const String treeSelect = '/component/tree-select';
  static const String addressList = '/component/address-list';
  static const String card = '/component/card';
  static const String cell = '/component/cell';
  static const String image = '/component/image';
  static const String table = '/component/table';
  static const String actionSheet = '/component/action-sheet';
  static const String dialog = '/component/dialog';
  static const String divider = '/component/divider';
  static const String floatingPanel = '/component/floating-panel';
  static const String loading = '/component/loading';
  static const String notify = '/component/notify';
  static const String overlay = '/component/overlay';
}

/// 导航项
class NavigationItem {
  final String path;
  final String label;
  final IconData icon;

  const NavigationItem({
    required this.path,
    required this.label,
    required this.icon,
  });
}

/// 底部导航项
final List<NavigationItem> bottomNavItems = const [
  NavigationItem(
    path: AppRoutes.index,
    label: '基础',
    icon: Icons.palette,
  ),
  NavigationItem(
    path: AppRoutes.component,
    label: '组件',
    icon: Icons.widgets,
  ),
  NavigationItem(
    path: AppRoutes.template,
    label: '模板',
    icon: Icons.dashboard,
  ),
  NavigationItem(
    path: AppRoutes.about,
    label: '关于',
    icon: Icons.info,
  ),
];

/// 路由配置
final GoRouter router = GoRouter(
  initialLocation: AppRoutes.index,
  routes: [
    // ShellRoute 用于保持底部导航栏
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MainScaffold(child: child);
      },
      routes: [
        // 首页
        GoRoute(
          path: AppRoutes.index,
          builder: (BuildContext context, GoRouterState state) {
            return const IndexPage();
          },
        ),

        // 基础组件路由（独立路由）
        GoRoute(
          path: AppRoutes.color,
          name: 'color',
          builder: (BuildContext context, GoRouterState state) {
            return const ColorDemoPage();
          },
        ),
        GoRoute(
          path: AppRoutes.icon,
          name: 'icon',
          builder: (BuildContext context, GoRouterState state) {
            return const IconDemoPage();
          },
        ),
        GoRoute(
          path: AppRoutes.button,
          name: 'button',
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonDemoPage();
          },
        ),
        GoRoute(
          path: AppRoutes.typography,
          name: 'typography',
          builder: (BuildContext context, GoRouterState state) {
            return const TypographyDemoPage();
          },
        ),
        GoRoute(
          path: AppRoutes.shadow,
          name: 'shadow',
          builder: (BuildContext context, GoRouterState state) {
            return const ShadowDemoPage();
          },
        ),
        GoRoute(
          path: AppRoutes.border,
          name: 'border',
          builder: (BuildContext context, GoRouterState state) {
            return const BorderDemoPage();
          },
        ),
        GoRoute(
          path: AppRoutes.flex,
          name: 'flex',
          builder: (BuildContext context, GoRouterState state) {
            return const FlexDemoPage();
          },
        ),
        GoRoute(
          path: AppRoutes.title,
          name: 'title',
          builder: (BuildContext context, GoRouterState state) {
            return const TitleDemoPage();
          },
        ),

        /// 组件
        GoRoute(
          path: AppRoutes.component,
          builder: (BuildContext context, GoRouterState state) {
            return const ComponentIndexPage();
          },
          routes: [
            GoRoute(
              path: 'form',
              name: 'form',
              builder: (BuildContext context, GoRouterState state) {
                return const FormDemoPage();
              },
            ),
            GoRoute(
              path: 'navigation',
              name: 'navigation',
              builder: (BuildContext context, GoRouterState state) {
                return const NavigationDemoPage();
              },
            ),
            GoRoute(
              path: 'data-display',
              name: 'data-display',
              builder: (BuildContext context, GoRouterState state) {
                return const DataDisplayDemoPage();
              },
            ),
            GoRoute(
              path: 'feedback',
              name: 'feedback',
              builder: (BuildContext context, GoRouterState state) {
                return const FeedbackDemoPage();
              },
            ),
            GoRoute(
              path: 'loading',
              name: 'loading',
              builder: (BuildContext context, GoRouterState state) {
                return const LoadingDemoPage();
              },
            ),
            GoRoute(
              path: 'overlay',
              name: 'overlay',
              builder: (BuildContext context, GoRouterState state) {
                return const OverlayDemoPage();
              },
            ),
            GoRoute(
              path: 'layout',
              name: 'layout',
              builder: (BuildContext context, GoRouterState state) {
                return const LayoutDemoPage();
              },
            ),
            // 基础组件
            GoRoute(
              path: 'button',
              name: 'component-button',
              builder: (BuildContext context, GoRouterState state) {
                return const ButtonDemoPage();
              },
            ),
            GoRoute(
              path: 'icon',
              name: 'component-icon',
              builder: (BuildContext context, GoRouterState state) {
                return const IconDemoPage();
              },
            ),
            GoRoute(
              path: 'color',
              name: 'component-color',
              builder: (BuildContext context, GoRouterState state) {
                return const ColorDemoPage();
              },
            ),
            GoRoute(
              path: 'typography',
              name: 'component-typography',
              builder: (BuildContext context, GoRouterState state) {
                return const TypographyDemoPage();
              },
            ),
            GoRoute(
              path: 'border',
              name: 'component-border',
              builder: (BuildContext context, GoRouterState state) {
                return const BorderDemoPage();
              },
            ),
            GoRoute(
              path: 'shadow',
              name: 'component-shadow',
              builder: (BuildContext context, GoRouterState state) {
                return const ShadowDemoPage();
              },
            ),
            GoRoute(
              path: 'flex',
              name: 'component-flex',
              builder: (BuildContext context, GoRouterState state) {
                return const FlexDemoPage();
              },
            ),
            GoRoute(
              path: 'title',
              name: 'component-title',
              builder: (BuildContext context, GoRouterState state) {
                return const TitleDemoPage();
              },
            ),
          ],
        ),

        /// 模板
        GoRoute(
          path: AppRoutes.template,
          builder: (BuildContext context, GoRouterState state) {
            return const TemplateIndexPage();
          },
        ),

        /// 关于
        GoRoute(
          path: AppRoutes.about,
          builder: (BuildContext context, GoRouterState state) {
            return const AboutPage();
          },
        ),
      ],
    ),
  ],
);

/// 主脚手架，包含底部导航栏
class MainScaffold extends StatefulWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    // 根据当前路由确定选中项
    if (location.startsWith(AppRoutes.index)) {
      _currentIndex = 0;
    } else if (location.startsWith(AppRoutes.component)) {
      _currentIndex = 1;
    } else if (location.startsWith(AppRoutes.template)) {
      _currentIndex = 2;
    } else if (location.startsWith(AppRoutes.about)) {
      _currentIndex = 3;
    }

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          final NavigationItem item = bottomNavItems[index];
          context.go(item.path);
        },
        items: bottomNavItems.map((NavigationItem item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          );
        }).toList(),
      ),
    );
  }
}
