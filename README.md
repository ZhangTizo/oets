# Online English Test System
### ——在线英语考试系统
##### 该项目使用IntelliJ IDEA开发,以JAVA为基础,使用Servlet处理事务,不使用框架,该系统为个人开发，功能简单，用于毕业设计。项目设计的在线英语考试系统适用于初中英语等级，题型包括单选题、多选题和阅读理解。组卷方式为手动选择，不支持自动组卷和导入试题。

## 一.管理员
#### 1.学生管理
#### 2.教师管理
#### 3.试题管理
#### 4.试卷管理
#### 5.成绩查询

## 二.教师
#### 1.学生管理
#### 2.试题管理
#### 3.试卷管理
#### 4.成绩查询
#### 5.修改密码

## 三.学生
#### 1.考试
#### 2.查看成绩
#### 3.修改密码

## 四.该项目使用的工具版本
#### 1.JDK  11.0.1
#### 2.MySQL  8.0.11(数据库文件在sql文件夹中，运行即可使用，附带测试数据)
#### 3.Tomcat 9.0.6

## 五.系统运行截图
#### 1.登录界面
![image](https://note.youdao.com/yws/api/personal/file/256897D46FE8411D8499DC4CB9D9F47F?method=download&shareKey=b3a705cb2ef83c34da7ffbb2951c9c88)
#### 2.管理员管理界面
![image](https://note.youdao.com/yws/api/personal/file/7A62CAB6952D45419AAC5772C0C36BF2?method=download&shareKey=009fbe2fd18b4c1f87c8b6877d0062ae)
#### 3.学生管理界面
![image](https://note.youdao.com/yws/api/personal/file/8B4D1B83400646F18E8A22C6357C3AEB?method=download&shareKey=60fd1cd9168366c693f39ff00a13d41a)
#### 4.题库管理
![image](https://note.youdao.com/yws/api/personal/file/50D49CD24B934DDC9705177D3DADAD01?method=download&shareKey=2cc3d8c80e25a408db416269e69e31f0)
#### 5.题库管理_新增题目
![image](https://note.youdao.com/yws/api/personal/file/817DAE71506B4888B3F42A10DD1A93F6?method=download&shareKey=9b550ecee517bd3bd6d8b3df2e503821)
#### 6.题库管理_新增题目_新增阅读理解题
在新增题目的时候选择 “阅读理解”类型，则会通过onclick事件跳转到新增阅读理解题的界面，因为阅读理解题和单选题与多选题不太一样，阅读理解题包含一篇文章和文章所配套的题目，所以在新增阅读理解的时候设计为先插入一个阅读理解文章，然后将阅读理解文章的id获取到session中，并转发给接下来的插入题目jsp页面，插入一道题成功之后，会不断跳转到插入题目页面，直到点击结束按钮，该文章所包含的配套题目添加完成。
![image](https://note.youdao.com/yws/api/personal/file/93FF412BDBF14E878C8F46E5C465520E?method=download&shareKey=b9c05639dfda3c293a943bcc2fe453d6)
#### 7.试卷管理
![image](https://note.youdao.com/yws/api/personal/file/554C8EF586C545928E6583C69E9C6022?method=download&shareKey=1aa5fec7bdb09c37c416e4ab84bbe532)
#### 8.试卷管理_新增试卷
![image](https://note.youdao.com/yws/api/personal/file/FD209039FD6A452B9908AD61CB0546C4?method=download&shareKey=1c029c0b082a448c38952ba1cdf141c8)
#### 9.试卷管理_修改试卷信息
![image](https://note.youdao.com/yws/api/personal/file/2DACCE85246E469F875BA8EADAA941DD?method=download&shareKey=750a4f346e6de898388f05a0ff1cf35a)
#### 10.成绩查询_教师及管理员
教师及管理员在对成绩进行查询时，显示出试卷名，学生姓名，成绩和考试时间。
![image](https://note.youdao.com/yws/api/personal/file/8FD403070F514E418DCB6E9BEF2B3E51?method=download&shareKey=f058f61589db7ffba84b9f5c7e4714ad)
#### 11.学生操作界面
![image](https://note.youdao.com/yws/api/personal/file/E3F40EECAEE547DC827380EEC1A321B6?method=download&shareKey=437f276ae031a49888b8aceaefa58668)
#### 12.学生选择考试界面
![image](https://note.youdao.com/yws/api/personal/file/8109CA7355014F519C56B226E4B1FA5B?method=download&shareKey=173cb92e58e2f108f577449729dad9c9)
#### 13.学生考试界面
![image](https://note.youdao.com/yws/api/personal/file/00488512CC4B4D73A228D990B4AED456?method=download&shareKey=b4f843e76339ab246ebde5f67cf25f7d)
![image](https://note.youdao.com/yws/api/personal/file/F0D592C285624B20B2B31A5235DD32F8?method=download&shareKey=42a64cba8bd6b112befa8f32c152fe2c)
![image](https://note.youdao.com/yws/api/personal/file/74313163082243C790F8382C06D6EA84?method=download&shareKey=9a71fce0f77265961288e723bd165dfb)
#### 14.学生成绩查询界面
![image](https://note.youdao.com/yws/api/personal/file/19545BBD78174A869DF2BC957BD0C57A?method=download&shareKey=c7fa92dea86a61689d2e6abb59bfeb8b)