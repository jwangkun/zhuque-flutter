import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/theme/app_colors.dart';

class IndexListDemoPage extends StatefulWidget {
  const IndexListDemoPage({Key? key}) : super(key: key);

  @override
  State<IndexListDemoPage> createState() => _IndexListDemoPageState();
}

class _IndexListDemoPageState extends State<IndexListDemoPage> {
  final Map<String, List<Map<String, String>>> _contactData = {
    'A': [
      {'name': '艾丽丝', 'phone': '13800138001'},
      {'name': '艾伦', 'phone': '13800138002'},
      {'name': '艾米', 'phone': '13800138003'},
    ],
    'B': [
      {'name': '鲍勃', 'phone': '13800138004'},
      {'name': '贝蒂', 'phone': '13800138005'},
      {'name': '布莱恩', 'phone': '13800138006'},
    ],
    'C': [
      {'name': '查理', 'phone': '13800138007'},
      {'name': '卡罗尔', 'phone': '13800138008'},
      {'name': '克里斯', 'phone': '13800138009'},
    ],
    'D': [
      {'name': '大卫', 'phone': '13800138010'},
      {'name': '黛安娜', 'phone': '13800138011'},
      {'name': '丹尼尔', 'phone': '13800138012'},
    ],
    'E': [
      {'name': '艾玛', 'phone': '13800138013'},
      {'name': '埃里克', 'phone': '13800138014'},
      {'name': '伊芙琳', 'phone': '13800138015'},
    ],
    'F': [
      {'name': '弗兰克', 'phone': '13800138016'},
      {'name': '菲奥娜', 'phone': '13800138017'},
      {'name': '弗雷德', 'phone': '13800138018'},
    ],
    'G': [
      {'name': '乔治', 'phone': '13800138019'},
      {'name': '格蕾丝', 'phone': '13800138020'},
      {'name': '加文', 'phone': '13800138021'},
    ],
    'H': [
      {'name': '海伦', 'phone': '13800138022'},
      {'name': '亨利', 'phone': '13800138023'},
      {'name': '汉娜', 'phone': '13800138024'},
    ],
    'J': [
      {'name': '杰克', 'phone': '13800138025'},
      {'name': '简', 'phone': '13800138026'},
      {'name': '詹姆斯', 'phone': '13800138027'},
    ],
    'K': [
      {'name': '凯特', 'phone': '13800138028'},
      {'name': '凯文', 'phone': '13800138029'},
      {'name': '凯莉', 'phone': '13800138030'},
    ],
    'L': [
      {'name': '莉莉', 'phone': '13800138031'},
      {'name': '利奥', 'phone': '13800138032'},
      {'name': '露西', 'phone': '13800138033'},
    ],
    'M': [
      {'name': '迈克', 'phone': '13800138034'},
      {'name': '玛丽', 'phone': '13800138035'},
      {'name': '马克', 'phone': '13800138036'},
    ],
    'N': [
      {'name': '南希', 'phone': '13800138037'},
      {'name': '尼尔', 'phone': '13800138038'},
      {'name': '妮娜', 'phone': '13800138039'},
    ],
    'O': [
      {'name': '奥利弗', 'phone': '13800138040'},
      {'name': '奥利维亚', 'phone': '13800138041'},
      {'name': '奥斯卡', 'phone': '13800138042'},
    ],
    'P': [
      {'name': '帕特里克', 'phone': '13800138043'},
      {'name': '保拉', 'phone': '13800138044'},
      {'name': '彼得', 'phone': '13800138045'},
    ],
    'Q': [
      {'name': '昆汀', 'phone': '13800138046'},
      {'name': '奎因', 'phone': '13800138047'},
      {'name': '奎因', 'phone': '13800138048'},
    ],
    'R': [
      {'name': '瑞秋', 'phone': '13800138049'},
      {'name': '罗伯特', 'phone': '13800138050'},
      {'name': '罗斯', 'phone': '13800138051'},
    ],
    'S': [
      {'name': '萨拉', 'phone': '13800138052'},
      {'name': '萨姆', 'phone': '13800138053'},
      {'name': '索菲亚', 'phone': '13800138054'},
    ],
    'T': [
      {'name': '汤姆', 'phone': '13800138055'},
      {'name': '蒂娜', 'phone': '13800138056'},
      {'name': '泰勒', 'phone': '13800138057'},
    ],
    'W': [
      {'name': '威廉', 'phone': '13800138058'},
      {'name': '温蒂', 'phone': '13800138059'},
      {'name': '韦斯利', 'phone': '13800138060'},
    ],
    'X': [
      {'name': '泽维尔', 'phone': '13800138061'},
      {'name': '谢莉', 'phone': '13800138062'},
      {'name': '肖恩', 'phone': '13800138063'},
    ],
    'Y': [
      {'name': '伊薇特', 'phone': '13800138064'},
      {'name': '伊冯娜', 'phone': '13800138065'},
      {'name': '亚伦', 'phone': '13800138066'},
    ],
    'Z': [
      {'name': '扎克', 'phone': '13800138067'},
      {'name': '佐伊', 'phone': '13800138068'},
      {'name': '赞恩', 'phone': '13800138069'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexList 索引列表'),
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: [
          // 主列表区域
          Expanded(
            child: TnIndexList(
              data: _contactData,
              itemBuilder: (context, item) => _buildContactItem(item),
              onItemTap: (item) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('点击了 ${item['name']}')),
                );
              },
              header: Container(
                padding: const EdgeInsets.all(16),
                color: AppColors.gray1,
                child: Row(
                  children: [
                    Icon(Icons.search, color: AppColors.gray6),
                    const SizedBox(width: 12),
                    Text(
                      '搜索联系人',
                      style: TextStyle(color: AppColors.gray6),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 索引侧边栏
          Container(
            width: 32,
            color: AppColors.gray1,
            child: TnIndexSidebar(
              data: _contactData,
              onIndexTap: (letter) {
                // 滚动到指定字母位置
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(Map<String, String> item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gray3),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary.withValues(opacity: 0.1),
            child: Text(
              item['name']!.substring(0, 1),
              style: TextStyle(color: AppColors.primary),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['phone']!,
                  style: TextStyle(
                    color: AppColors.gray6,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.phone, color: AppColors.success),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('正在拨打 ${item['phone']}')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.message, color: AppColors.primary),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('正在发送短信给 ${item['phone']}')),
              );
            },
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

// 索引列表组件实现
class TnIndexList extends StatefulWidget {
  final Map<String, List<dynamic>> data;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final void Function(dynamic)? onItemTap;
  final Widget? header;
  final Widget? footer;
  final ScrollController? controller;
  final double itemExtent;

  const TnIndexList({
    Key? key,
    required this.data,
    required this.itemBuilder,
    this.onItemTap,
    this.header,
    this.footer,
    this.controller,
    this.itemExtent = 60.0,
  }) : super(key: key);

  @override
  State<TnIndexList> createState() => _TnIndexListState();
}

class _TnIndexListState extends State<TnIndexList> {
  late ScrollController _controller;
  final Map<String, double> _sectionOffsets = {};

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ScrollController();

    // 计算每个分区的偏移量
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateSectionOffsets();
    });
  }

  void _calculateSectionOffsets() {
    double offset = 0;
    if (widget.header != null) {
      offset += 60; // 假设header高度为60
    }

    widget.data.forEach((letter, items) {
      _sectionOffsets[letter] = offset;
      offset += items.length * widget.itemExtent + 30; // 30为分区标题高度
    });
  }

  void scrollToSection(String letter) {
    final offset = _sectionOffsets[letter];
    if (offset != null) {
      _controller.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sortedKeys = widget.data.keys.toList()..sort();

    return CustomScrollView(
      controller: _controller,
      slivers: [
        if (widget.header != null)
          SliverToBoxAdapter(child: widget.header),
        ...sortedKeys.expand((letter) {
          final items = widget.data[letter]!;
          return [
            SliverToBoxAdapter(
              child: Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: AppColors.gray2,
                alignment: Alignment.centerLeft,
                child: Text(
                  letter,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray6,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      if (widget.onItemTap != null) {
                        widget.onItemTap!(item);
                      }
                    },
                    child: widget.itemBuilder(context, item),
                  );
                },
                childCount: items.length,
              ),
            ),
          ];
        }).toList(),
        if (widget.footer != null)
          SliverToBoxAdapter(child: widget.footer),
      ],
    );
  }
}

// 索引侧边栏组件
class TnIndexSidebar extends StatelessWidget {
  final Map<String, List<dynamic>> data;
  final void Function(String)? onIndexTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? activeTextColor;
  final double width;
  final double itemHeight;

  const TnIndexSidebar({
    Key? key,
    required this.data,
    this.onIndexTap,
    this.backgroundColor,
    this.textColor,
    this.activeTextColor,
    this.width = 32,
    this.itemHeight = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortedKeys = data.keys.toList()..sort();
    final theme = Theme.of(context);

    return Container(
      width: width,
      color: backgroundColor ?? AppColors.gray1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: sortedKeys.map((letter) {
          return SizedBox(
            height: itemHeight,
            child: InkWell(
              onTap: () {
                if (onIndexTap != null) {
                  onIndexTap!(letter);
                }
              },
              child: Center(
                child: Text(
                  letter,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? AppColors.gray6,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// 简化的索引列表（用于快速集成）
class TnSimpleIndexList extends StatelessWidget {
  final List<String> items;
  final void Function(String)? onItemTap;
  final bool showIndex;

  const TnSimpleIndexList({
    Key? key,
    required this.items,
    this.onItemTap,
    this.showIndex = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = _groupItemsByLetter(items);

    return TnIndexList(
      data: data,
      itemBuilder: (context, item) {
        return ListTile(
          title: Text(item as String),
          onTap: () {
            if (onItemTap != null) {
              onItemTap!(item);
            }
          },
        );
      },
    );
  }

  Map<String, List<String>> _groupItemsByLetter(List<String> items) {
    final Map<String, List<String>> result = {};

    for (final item in items) {
      if (item.isNotEmpty) {
        final letter = item.substring(0, 1).toUpperCase();
        result.putIfAbsent(letter, () => []);
        result[letter]!.add(item);
      }
    }

    return result;
  }
}

// 城市选择器示例
class CitySelectorPage extends StatelessWidget {
  const CitySelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> cities = {
      'A': ['安庆', '安阳', '鞍山'],
      'B': ['北京', '保定', '包头', '宝鸡'],
      'C': ['成都', '重庆', '长沙', '长春'],
      'D': ['大连', '东莞', '大理'],
      'F': ['福州', '佛山'],
      'G': ['广州', '贵阳', '桂林'],
      'H': ['杭州', '哈尔滨', '合肥', '海口'],
      'J': ['济南', '嘉兴'],
      'K': ['昆明'],
      'L': ['兰州', '拉萨', '丽江'],
      'M': ['绵阳'],
      'N': ['南京', '宁波', '南昌'],
      'P': ['攀枝花'],
      'Q': ['青岛', '秦皇岛'],
      'S': ['上海', '深圳', '沈阳', '石家庄'],
      'T': ['天津', '太原', '唐山'],
      'W': ['武汉', '无锡', '温州'],
      'X': ['西安', '厦门'],
      'Y': ['银川', '扬州'],
      'Z': ['郑州', '珠海'],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('选择城市'),
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Expanded(
            child: TnIndexList(
              data: cities,
              itemBuilder: (context, city) {
                return ListTile(
                  title: Text(city as String),
                  onTap: () {
                    Navigator.pop(context, city);
                  },
                );
              },
              header: Container(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '搜索城市',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TnIndexSidebar(
            data: cities,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}