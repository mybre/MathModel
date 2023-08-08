[数学建模语言Lingo个人学习笔记（简明版） - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/159487786)
### 1 基本运算符

### 1.1 算术运算符

1. **5种二元运算符**：

- `^`：乘方
- `*`：乘
- `/`：除
- `+`：加
- `-`：减

2. 唯一1种一元运算符

- `-`：取反

3. 运算符的优先级

![](https://pic4.zhimg.com/80/v2-c8e9239cf8cd19ab703b014d78bbaae3_720w.webp)

### 1.2 逻辑运算符

- `#not#`： 否定该操作数的逻辑值，`#not#`是一个一元运算符
- `#eq#`： 若两个运算数相等，则为 true；否则为 flase
- `#ne#`： 若两个运算符不相等，则为 true；否则为 flase
- `#gt#`： 若左边的运算符严格大于右边的运算符，则为 true；否则为 flase
- `#ge#`： 若左边的运算符大于或等于右边的运算符，则为 true；否则为 flase
- `#lt#`： 若左边的运算符严格小于右边的运算符，则为 true；否则为 flase
- `#le#`： 若左边的运算符小于或等于右边的运算符，则为 true；否则为 flase
- `#and#`： 仅当两个参数都为 true 时，结果为 true；否则为 flase
- `#or#`： 仅当两个参数都为 false 时，结果为 false；否则为 true 这些运算符的优先级：

![](https://pic4.zhimg.com/80/v2-890fe4be281f4e5cff221cfb33abb83f_720w.webp)

### 1.3 关系运算符

![](https://pic3.zhimg.com/80/v2-fe0f53e0c9e1a2b64ff237b877d0fba6_720w.webp)

**以上三种运算符的优先级**：

![](https://pic3.zhimg.com/80/v2-bd8a01b901545a18797eebe5143fc16a_720w.webp)

## 2 注释

**开头用感叹号（!），末尾用分号（;），表示注释，可跨多行。**

## 3 LINGO中的集

### 3.1 原始集

集部分（语句块）以关键字“`sets:`”开始，以“`endsets`”结束，中间是各个原始集的名称、成员和属性 。

![](https://pic2.zhimg.com/80/v2-035b4b2399807c2289fbde776c151225_720w.webp)

- `setname`：集名称
- 可选参数 `/member_list/` ：集的成员名横向列表（用反斜杠 "/" 开头和结尾，用","或空格分隔各个成员）
- 可选参数 `:attribute_list` ：及成员属性名列表（冒号 ":" 开头）。

### 成员罗列的几种方式

1. 显示罗列集成员：把所有成员名列出，用逗号" , "或空格分隔。
2. 隐式罗列集成员：`setname/member1..memberN/[: attribute_list]; !用".."表示省略`

![](https://pic3.zhimg.com/80/v2-d8b383a5a69ec4e28d20af7435addd7a_720w.webp)

3. 集成员不放在集定义中，而在随后的数据部分来定义

```lingo
!集部分; 
sets: 
students:sex,age; 
endsets 
!数据部分; 
data: 
 students,sex,age= John 1 16 
 Jill 0 14 
 Rose 0 17 
 Mike 1 13; 
enddata
```

### 3.2 派生集

为了定义一个派生集，必须详细声明：

- 集的名字
- 父集的名字
- 可选，集成员
- 可选，集成员的属性

定义派生集语法： `setname(parent_set_list)[/member_list/][:attribute_list];`

- `setname` : 派生集名。
- `(parent_set_list)` :父集名列表（已定义的），**派生集的父集既可以是原始集，也可以是其它的派生集。**
- `/member_list/` :可选，成员名列表，成员列表被忽略时，派生集成员**由父集成员所有的组合构成**，这样的派生集成为稠密集。
- `:attribute_list` :可选，集成员属性名列表。

### 派生集的成员列表有两种方式

1. 显式罗列，罗列出所有成员名
2. **设置成员资格过滤器，**思想：许多稀疏集的成员都满足一些条件以和非成员相区分。我们可以把这些逻辑条件看作过滤器，在 LINGO生成派生集的成员时**把使逻辑条件为假的成员从稠密集中过滤掉**。

例：

```text
sets: 
 !学生集：性别属性 sex，1 表示男性，0 表示女性；年龄属性 age. ; 
 students/John,Jill,Rose,Mike/:sex,age; 
 !男学生和女学生的联系集：友好程度属性 friend，[0，1]之间的数。 ; 
 linkmf(students,students)|sex(&1) #eq# 1 #and# sex(&2) #eq# 0: 
friend; 
 !男学生和女学生的友好程度大于 0.5 的集; 
 linkmf2(linkmf) | friend(&1,&2) #gt# 0.5 : x; 
endsets 
data: 
 sex,age = 1 16 
 0 14 
 0 17
 0 13; 
 friend = 0.3 0.5 0.6; 
enddata
```

- 用竖线（`|`）来标记一个成员资格过滤器的开始
- `#eq#`是逻辑运算符，用来判断是否“相等”.
- `&1` 可看作派生集的第 1 个原始父集的索引，它取遍该原始父集的所有成员，派生集的索引个数是最终原始父集的个数

## 4 模型的数据部分和初始部分

为集指派一些成员并且在 LINGO 求解模型之前为集的某些属性指定值，提供了两个可选部分：输入集成员和数据的数据部分（Data Section）和为决策变量设置初始值的初始部分（Init Section）。

### 4.1 模型的数据部分

### 4.1.1 数据部分入门

数据部分以关键字“`data:`”开始，以关键字“`enddata`”结束。在这里，可以指定 集成员、集的属性。其语法如下： `object_list = value_list;`

- 对象列（`object_list`）包含要指定值的属性名、要设置集成员的集名，用逗号或空格隔开。
- 数值列（`value_list`）包含要分配给对象列中的对象的值，用逗号或空格隔开。注意属性值的个数必须等于集成员的个数。

例：

```text
sets: 
 set1/A,B,C/: X,Y; 
endsets 
data: 
 X=1,2,3; 
 Y=4,5,6; 
enddata
```

也可采用如下例子中的复合数据声明（data statement）实现同样的功能：

```text
sets: 
 set1/A,B,C/: X,Y; 
endsets 
data: 
 X,Y=1 4 
 2 5 
 3 6; 
enddata
```

### 4.1.2 参数

在数据部分也可以指定一些标量变量（scalar variables）。当一个标量变量在数据部分确定时，称之为参数，例：

```text
data: 
 interest_rate,inflation_rate = .085 .03; 
enddata
```

### 4.1.3 实时数据处理

在本该放数的地方输入一个问号（?），表示待定值，每一次求解模型时，LINGO都会提示为参数 inflation_rate输入一个值，例如：

```text
data: 
 interest_rate,inflation_rate = .085 ?; 
enddata
```

在求解目标规划的序贯式算法中会经常用到此语法。除了参数之外，也可以实时输入集的属性值，但不允许实时输入集成员名。

### 4.1.4 指定属性为一个值

为所有成员的属性指定同一个值：

```text
sets: 
 days /MO,TU,WE,TH,FR,SA,SU/:needs; 
endsets 
data: 
 needs = 20; 
enddata
```

也支持多个属性的情况：

```text
sets: 
 days /MO,TU,WE,TH,FR,SA,SU/:needs,cost; 
endsets 
data: 
 needs cost = 20 100; 
enddata
```

### 4.1.5 数据部分的未知数值

```text
sets: 
 years/1..5/: capacity; 
endsets 
data: 
 capacity = ,34,20,,; 
enddata
```

属性 `capacity` 的第 2 个和第 3 个值分别为 34 和 20，其余的未知。

### 4.2 模型的初始部分

一个初始部分以“`init:`”开始，以“`endinit`”结束:

```text
init: 
 X, Y = 0, .1; 
endinit 
Y=@log(X); 
X^2+Y^2<=1;
```

在初始部分定义的变量的值仅被 LINGO 求解器当作初始点来用，并且仅仅对非线性模型有用。好的初始点会减少模型的求解时间。

## 5 LINGO 函数

### 5.1 数学函数

LINGO 提供了大量的标准数学函数：

- `@abs(x)`：返回 x 的绝对值。
- `@sin(x)`：返回 x 的正弦值，x 采用弧度制。
- `@cos(x)`：返回 x 的余弦值。
- `@tan(x)`：返回 x 的正切值。
- `@exp(x)`：返回常数 e 的 x 次方。
- `@log(x)`：返回 x 的自然对数。
- `@lgm(x)`：返回 x 的 gamma 函数的自然对数。
- `@mod(x,y)`：返回 x 除以 y 的余数。
- `@sign(x)`：如果 x<0 返回-1；否则，返回 1。
- `@floor(x)`：返回 x 的整数部分。当 x>=0 时，返回不超过 x 的最大整数；当 x<0时，返回不低于 x 的最大整数。
- `@smax(x1,x2,…,xn)`：返回 x1，x2，…，xn 中的最大值。
- `@smin(x1,x2,…,xn)`：返回 x1，x2，…，xn 中的最小值。

### 5.2 金融函数

- `@fpa(I,n)`：返回如下情形的净现值：单位时段利率为 I，连续 n 个时段支付，每个时段支付单位费用。若每个时段支付 x 单位的费用，则净现值可用 x 乘以`@fpa(I,n)`算得。`@fpa` 的计算公式为:

∑�=1�1(1+�)�=1−(1+�)−��

- `@fpl(I,n)`：返回如下情形的净现值：单位时段利率为 I，第 n 个时段支付单位费用。`@fpl(I,n)`的计算公式为: (1+�)−�

对于以上两个函数，有： @���(�,�)=∑�=1�@���(�,�)

### 5.3 概率函数

- `@pbn(p,n,x)`：二项分布的累积分布函数。当 n 和（或）x 不是整数时，用线性插值法进行计算。
- `@pcx(n,x)`：自由度为 n 的 $\chi ^2$分布的累积分布函数。
- `@peb(a,x)`：当到达负荷为 a，服务系统有 x 个服务器且允许无穷排队时的 Erlang 繁忙概率。
- `@pel(a,x)`：当到达负荷为 a，服务系统有 x 个服务器且不允许排队时的 Erlang 繁忙概率。
- `@pfd(n,d,x)`：自由度为 n 和 d 的 F 分布的累积分布函数。
- `@pfs(a,x,c)`： 当负荷上限为 a，顾客数为 c，平行服务器数量为 x 时，有限源的 Poisson 服务系统的等待或返修顾客数的期望值。a 是顾客数乘以平均服务时间，再除以平均修时间。当 c 和（或）x 不是整数时，采用线性插值进行计算。
- `@phg(pop,g,n,x)`：超几何（Hypergeometric）分布的累积分布函数。pop 表示产品总数，g 是正品数。从所有产品中任意取出 n（n≤pop）件。pop，g，n 和 x 都可以是非整数，这时采用线性插值进行计算。
- `@ppl(a,x) Poisson`：分布的线性损失函数，即返回 max(0,z-x)的期望值，其中随机变量 z 服从均值为 a 的 Poisson 分布。
- `@pps(a,x)`：均值为 a 的 Poisson 分布的累积分布函数。当 x 不是整数时，采用线性插值进行计算。
- `@psl(x)`：单位正态线性损失函数，即返回 max(0,z-x)的期望值，其中随机变量 z 服从标准正态分布。
- `@psn(x)`：标准正态分布的累积分布函数。
- `@ptd(n,x)`：自由度为 n 的 t 分布的累积分布函数。
- `@qrand(seed)`：产生服从(0,1)区间的拟随机数。`@qrand`只允许在模型的数据部分使用，它将用拟随机数填满集属性。通常，声明一个 m×n 的二维表，m 表示运行实验的次数，n 表示每次实验所需的随机数的个数。在行内，随机数是独立分布的；在行间，随机数是非常均匀的。这些随机数是用“分层取样”的方法产生的。如果没有为函数指定种子，那么 LINGO 将用系统时间构造种子。

例:

```text
model:
 data: 
 M=4; N=2; seed=1234567; 
enddata 
sets: 
 rows/1..M/; 
 cols/1..N/; 
 table(rows,cols): x; 
endsets 
data: 
 X=@qrand(seed); 
enddata 
end
```

- `@rand(seed)`：返回 0 和 1 间的伪随机数，依赖于指定的种子。典型用法是 `U(I+1)=@rand(U(I))`。如果 seed 不变，那么产生的随机数也不变。

### 5.4 变量界定函数

变量界定函数实现对变量取值范围的附加限制，共 4 种：

- `@bin(x)`：限制 x 为 0 或 1。
- `@bnd(L,x,U)`：限制 L≤x≤U。
- `@free(x)`：取消对变量 x 的默认下界为 0 的限制，即 x 可以取任意实数。
- `@gin(x)`：限制 x 为整数。

在默认情况下，LINGO 规定变量是非负的，也就是说下界为 0，上界为+∞。`@free`取消了默认的下界为 0 的限制，使变量也可以取负值。`@bnd` 用于设定一个变量的上下界,它也可以取消默认下界为 0 的约束。

### 5.5 集操作函数

- `@in(set_name,primitive_index_1 [,primitive_index_2,…])`：如果元素在指定集中，返回 1；否则返回 0。
- `@index([set_name,] primitive_set_element)`：返回在集`set_name`中原始集成员`primitive_set_element`的索引。如果`set_name`被忽略，那么LINGO将返回与`primitive_set_element`匹配的第一个原始集成员的索引。如果找不到，则产生一个错误。

例：如何确定集成员(B,Y)属于派生集 S3。

```text
sets: 
 S1/A B C/; 
 S2/X Y Z/; 
 S3(S1,S2)/A X, A Z, B Y, C X/; 
endsets 
X=@in(S3,@index(S1,B),@index(S2,Y));
```

- `@wrap(index,limit)`：该函数返回 �=�����−�∗�����，其中 k 是一个整数，取适当值保证 j 落在区间 [1，limit] 内。该函数在循环、多阶段计划编制中特别有用。
- `@size(set_name)`：该函数返回集 `set_name` 的成员个数。在模型中明确给出集大小时最好使用该函数。它的使用使模型更加数据中立，集大小改变时也更易维护。

### 5.6 集循环函数

集循环函数遍历整个集进行操作。其语法为:

`@function(setname[(set_index_list[|conditional_qualifier]]:expression_list);`

- `@function` 相应于下面罗列的四个集循环函数之一。
- `setname` 是要遍历的集。
- `set_ index_list` 是集索引列表。
- `conditional_qualifier` 是用来限制集循环函数的范围，当集循环函数遍历集的每个成员时，LINGO 都要对`conditional_qualifier` 进行评价，若结果为真，则对该成员执行`@function` 操作，否则跳过，继续执行下一次循环。
- `expression_list` 是被应用到每个集成员的表达式列表，当用的是 `@for` 函数时，`expression_list` 可以包含多个表达式，其间用逗号隔开。这些表达式将被作为约束加到模型中。当使用其余的三个集循环函数时，`expression_list` 只能有一个表达式。如果省略 `set_index_list`，那么在 `expression_list` 中引用的所有属性的类型都是`setname` 集。

集循环函数具体有：

- `@for`：用来产生对集成员的约束。基于建模语言的标量需要显式输入每个约束，不过 `@for` 函数允许只输入一个约束，然后 LINGO 自动产生每个集成员的约束。

例：产生序列{1,4,9,16,25}.

```text
model: 
sets: 
 number/1..5/:x; 
endsets 
 @for(number(I): x(I)=I^2); 
end
```

- `@sum` ：返回遍历指定的集成员的一个表达式的和。

例：求向量[5，1，3，4，6，10]前 5 个数的和。

```text
model: 
data: 
 N=6; 
enddata 
sets: 
 number/1..N/:x; 
endsets 
data: 
 x = 5 1 3 4 6 10; 
enddata 
 s=@sum(number(I) | I #le# 5: x); 
end
```

- `@min` 和`@max` ：返回指定的集成员的一个表达式的最小值或最大值。

例：求向量[5，1，3，4，6，10]前 5 个数的最小值，后 3 个数的最大值。

```text
model: 
data: 
 N=6; 
enddata 
sets: 
 number/1..N/:x; 
endsets 
data: 
 x = 5 1 3 4 6 10; 
enddata 
 minv=@min(number(I) | I #le# 5: x); 
 maxv=@max(number(I) | I #ge# N-2: x); 
end
```

### 5.7 输入和输出函数

输入和输出函数可以把模型和外部数据比如文本文件、数据库和电子表格等连接起来。

1. `@file`：用来从外部文件中输入数据，可以放在模型中任何地方。该函数的语法格式为`@file(’filename’)`。这里 `filename` 是文件名，可以采用相对路径和绝对路径两种表示方式。

例：

```text
sets: 
 warehouses/ @file('1_2.txt') /: capacity;
 vendors/ @file('1_2.txt') /: demand; 
 links(warehouses,vendors): cost, volume; 
endsets 
!目标函数; 
 min=@sum(links: cost*volume); 
!需求约束; 
 @for(vendors(J):@sum(warehouses(I):volume(I,J))=demand(J)); 
!产量约束; 
 @for(warehouses(I):@sum(vendors(J):volume(I,J))<=capacity(I)); 
!这里是数据; 
data: 
 capacity = @file('1_2.txt') ; 
 demand = @file('1_2.txt') ; 
 cost = @file('1_2.txt') ; 
enddata 
end
```

模型的所有数据来自于 1_2.txt 文件。其内容如下：

```text
!warehouses 成员; 
WH1 WH2 WH3 WH4 WH5 WH6 ~ 

!vendors 成员; 
V1 V2 V3 V4 V5 V6 V7 V8 ~ 

!产量; 
60 55 51 43 41 52 ~ 

!销量; 
35 37 22 32 41 32 43 38 ~ 

!单位运输费用矩阵; 
6 2 6 7 4 2 5 9 
4 9 5 3 8 5 8 2 
5 2 1 9 7 4 3 3 
7 6 7 3 9 2 7 1 
2 3 9 5 7 2 6 5 
5 5 2 2 8 1 4 3
```

把记录结束标记（~）之间的数据文件部分称为记录。如果数据文件中没有记录结 束标记，那么整个文件被看作单个记录。注意到除了记录结束标记外，模型的文本和数据同它们直接放在模型里是一样的。

**在数据文件中的记录结束标记连同模型中**`@file`**函数调用工作过程**：当在模型中第一次调用`@file` 函数时，LINGO 打开数据文件，然后读取第一个记录；第二次调用`@file`函数时，LINGO 读取第二个记录等等。文件的最后一条记录可以没有记录结束标记。

2. `@text` ：该函数被用在数据部分用来把解输出至文本文件中。它可以输出集成员和集属性值。其语法为：`@text([’filename’])`

- 这里 `filename` 是文件名，可以采用相对路径和绝对路径两种表示方式，如果忽略`filename`，那么数据就被输出到标准输出设备（大多数情形都是屏幕）。

3. `@OLE(filename)`：是从 EXCEL 中引入或输出数据的接口函数，它是基于传输的 OLE 技术。OLE传输直接在内存中传输数据，并不借助于中间文件。

- `filename`为文件名，可以是相对路径，也可以是绝对路径。
- `@OLE` 可以同时读集成员和集属性，集成员最好用文本格式，集属性最好用数值格式。原始集每个集成员需要一个单元(cell)，而对于 n 元的派生集每个集成员需要 n个单元，这里第一行的 n 个单元对应派生集的第一个集成员，第二行的 n 个单元对应派生集的第二个集成员，依此类推。
- `@OLE` 只能读一维或二维的 Ranges（在单个的 EXCEL 工作表(sheet)中），但不能读间断的或三维的 Ranges。Ranges 是自左而右、自上而下来读。

### 5.8 结果报告函数

1. `@STRLEN(string)`：这个函数返回字符串“string”的长度，如@STRLEN(123)返回值为 3。
2. `@status()`：返回 LINGO 求解模型结束后的状态：

- 0：Global Optimum（全局最优）
- 1： Infeasible（不可行）
- 2： Unbounded（无界）
- 3： Undetermined（不确定）
- 4： Feasible（可行）
- 5： Infeasible or Unbounded（通常需要关闭“预处理”选项后重新求解模型，以确定模型究竟是不可行还是无界）
- 6： Local Optimum（局部最优）
- 7： Locally Infeasible（局部不可行，尽管可行解可能存在，但是 LINGO 并没有找到一个）
- 8： Cutoff（目标函数的截断值被达到）
- 9： Numeric Error（求解器因在某约束中遇到无定义的算术运算而停止）

### 5.9 辅助函数

- `@if(logical_condition,true_result,false_result)`：评价一个逻辑表达式 `logical_condition`，如果为真，返回 `true_ esult`，否则返回`false_result`。

例：求解最优化问题

����(�)+�(�)

�.�.{�(�)={100+2�,x>02�,x ≤ 0�(�)={60+3�,y>02�,y ≤ 0�+�≥30�,�≥0

```text
model: 
 min=fx+fy; 
 fx=@if(x #gt# 0, 100,0)+2*x; 
 fy=@if(y #gt# 0,60,-y)+3*y; 
 x+y>=30; 
end
```

## 6 综合举例

**例1**：求解非线性方程组 {�2+�2=12�2+�+�2+�=4

```text
model: 
init: 
x=1;y=1; 
endinit 
 x^2+y^2=2; 
 2*x^2+x+y^2+y=4; 
end
```

**例2**：（最短路问题）给定 N个点 ��(�=1,2,,�) 组成集合 {��} ，由集合中任一点 �� 到另一点 �� 的距离用 ��� 表示，如果 ��到 ��没有弧联结，则规定 ���=+∞，又规定 ���=0(1≤�≤�) ，指定一个终点 ��，要求从 �� 点出发到 ��的最短路线。这里我们用动态规划方法来做。用所在的点 �� 表示状态，决策集合就是除 ��以外的点，选定一个点 �� 以后，得到效益 ��� 并转入新状态��，当状态是 ��时，过程停止。显然这是个不定期多阶段决策过程。 定义 �(�) 是由 ��点出发至终点 ��的最短路程，由最优化原理可得: {�(�)=����⁡���+�(�),i = 1,2,⋯,N-1�(�)=0

```text
!最短路问题; 
model: 
data: 
 n=10; 
enddata 
sets: 
 cities/1..n/: F; !10 个城市; 
 roads(cities,cities)/ 
 1,2 1,3 2,4 2,5 2,6 3,4 3,5 3,6 
 4,7 4,8 5,7 5,8 5,9 6,8 6,9 7,10 
 8,10 9,10 
 /: D, P; 
endsets 
data: 
 D= 
 6 5 3 6 9 7 5 11 9 1 8 7 5 
 4 10 5 7 9; 
enddata 
 F(n)=0; 
 @for(cities(i)|i #lt# n:F(i)=@min(roads(i,j):D(i,j)+F(j)));
  !显然，如果 P(i,j)=1,则点 i 到点 n 的最短路径的第一步是 i --> j，否则就不是。由此，我们就可方便的确定出最短路径; 
 @for(roads(i,j):P(i,j)=@if(F(i) #eq# D(i,j)+F(j),1,0)); 
end
```

**Reference:**

[1] 司守奎，孙兆亮，数学建模算法与应用（第二版），北京：国防工业出版社，2015.4

[2] 弗雷德里克.S.希利尔，杰拉尔德.J.利伯曼著，胡运权等译，运筹学导论（第9版），北京：清华大学出版社，2010.5

