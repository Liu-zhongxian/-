# 别再手动整理了——飞书 cli 让 AI 帮我把 Awesome Mac 搬进多维表格

---

我把 GitHub 上 600+ 软件的 Awesome Mac 文档，变成了一张结构化多维表格。 没有手动整理，没有写脚本。 靠的就是飞书 cli 这个刚开源 45 天破万星的工具。



Github 上有个非常好的项目叫 **Awesome Mac。**



[https://github.com/jaywcjlove/awesome-mac](https://github.com/jaywcjlove/awesome-mac)



这个项目致力于收集优质的 macOS 软件，并按照不同类别进行系统整理，已经收集了大几百个软件。因为罗列的软件非常多，文档非常长，并不是特别方便搜索查找。



正好最近使用飞书的多维表格，多维表格的数据结构性非常强，而且有丰富的视图，如果能从原来的 md 文档，变成结构化数据，它就能被筛选、被聚合、后续我也可以自己继续维护。



如果这个事情要手动完成，无疑工作量巨大，而且很枯燥。这种非常典型的重复劳动，特别适合让 AI 来帮我们完成。



恰好飞书官方开源了lark-cli，45 天达成GitHub 破万星。并且开源了一系列的飞书 skill，当中就有包括操作多维表格的 skill。



把非结构化的 md 文档，变成多维表格，完成这个事情需要的工具有



- Claude code
- 使用的大模型是**蚂蚁百灵正式开源的 Ring-2.6-1T**
- 飞书 cli 和 配套的 skill



下面跟着我一起，看看如何把非结构化的 md 文档，变成飞书的多维表格。



# 🛠️ 第一步：获取 Ring-2.6-1T 的 API Key



Ring-2.6-1T 目前已经在 OpenRouter 上线。



1. 前往 OpenRouter 官网并注册/登录账号。
2. 在后台找到 **Keys** 页面，点击生成一个新的 API Key。
3. **复制并保存好这串 API Key**，我们接下来的步骤会用到它。

# 📥 第二步：在 shell 配置里加个函数



把下面这段加到 **\~/.zshrc** 或 **\~/.bashrc** (zsh 示例, bash 几乎一样):



```Bash
export OPENROUTER_API_KEY="sk-or-v1-你的key"

# 会话: OpenRouter + inclusionai/ring-2.6-1t
claude-ring() {
  ANTHROPIC_BASE_URL="https://openrouter.ai/api" \
  ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY" \
  ANTHROPIC_API_KEY="" \
  ANTHROPIC_MODEL="inclusionai/ring-2.6-1t" \
  ANTHROPIC_SMALL_FAST_MODEL="inclusionai/ring-2.6-1t" \
  CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 \
  claude "$@"
}
```



# 🚀 第三步：在 Claude Code 中起飞！



在终端中，输入 claude-ring 回车，直接跑的是 Ring-2.6-1T。



![图片展示的是Claude Code界面，左侧显示“claude-ring”项目，版本为v2.1.138，提示“Welcome back!”，并有“inclusionai/ring-2.6-1t · API Usage Billing”及“~/dev/ring-model-test”信息。右侧有“Tips for getting started”和“What's new”板块，前者提示可让Claude创建新应用或复制代码，后者列出内部修复等更新内容。该图片与文档中“初始化配置”步骤相关，展示了在Claude Code中输入英文!后进入shell模式的界面情况。](https://feishu.cn/file/ETR2bITU7otNy5xGPYfckf3Vn0g)



# 📥 第四步：安装飞书 cli 和 skill



在 Claude code 中使用下面的提示词



```Plain Text
根据这个网页的说明 https://github.com/larksuite/cli/blob/main/README.zh.md         
帮我安装一下，帮我安装飞书的 cli 和操作多维表格的 skill
```



![图片展示了飞书cli安装完成后的结果及后续配置步骤。上方提示“全部安装完成！以下是安装结果和后续配置步骤”。下方列出飞书cli安装信息，包括包名、版本、安装方式等。接着列出25个Skills，其中与多维表格直接相关的是lark - sheets，可操作多维表格（增删查行、单元格、更新记录等）。该图片与文档中“第四步：安装飞书cli和skill”部分对应，是对安装完成后的结果呈现，为后续配置提供指引。](https://feishu.cn/file/GuiobMIn1oTjUNxkEXnc6wmKnTd)



参考下面的说明，继续完成飞书 cli 的配置



![图片展示了在Claude Code中配置飞书cli的步骤。首先执行“lark-cli config init --new”命令初始化配置，设置APP_ID和APP_SECRET；接着运行“lark-cli auth login --recommend”授权登录，会生成浏览器链接扫码/点击授权；最后执行“lark-cli auth status”验证登录状态。这些步骤是文档中“初始化配置”步骤的详细操作说明，帮助用户在Claude Code中完成飞书cli的配置。](https://feishu.cn/file/NjGDbC6kyoIkQUxuVjmcwYyjnug)



## 第一步：初始化配置



在 Claude code 中输入英文 ! ，变成 shell 模式，输入下面的命令



```Bash
lark-cli config init --new
```



![图片展示了在终端执行“lark-cli config init --new”命令后的结果。终端显示配置链接“https://open.feishu.cn/page/cli?user_code=...”，并提示“等待配置应用...”，还显示“+25 lines (18s)”及“(ctrl+b to run in background)”。这与文档中“初始化配置”步骤相关，即在Claude code中输入英文!，变成shell模式后执行此命令，终端会返回配置链接，用于后续创建飞书应用或使用已有的应用。](https://feishu.cn/file/NCGgbL0u9oBKTHxNqjoc9le2nch)



终端会返回一个配置链接，拷贝链接到浏览器中打开，提示你创建飞书应用，或者是使用已有的，这里我们选择创建。



![图片展示的是飞书CLI应用创建界面。上方显示“创建飞书CLI应用”，下方有头像选择区域，提供了多个卡通人物头像供选择。名称输入框中已输入“飞书CLI wsl”。下方有两个操作按钮，分别是“创建”和“选择已有应用”。该图片与文档中“第二步：在shell配置里加个函数”后“点击创建，等待完成”的内容相关，是创建飞书CLI应用的界面示例，用于指导用户完成应用创建操作。](https://feishu.cn/file/SyYCbPCnioNEAgxwJS9cUPz9nyf)



点击创建，等待完成。



![图片展示的是飞书CLI应用创建成功界面。画面中有蓝色的文件夹图标，文件夹内有绿色的对勾标志，下方有蓝色和黄色的线条装饰。文字部分显示“创建成功”及“现在可前往 CLI，开始使用飞书 CLI 应用”。该图片与文档中“第四步：创建多维表格”内容相关，表明在使用飞书CLI创建多维表格时，已完成创建操作，提示用户可前往CLI继续使用。](https://feishu.cn/file/EdfTbewAvo8av0xCiVYcXSU0nLA)



完成后，回到命令行界面，提示成功完成第一步



![图片展示了在shell配置里添加函数后，执行lark -cli config init --new命令的反馈信息。界面显示“已成功完成！”，并列出配置项及对应值，如App ID为cll_aa82993561b91cc8，App Secret已自动配置（隐藏显示），品牌为feishu。下方提示接下来进行第2步：授权登录，需在浏览器中打开链接完成授权，还给出了第3步登录和第4步验证登录状态的命令。该图片与文档中“第二步：在shell配置里加个函数”内容相关，是配置完成后的反馈结果。](https://feishu.cn/file/Wuqhb9vxuoWeP3x6h3Nc4s0Anfb)



## 第二步：授权登录



```Bash
lark-cli auth login --recommend
```



在 Claude code 中执行上面命令后，也会出现一个链接，拷贝到浏览器中打开，建议直接开通所有权限



![图片展示的是在Claude code中执行“lark-cli auth login --recommend”命令后的界面。界面上方显示命令执行结果，提示存在代理，需在浏览器中打开链接进行认证。中间部分给出链接地址，下方有AI agent的说明，包括命令最长阻塞时间、runner的timeout要求、device_code获取方式、用户授权链接失效的注意事项等。该图片与文档中“第二步：授权登录”内容相关，直观呈现了授权登录时的命令执行结果及后续操作指引。](https://feishu.cn/file/IT5wbzItYoCIzKxTSnqcbrO3nxe)



![图片展示的是飞书CLI wsl授权登录时的权限开通确认界面。界面上方显示“飞书 CLI wsl”，中间以“确定开通并授权以下权限吗？”为标题，列出了多项权限，如添加、回复云文档中的评论等。其中“一并开通审批、多维表格、日历、通讯录、文档、消息与群组、邮箱、电子表格、幻灯片、任务、视频会议的常用权限”已勾选。底部有一个蓝色的“开通并授权”按钮。该图片与文档中“第二步：授权登录”内容相关，是授权登录步骤中需进行的权限确认操作界面。](https://feishu.cn/file/EUIxbJiIEohenTxEu7Nc9Xvanb5)



## 第三步：验证登录状态



继续输入下面的命令



```Bash
lark-cli auth status
```



![图片展示的是在Claude code中执行“lark-cli auth status”命令后的输出结果。其中，“appId”为“cl_aa82bc2187385cce”，“defaultUA”为“auto”，“grantType”为“password”，“identity”为“user”，“scope”包含多项权限，如“base:create”“base:field:create”等，还有“calendar:read”“calendar:write”等，以及“message:read”“message:write”等权限，还有“userOpenId”为“ou_b948e42f3d2bfdef0ec8d63472f18f”。该图片与上文“第二步：授权登录”相关，是验证登录状态时的输出结果。](https://feishu.cn/file/ByKibrNNRorwKFx1aC8cuoM2nNb)



经过上面三步，飞书 cli 就完全配置好了。



## 第四步：创建多维表格



在 Claude code 中输入下面的 Prompt



```Plain Text
帮我创建一个飞书多维表格，名字是 Mac 精华软件收录
```



![图片展示了多维表格「Mac 精华软件收录」创建成功后的信息。表格包含名称、Base Token、时区、访问链接四列，对应值分别为Mac 精华软件收录、W54jbGiXeaIoijscklxc15HlnDh、Asia/Shanghai、https://my.feishu.cn/base/W54jbGiXeaIoijscklxc15HlnDh。该图片与上文提到的在Claude code中输入Prompt、浏览中打开链接验证创建成功等内容相呼应，直观呈现了创建成功的多维表格相关信息。](https://feishu.cn/file/MLm2bcYPBo2txBxorWWcGbGkn8g)



浏览中打开链接，能看到，说明创建成功



![图片展示的是飞书多维表格界面。左侧为导航栏，有“数据表”“数据视图”等选项。右侧上方有“分享”“自动化”等功能按钮。中间区域显示“Mac 精华软件收录”数据表，包含“AI 文本”“单选”“日期”“附件”等字段，下方有“+”按钮可添加新行。该图与文档中“在浏览器中查看”内容对应，直观呈现了数据表的结构，表明数据表创建成功并可进行查看操作。](https://feishu.cn/file/NO8ab3CqfoPGHqx72jlc88MZnpd)



接下来我们要创建个一个全新的数据表，这个表的数据字段设计如下



![图片展示了一个数据表字段设计表格，包含字段名、类型等信息。字段名有应用名称、描述、一级分类、二级分类、是否开源、是否免费（包含个人使用）、Awesome List链接、开源仓库地址、App Store链接等。类型均为text（plain）或select。该表格与上下文紧密相关，是创建多维表格时数据字段设计的内容，用于后续使用Claude code提示词创建数据表及导入数据等操作。](https://feishu.cn/file/RrXobZzS9o8epKxMtQ5c8aCYnBf)



因为一级分类和二级分类是 select 字段，它的数据来源是文档，我们先将这些具体选项直接提取出来。使用下面的提示词



```Plain Text
帮我提取 https://github.com/jaywcjlove/awesome-mac/blob/master/README-zh.md 软件的一级分类，和二级分类，两者分开，每个分类下的所有条目直接全部列出，用、分隔。
```



![图片展示了飞书多维表格中“Awesome Mac”数据表的分类信息。分为一级分类和二级分类。一级分类包括开发者工具、设计与产品等18类。二级分类涵盖编辑器、开发者实用工具等26类，如正则编辑器、API开发和分析等。该图片与上文提到的在浏览器中查看“Awesome Mac”数据表的内容相关，直观呈现了数据表中各类工具的分类情况，帮助用户了解数据表的组织结构。](https://feishu.cn/file/KPYkbcQhBoRf0Wxvf71cY0venef)



再使用下面的提示词创建数据表



```Plain Text
在「Mac 精华软件收录」这个多维表格中，创建一个数据表。

字段如下（按此顺序）：

1. 应用名称 —— text 主字段（plain）
2. 描述 —— text（plain）
3. 一级分类 —— select 单选，选项：开发者工具、设计和产品、虚拟机、AI 客户端、通信、数据恢复、音频和视频、阅读与写作工具、软件打包工具、下载工具、网盘、输入法、浏览器、翻译工具、安全工具、科学上网、其它实用工具、远程协助、QuickLook 插件、游戏软件
4. 二级分类 —— select 单选，选项：编辑器、开发者实用工具、正则编辑器、API 开发和分析、网络分析、命令行工具、版本控制、版本控制 GUI、版本控制系统、数据库、命令行应用、设计工具、原型流程、作图工具、截图工具、其它工具、无、Email、文件共享、流媒体音乐播放器、音频录制与编辑、日记、Office、RSS、Markdown、笔记、写作、电子书、其他、剪贴板工具、菜单栏工具、待办事项工具、系统相关工具、窗口管理、密码管理、Finder
5. 是否开源 —— select 单选，选项：True、False
6. 是否免费（包含个人使用）—— select 单选，选项：True、False
7. Awesome List 链接 —— text，URL 类型
8. 开源仓库地址 —— text，URL 类型
9. App Store 链接 —— text，URL 类型
```



等待后，数据表创建成功



![图片展示了数据表「软件列表」的创建完成情况，包含9个字段。其中，应用名称为主字段，类型为text（plain）；描述、一级分类、二级分类、开源仓库地址、App Store链接等字段类型均为text（plain）或text（URL）；Awesome List链接字段类型为text（URL），且有22个一级分类选项和37个二级分类选项。该图片与上文提到的在shell配置里加函数、使用提示词创建数据表等操作相关，直观呈现了数据表的字段信息。](https://feishu.cn/file/AEF7bU8K1oBx4LxsD4lc1qghn7f)



打开浏览器后验证一下，确实成功了



![图片展示的是飞书多维表格的Grid View界面。左侧有“数据表”“软件列表”等选项，当前选中“软件列表”。界面顶部有“Grid View”“新建视图”等选项，下方有“添加记录”“字段配置”“视图配置”等操作按钮。表格中列出了ID、应用名称、描述、一级分类、二级分类、是否开源、开源仓库地址等字段，但当前无记录显示。该图与文档中介绍在浏览器中查看多维表格数据的内容相关，直观呈现了数据表的界面样式。](https://feishu.cn/file/ZM8CbKai1oSJqdxJLuxcfbrNnrh)



使用下面的提示词，导入数据



```Bash
从awesome-mac 中文 README文档中，提取数据，通过批量导入的方式，添加到软件列表数据表中
```



![图片展示了飞书多维表格中导入数据后的总结信息。表格包含项目和数值两列，项目有数据表、总记录数、分批导入、字段覆盖等，数值对应数据表为“软件列表”，总记录数为631条，分批导入8批（每批80条，最后一批71条），字段覆盖全部9个字段。下方还列出了字段映射说明，如应用名称对应软件名称，描述提取并清理了Markdown标记后的描述文字等，帮助理解数据来源及字段对应关系。](https://feishu.cn/file/ZCjGbnMaMocHEUxMFtXcbZB1nJc)



在浏览器中查看



![图片展示的是飞书多维表格界面，呈现了“软件列表”数据表内容。表格包含ID、AI应用名称、AI描述、一级分类、二级分类、是否开源、开源仓库地址等列。其中，部分应用名称如Android Studio、Aurora Editor等被红色框突出显示。该图片与上文提到的在浏览器中查看数据表内容相呼应，直观呈现了数据表中软件的相关信息，帮助用户了解已导入的软件列表情况。](https://feishu.cn/file/Ph7cbCdayoo3PDxRL00cQYtonSb)



多维表格有了数据之后，就可以利用内置的多种视图，方便筛选，查看。
