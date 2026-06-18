# 在Claude Code中远程控制你的手机微信，并自动将重要群聊消息同步到私有的知识库中

​

![图片展示了Airtap产品功能，其背景为渐变色。左侧有Airtap标志及文字“让AI帮你自动同步微信聊天记录，读取、同步、保存、随时查阅”。中间是手机界面，显示AI与用户聊天记录。右侧是微信聊天记录同步界面，有5条记录，包括时间、聊天内容及表情。底部有“读取消息”“自动同步”“保存到本地”“随时查阅”四个功能图标。该图与文档中介绍Airtap能自动同步微信聊天记录的内容相契合，直观呈现其功能。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MjViMDQ0ZDk4ZDI3YzRhYjVlYzI0ODc1N2EzOWExZTFfMDNmMDNjZTk1M2NlMTA4YWVlZWI0ZTkwOTg3MzJjM2RfSUQ6NzY0NjMwNzI3Njc3NzY4ODAwNl8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

刷 X 无意间看到了一个新产品 Airtap。它能像人一样操作我们手机里的所有 App —— 点击、滚动、输入、导航等操作都可以执行。当然它最擅长的不是单次复杂任务，而是把我们日常生活里 每天 / 每周 / 每月重复的琐事自动跑起来。出于好奇我去试了试，最后我只能竖起大拇指。

我能想到的 比如帮你刷抖音、短视频、小红书 找到符合我们设定对应的爆款然后，再通过你自己的专属工作流进行二次创作发布到对应平台，追随热点进行创作还是比较容易起爆。

但是今天我想分享的是我一直想实现，但却不能实现的功能，就是如何将手机的微信聊天记录同步到我们私有的专属知识库中呢？有时候随便用个开源项目去获取微信的聊天记录就有可能触发微信的封控，一点都不好玩。但是用这个Airtap就完全不会存在这个问题了。

本文内容目录如下，可进行选看

- 1、先从官网开始
- 2、安卓手机下载APP
- 3、开启安卓手机无障碍
- 4、测试连接我的安卓小米手机
- 5、在 Claude Code 中安装 Skill
- 6、帮我将聊天信息同步保存到电脑
- 7、总结

## 一、先从官网开始

登录官网 [https://airtap.ai](https://airtap.ai/)

![图片展示的是Airtap官网登录后的界面。上方有“Technology”和“Try it”选项，右上角有“EN -”语言切换按钮。中间大标题为“Set an Airtap.”，下方文字说明“Claim my fantasy waivers at midnight.”，并有“Midnight waivers”和“2 picks claimed claimed”标识。底部大字](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDkxY2ViOTM5ZDcxZDk0MWJmZDk2MzQxNjliOTRkNmZfODI1YzM0MGY5NTM3NmVhNWJiNzIxYzI2OTliMDUwOTVfSUQ6NzY0NjMwNzMwMTU2Njk0MjE2MV8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

点击「Set an Airtap」，跳转到谷歌账号登录，好像必须要谷歌账户

![图片展示的是Airtap官网登录界面。画面中央有Airtap的紫色标志及“Personal AI”字样。下方有一个蓝色边框的“Sign in as”按钮，内有邮箱地址“welyx@gmail.com”，并有谷歌图标。界面底部有提示文字，说明Airtap遵守其隐私政策，且AI可能出错，需双检查。该图片与上文提到的登录Airtap官网并跳转到谷歌账号登录的内容相关，展示了登录时的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODQ3YTM5M2U0OGExY2YxNmZmMTg5MTgzMzIyYWQ4NTlfOGZjMWQ1YmNhNTI3N2E3YmFhZjc2YTdkNWViZmM5OGNfSUQ6NzY0NjMwNzMyMDE2NzQzNTIzNF8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

登录完毕后，看到如下界面。

![图片展示的是Airtap官网登录后的主界面。左侧有“Create new Task”等选项，下方有“Routines”“Help & Support”“Connected Devices”“Current Location”等板块，底部显示邮箱为anyxu@gmail.com。右侧是主操作区域，上方有“Hello”及“Chat with Airtap”“Cloud Phone”“Airtap 1.0”等选项，下方有“Try these tasks”板块，包含“On YouTube, find me the 2 latest videos from MKBHD”“Locate the top-rated sushi spot within 2 miles that’s currently open”“Find me a birthday gift on Amazon for a 10 year old, under $30”等任务示例。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWJiYTk5NjgwMzc5YmFkNWIwNzViMGFiYjRkNDUzMjhfZTc3NWJjMGFhMDk4YzAzNGE3NTRhMDdjZGRiZWEwNTdfSUQ6NzY0NjMwNzM0MjMzNDUxMjA3OF8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

## 二、安卓手机下载APP

> 先重点说一下，体验有两种情况一种就是云手机模式，另外一种情况呢，就是直接在安卓手机上安装APK进行体验，目前呢不支持 IPhone 。

先简单来说一下右上角其实有一个小手机，这就是云手机的效果。

如果右侧云手机显示有问题一直在加载，记得切换网络哈，不行的话多切换几个线路应该就可以了。

![图片展示的是Airtap App的界面。左侧是电脑端界面，显示“Hello 启明”及“你好，今天我能为你做什么？”等信息，下方有“Chat with Airtap”输入框，可选择“Cloud Phone”或“Airtap 1.0”等选项，还有“Try these tasks”板块。右侧是手机端界面，显示Airtap应用图标及部分应用图标。该图片与文档中介绍在Claude Code中远程控制手机微信并同步消息的上下文相关，展示了手机端Airtap应用的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTQ5OTY2YzFlYjkyNGM4YTYxZGRlMzg0NmZkOWY5MDVfN2ViOTQzNTQwNWU4NTE2YjNkM2M1MmFiODVmYTAwMGZfSUQ6NzY0NjMwNzM2NTEwOTQ4NDUwMl8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

接下来点击对话框中的「Cloud Phone」，再点击「Pair New Device」

![图片 addCriterion图片展示了在Claude Code中远程控制手机微信的界面。左侧是Cla addCriterion addCriterion图片展示了在Claude Code中远程控制手机微信的界面。左侧是Claude Code的界面，显示“ addCriterion图片展示了在Claude Code中远程控制手机微信的界面。图片中左侧是Claude Code的界面，显示“RUN TASK ON DEVICE”下有“Cloud Phone”和“Xiaomi 23049RADBC”选项，其中“Xiaomi 23049RADBC”被红色箭头指向。右侧是 addCriterion图片展示了在Claude Code中](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODdhZjlmYzU1OTM2OWQ4ODExNGVlYjdjMzQwZGRlZTVfZDg3YjE3NGJiNTc3MGI1Yjc5ODQxOTY2M2Y0ZDNmZDNfSUQ6NzY0NjMwNzM4NjI2NTI1ODk0OF8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

会看到下载APK的界面，一种是你直接在电脑上下载好，通过微信传递到手机上，另外一种就是手机浏览器扫码下载apk，这个二维码中其实就是apk的下载链接。

![图片展示的是Claude Code中用于连接安卓手机的界面，标题为“Connect your phone”。界面显示需完成两个步骤来配对手机，步骤1是在安卓手机上下载并安装Airtap Autopilot应用，有“Download APK”下载按钮，注明安卓11.0及以上系统适用；步骤2是在手机应用中输入激活码，界面上有8位激活码，还可点击“Generate new code”生成新码。图片对应文档中安卓手机下载APP部分的内容，用于指导用户下载并配对手机。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MjU2MDc2NWQyNzBhMjM4MGQ1ZjY2YzJjNzNhMjk3NDRfNDQ4YTM3NjM4ZjlhYmYxMWQwMTBiNWM4NjZiMTM0ODlfSUQ6NzY0NjMwNzQwNjY0MTMxODg3NF8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

我是直接电脑下载然后微信发给小米手机的

![图片展示的是安卓手机下载的Airtap Autopilot 9.0.0.0.apk安装界面。界面上方显示文件名称及来源，中间提示“检测到此文件为安装包”，并有Airtap Autopilot的图标及版本号。下方有一个蓝色的“安装”按钮。该图片与文档中“安卓手机下载APP”部分内容相关，对应文档中“我是直接电脑下载然后微信发给小米手机的”步骤，展示了下载的安装包界面，为后续安装操作提供直观指引。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzUxNTkzYjYwYjFiZWRkM2ZlMDAzMWM0NGE5NzA5M2FfMWJhNzIyMWY3MDRiNmJmNmJmNTExNjA1NjFkOTk5MjlfSUQ6NzY0NjMwNzQyOTE5ODA0MDAyNF8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

没想到小米8安装成功了，安装成功后，打开APP，先点击首页的「Activate my phone」

然后到官网首页二维码那个弹窗右侧有一个配对的六位Code，记得要点击一下下面的「Generate new code」

![图片展示的是Airtap Utopilot的配对页面。上方有其标志及名称，中间有AI图标和锁形图案。页面提示“Enter Pairing Code”，并有网址“https://airtap.ai/app to obtain your pairing code”。下方有六个灰色方块，分别显示字母和数字，其中“7”被紫色边框突出显示。底部有一个紫色“Verify Code”按钮。该图片与文档中“安卓手机下载APP”部分相关，是安装成功后打开APP并点击“Activate my phone”后，官网首页二维码弹窗右侧“Generate new code”点击验证后的页面展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTAwZjc1NTJjNTk2ZDQ4ZjQwNTkzNzFhYTdjOGE5MWRfMzk4MTI3NTE3YzcwNzNjN2MxZmNmNzQ4NTg2M2UxNjdfSUQ6NzY0NjMwNzQ1MDMxMjIzMTg5NV8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

点击验证之后应该就可以在官网上看到配对的这个手机了。

![图片展示了在Claude Code中远程控制手机微信的界面。画面中弹出“RUN TASK ON DEVICE”窗口，显示可操作的设备有“Cloud Phone”和两台“Xiaomi MI 8”，其中一台设备的receiver编号被高亮显示。下方“Chat”区域有“+ Pair New Device”按钮，以及“+”图标可添加新设备。此图与文档中开启安卓手机无障碍设置后，进行设备连接操作的内容相关，直观呈现了设备连接界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTI2ZjUwMjYyMjJmZjQ5OTI5YWQ4OTg1YjcwNTdkN2FfMTVmZGNiMjcxZmVjNGUzZmI1ZjFlY2UyMzVlM2FiMzhfSUQ6NzY0NjMwNzQ3MzE3OTkwNDk4Nl8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

## 三、开启安卓手机无障碍

配置成功之后就可以看到下面的页面

![图片styleType: "imagestyleType: "图片中显示的是Airtap Utopilot的权限设置页面。图片styleType: "图片中显示的是Airtap Utopilot的权限设置页面。页面上方有Airtap Utopilot的标志及文字“Accessibility permissions are required for Airtap Autopilot app to work properly”。下方有三个权限选项，分别是“Permit Screen Visibility”（允许屏幕可见性）、“Allow Tap & Input”（允许点击和输入）、“Enable App Navigation”（启用应用导航），每个选项旁有对应图标。中间有一个紫色的“Allow Accessibility Permissions”（允许无障碍权限）按钮。下方提示“需设置](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGQzNTYwMTRmZDlmMzJjMzY0NDMxMGU1MmEyODA0MTZfMTI3MGQ0ODM0YTVhYzRkMzRjMDBlYmYwNWY4NjBiZGRfSUQ6NzY0NjMwNzQ5NzU1NjU5MzYwNl8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

需要设置受限的功能

- 允许读取屏幕内容
- 允许点击和输入
- 启用应用导航

先点击「Allow Accessiaility Permissions」

- 1、开启无障碍功能：我的点击之后，就能看到无障碍功能菜单->是关闭的，点击后直接开启服务即可
- 2、还有一个可下载服务也去点击开启就可以使用了

![图片展示的是在Claude Code中远程控制手机微信的界面。上方显示“Xiaomi MI 8 - Connected”，表明手机已连接。中间有“Autopilot is ready”提示，下方有“Give a task”区域，可使用Airtap web app执行任务，还提供了任务链接。下方有“Keep Screen Awake”“Notifications”“Progress Border”等设置选项，其中“Notifications”已开启。右侧有一个蓝色的音量图标和一个蓝色的铃铛图标。该图片与文档中开启安卓手机无障碍设置后权限设置成功的内容相关，展示了权限设置后的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTNkZmY3ZDlkOGFjN2M0NWU3MjE4ZWZlYjEzMDc3YzJfMGUxNzg1Y2I0MzFmYzZkNmU3NTM4ZmY4YzM5ZWJiNzBfSUQ6NzY0NjMwNzUxODMxNDc0NDc4NV8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

进入到这个页面就代表权限设置成功了。

## 四、测试连接我的安卓小米手机

下面我们测试一下，在网站的对话框中直接输入： “帮我打开微信，并给AI少年发一条消息：早上好啊”

效果看下面的视频，能有这个效果确实真的好牛逼啊。

虽然说目前速度上有一定的延迟，但这个早晚是可以解决的。

第一：他能默认选中第一个微信(我手机中有两个微信)

第二：能直接找到我的微信好友

第三：能直接替我发微信消息



![图片展示的是Claude Code界面中与AI助手的对话内容。上方提示“Discuss your main features”，下方输入框显示指令“帮我打开微信，并给AI少年发一条消息：早上好啊”，并有“Xiaomi 23049...”和“Airtap 1.0”标识。该图片与文档中“在Claude Code中安装Skill”部分相关，用于说明在Claude Code中可直接安装Skill，此处展示了使用Skill与AI助手进行交互的示例。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGJkOTM0NzVkNmZhY2M3NGQ5YWQyZDZmOGJjZDQ1MzBfYzM4NDZiNmFkYmZlOTJiNWU2OTdlYmNjZjI1N2Y2OTJfSUQ6NzY0NjMwNzU0MTMwMzIxNzEwNF8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

这才是我的手机助手啊

## 五、在Claude Code中安装Skill

airtap官方提供了一个Skill , 仓库地址是 [https://github.com/airtap-ai/airtap-skill](https://github.com/airtap-ai/airtap-skill)

```Bash
## 可直接执行这两个命令

## 也可以直接丢给AI让它来安装Skill

claude plugin marketplace add airtap-ai/airtap-skill

claude plugin install airtap@airtap


```

可以直接在 Claude Code、Codex、OpenClaw、Hermes Agent 或者其他 AI Agent 产品中安装这个Skill， 看下图命令已经有了说明已经安装好了。

![图片展示了Claude Code界面，显示版本为v2.1.139。界面上方有欢迎信息“Welcome back 8405-2-hello!”，并列出一些功能更新，如添加了agent view等。下方命令行输入“/air”，右侧提示使用此技能在用户想操作Airtap或通过移动应用完成请求时，列出接收者和模型。该图片与文档中介绍在Claude Code中安装Skill的内容相关，直观呈现了安装后Skill在界面中的显示情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2U3OGU5ZDliOWFkZmZmYTM3NWEzN2IzN2JjYTUzMTlfOGVmODdlZmE3MDUwYzlkOWEwNjA5NjI4ODM0NmQwNzNfSUQ6NzY0NjMwNzU2MzQ5NTI0NjgwNl8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

安装完毕就可以看到这个 Skill 了。

然后在Claude Code中继续输入“请列出可用airtap接收器” （我是直接通过上面github中都有明确的使用指南）

![图片展示的是在Cla addCriterionClaude Code中安装Skill后，执行“请列出可用airtap接收器”命令时的报错界面。界面中显示了错误信息，指出缺少auth token，需先运行“--add-token”命令设置令牌。下方有红色框突出显示“Error: Missing auth token”，并提示在airtap技能中运行此命令前需设置令牌。该图片与文档中介绍在Claude Code中安装Skill及设置令牌的操作步骤相关，直观呈现了安装Skill后的报错情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODZjZGI5MTRhOGYxNTQ1NzBkZTI2NTgzZDEzM2QyNjFfNGYxZjE5Y2NkMDE4M2Q2NTkxNWI2ZTNmYTBlYTZjZTVfSUQ6NzY0NjMwNzU4NzMyMzA4NzgxOV8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

红色的报错，代表我上面安装了Skill , Skill 中的脚本使用了python代码，他要安装依赖。

下面的报错就提示的非常明显了，我要进行设置一个令牌。到官方网站，然后点击左下角图标。

![图片展示的是airtap.ai网站的设置页面，处于Personal access token设置项下。页面显示“Active Token”处有一个红色警告框，提示“Copy this token now”，并说明这是唯一一次显示完整token的机会。下方有一个“Copy”按钮。页面左侧有Connected Devices、Personal access token、Personalise、Memory四个选项卡。该图片与文档中设置令牌的操作步骤相关，是获取令牌以配置Claude Code技能的界面展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NGNhNWUzODBkNjc0Y2RhYWM5NTNkZjhjOTZmNWQyNmNfYTE3YjQ3MzkzYjlkMzViMzE5MzVjYTFkNTM4NmFmYjZfSUQ6NzY0NjMwNzYwNTczMzUyNjQ5Ml8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

然后「Copy」这个token 直接发送给Claude Code叫他帮你配置就好了。

![图片展示了在Claude Code中远程控制手机微信并同步消息的测试连接界面。界面中显示可用airtap接收器列表，包括cloud、Xiaomi 23H49HADBC和Xiaomi MI 8等设备信息。下方有“bypass permissions (shift+tab to cycle)”提示。该图片与文档中测试连接安卓小米手机的内容相关，直观呈现了在Claude Code中列出可用airtap接收器的操作结果及设备信息，辅助说明了技能配置及设备连接情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTgyMzZkYjVjZTI5YThiMDM2NTRjZTBjY2ZiY2MzMzhfYzY4ZTI5YjY1NWM1YjhhYWE5OGM3OGNlNTBiMmJhNjFfSUQ6NzY0NjMwNzYyOTUzMDk5MTU3Ml8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

体验在Claude Code中帮你回复消息

![图片展示了在Claude Code中远程控制安卓小米手机微信的操作反馈界面。画面显示了“列出可用airtap接收器”指令执行后的结果，包括使用小米手机23849840ABC给“A1少年”发送“该上班了”消息的任务创建及执行情况。任务已成功创建并执行，用时约31秒41，显示了任务状态为“success”及相关任务ID等信息。此外，还提示已成功向“A1少年”发送消息，任务已完成，等待新指令。这与上文在Claude Code中体验回复消息的内容相呼应，展示了实际操作效果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZThlYWU1ZTY5ZTJkNTg5NWU3MDUwYjZlYmNlZjU1MTlfMTlkM2VjMGY5M2Q2ZWQwZDEzNmJiYjdmZGUwNmMwY2NfSUQ6NzY0NjMwNzY1MTU3NTcyOTA5Ml8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

跟上面的视频体验完全一样，这个Skill还是相当给力的。

## 六、帮我将聊天信息同步保存到电脑

继续直接在Claude Code中进行输入消息“帮我把跟AI少年最近五条聊天记录保存到Claude Code当前文件夹，使用md格式进行存储”

![图片展示了在Claude Code中远程控制手机微信并同步聊天信息的操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzE5ZjFkN2YwNmEwMjk5OGJlNjZkYWZmMDZkZTFiODlfN2UwN2JmNmFmOTI4YjdmZjIzOWZlNDM5NTVmMzU4OGFfSUQ6NzY0NjMwNzY3NDg4ODA0NzU0NF8xNzgxNzcwOTIyOjE3ODE3NzQ1MjJfVjM)

当然看提示词，他对图片没有进行识别，可能对视频也没处理，我们可以通过提示词来进一步处理。

我试过了因为如果是一个视频，他可以点开播放，然后进行截图并分析视频的内容和声音的，所以像语音、文件、图片等都可以进行处理的。

来摘取重要信息，再对接自己的工作流或者知识库，对群消息进行定点监控处理。

不会再错过重要群消息的任何一条记录。

## 七、总结

感觉可以深度使用一波，而且他还有云手机可以体验，有兴趣的来玩玩吧。