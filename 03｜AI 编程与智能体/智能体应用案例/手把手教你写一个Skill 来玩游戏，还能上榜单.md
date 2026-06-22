# 手把手教你写一个Skill 来玩游戏，还能上榜单

​

![图片展示了“用Claude Code玩转AgentTank - AI Agent坦克对战”的内容。画面中有两辆坦克，一辆蓝色，一辆红色，背景为暗色调，营造出战场氛围。蓝色坦克发射出蓝色光束，红色坦克发射出红色光束，两者对峙。图片与上下文紧密相关，上下文提到作者希望看到AI Agent间能彻底对战，而此图则以坦克对战的形式，直观呈现了AI Agent对战的概念，契合作者对AI Agent游戏对战的期待。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NGE0OWYxMTRlN2RmNTgwMDQzZWY3YzhhMDJiZjNjNGRfN2IwZDFmYWZiM2IyMjU5YzM0YjRiMmQxZmFiMWU1NWVfSUQ6NzY0NjMwODE0OTExNjQ4ODY1NF8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

2026年3月19日我发过一个帖子，当时就有个想法：无论是网站还是APP或者其他形式，早晚会出现一款游戏或游戏平台对外开放接口，让 OpenClaw、Hermes Agent、Claude Code、Codex、OpenCode 等 AI Agent 接入进来互相对战，实现 Agent 与 Agent 之间的对决。

当时搜了一圈，发现大多都是打着 Agent 旗号的简单小游戏；有些虽然能对接 Agent，但也只是让 Agent 跑跑 API 调用，并不彻底。当然，也可能已经有成熟的产品存在，只是还没进入我的视野。

我当时的帖子的想法在这里

> 3月19日

> Google Stitch 语音直接生成可交互的APP和网站，真的太赞了，效果还不错。现在对中文支持也非常友好了。 准备做个App：App叫龙虾农场，农场里有很多的小游戏，App可接入OpenClaw等类似的小龙虾，统一对外开放接口，让Agent去玩游戏，赢取千亿token奖励。

这不前两天随意刷消息的时候看到了这个游戏。它的官网地址是：[https://agentank.ai/?invite=e3cc7c563d](https://agentank.ai/?invite=e3cc7c563d) ,注意邀请没有奖励，每人限制创建三个坦克，邀请了人可以多创建坦克而已。

看域名就能看出来，坦克大战，跟Agent可能有关的，我就注册账号进去一看果真如此。接下来我就教大家来用Claude Code （Codex 等也是可以的哈）手搓一个Skill 来玩来这个游戏。

看看下图我「AI少年」此时排名28了，可能你晚点来看的时候排名又变化了哈，如果你来玩可以直接在排行榜对我发起挑战的，看不到我可以评论区告诉我 哈哈，我再实战挤进排行榜就可以了。

![图片展示的是一个游戏排行榜界面，显示了排名前30的玩家信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGZmODE4NDc3N2RhMzZmYTg5YjdhZWU1N2QzNWEwYmZfMDNhMzVlMzg3OWM0YWFjZmM5NWQzNjVjOWIwMzc5MDZfSUQ6NzY0NjMwODE3MTA4Njc3NzI4NF8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

本文内容目录如下，可进行选看

- 1、先来看看网站上的游戏是怎么玩的
- 2、再来看看Claude Code中如何接入
- 3、一步一步封装成Skill
- 4、在 Claude Code 中实战
- 5、实战完去网站看结果（附对战视频）
- 6、总结

## 一、先来看看网站上的游戏是怎么玩的

打开网页地址之后，点击右上角的 Log in。

![图片展示的是网页上登录AgenTank的界面。界面上方提示需在创建坦克、旋转密钥、发布版本或开始战斗前登录。下方有“Continue with GitHub”和“Continue with Google”两个红色按钮，以及一个输入框，用于输入邮箱地址。下方还显示“Success!”字样，表明登录成功。该图片与上文提到的登录方式相关，直观呈现了使用GitHub账号登录的步骤。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGQ3NjdhYjAyOTcwNWM0YjU5YWIzZmQ0MWU3MTgzYTRfMGUyMzczMTE5NDMwNDAxNGFjZDQ1ZTU3NmNiZDdiYjVfSUQ6NzY0NjMwODE5MzcwMjEzNjc4NF8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

有三种登录方法，github账号，谷歌邮箱账号，或者直接使用咱们的QQ邮箱 163邮箱查收一下验证码也是可以进去玩的。

![图片展示了AgenTank网站界面，右上角有“重新启动即可更新”和“AT少年”标识。点击右上角昵称后弹出下拉菜单，其中“Settings”选项被红色箭头指向。该图片与上文“点击右上角昵称->Settings->Language->中文”内容相关，直观呈现了点击右上角昵称后出现的下拉菜单，帮助用户找到“Settings”选项，以便后续进行语言设置等操作。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzU3ZGE4MjU5M2Y0ODY3MGY5NjFkNWUyZDY5MGYxZWVfN2Y2ZDRmYWY4YmU1OGQ3NmE0NTRhMmFmN2M5YjI3Y2VfSUQ6NzY0NjMwODIxNDQ4NTU4NDg0NF8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

点击右上角昵称-> Settings->Language->中文，上面的英文截图看着头晕，现在顿时清爽了。

![图片展示的是AgenTank游戏网站页面，页面左上角显示“AgenTank”名称。左侧有“坦克”“竞技场”“赛事”“排行榜”选项，下方有红色的“创建新坦克”按钮。中间区域提示“你还没有坦克，先创建你的第一辆坦克，然后把它送进竞技场”。右上角显示用户昵称“AI少年”。该图片与上文提到的在网站上进行操作相关，上下文提到点击右上角昵称进行设置语言等操作后，要点击图中的“创建新坦克”按钮，图片为后续操作提供了视觉指引。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzdiODM0YjAzMDg4MGIwMDE1MmIyZTQzZDJkOGVmMzJfZDAzMDhmNTI5OTA4Yjc2MmVjNzE5MTRlZmE1ZmNhZDBfSUQ6NzY0NjMwODIzNTg2MzUyNjM0OF8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

点击上图中的「**创建新坦克**」

![图片展示的是网页上agentank.ai/tanks中“创建新坦克”界面。界面上方提示创建坦克需先选战斗性格，马上送进竞技场。下方有坦克名字输入框，示例为“M1艾布拉姆斯”，外貌描述框示例为“经典沙漠黄”。战斗性格有三种选择，分别是均衡型、弹夫型、流星型，弹夫型被选中。底部有“创建坦克”红色按钮。该图片与上文“点击上image_id’”的操作步骤相关，是创建坦克操作流程中的一个环节。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MWYyODZiZjRmYmUwNzYxMDIyMmM3M2E3MjlhYTc2NzhfMjI3YjMyMmRiYTJjY2VmZDhlM2QzODk5MGUyNTg1MmFfSUQ6NzY0NjMwODI1MzgzNjExOTAwMV8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

这个战斗性格选了不知道后面还能不能改，主打主动出击，先试试看，点击「创建坦克」，等待几秒坦克创建完成。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MjY3YmJjNzdiYzg2Y2JjMjg1ZTEwNTFhYTgxZjNkNjlfY2FkZWYyNjg5ZmJlMjJhZTQyMjY1MjUwZWU2NTZjNWZfSUQ6NzY0NjMwODI3Nzk2MTYyNDU0MF8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

[https://agentank.ai/agent-guide](https://agentank.ai/agent-guide) 这其实是Agent运行指南，可以直接丢给AI 问他就好了，下面就到Claude Code中问问。

## 二、再来看看Claude Code中如何接入

由于最近 Claude 又被封了，没办法不能用官方的。刚好看到最近蚂蚁百灵大模型 inclusionAI: Ring-2.6-1T 开源了，在OpenRouter 平台上的地址 [https://openrouter.ai/inclusionai/ring-2.6-1t](https://openrouter.ai/inclusionai/ring-2.6-1t)，我就拿来接入到 Claude Code 玩一玩看看。

首先在～/.claude/settings.ring.json 配置蚂蚁百灵开源大模型，只需要在OpenRouter平台设置一个API key就可以了。或者换成国内的其他模型。配置应该都是类似的，主要换一下Base URL和模型、api key。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGIwNDM4OTIyY2U1YWM0N2RiY2U3ZmEyZmU5NjJlNGVfNWJjMGFkZTg4NDk5NjZkZmZmNjA2ZTNlMjhjZWYyZDdfSUQ6NzY0NjMwODI5ODUxNzgxMDEwN18xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

然后我这里直接使用alias命令行短别名，可以直接让你的AI Agent 进行设置就可以了。

```Bash
alias cc-ring="claude --dangerously-skip-permissions --settings /Use

rs/aehyok/.claude/settings.ring.json


```

这样再打开终端，就可以直接输入\\\\\\\`cc-ring\\\\\\\`就能打开如下Claude Code，并且加载的模型是蚂蚁百灵大模型。

然后我直接在Claude Code中询问： “[https://agentank.ai/agent-guide](https://agentank.ai/agent-guide) 看看这个网页有什么用啊？”

如下图所示。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmFmZWVlMzVmY2MxYWM5OWEyZmNkMDhiZWU4MWEwMjFfODZmNjFhNTEwYTUwNDg3NThhYzY2MjBiOThlMDcyODRfSUQ6NzY0NjMwODMxODI3NTEyODI4OV8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

上面截图中说的很清楚了，给我们提供了9个 API 端点。主要的就是四个

- 读取坦克上下文
- 发布新版本坦克代码
- 模拟测试
- 发起真实录制对战
- 其他（读取排行榜、查找公共对手、读取比赛记录等）

> 我们只管字面意思就可以了。就是大白话告诉 Cloude Code 怎么做就好了。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmJhYWZiNmY5NTk4MTQyNTJiNDI2MjYzNWVlZmQ5N2FfNWJjNDc2MWM1MDUwMWNhZmNjMGFkZmJmZTY3MGFmNGZfSUQ6NzY0NjMwODMzOTMxMjY0MzAxOV8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

看上图我继续追问：“现在要怎么玩”，这里你可以把key 配置在本地文件中，告诉他叫Agent读取。这里我直接聊天框把 Key丢给他。



![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWIxNjQ2ZjdmMzZlY2Q0MTI4NGNhMTZmOWFjMTc0Y2NfM2YyZDVjZDQzN2U0NWFkOTAxOWRjZDQ0ZjA4OTE0ZDZfSUQ6NzY0NjMwODM2NDY1MzMxNzA2MF8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

这里回到网站，点击查看该坦克的详情

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTA0OTY3NGM1NzQwZjNlMjg2NDU2ODk4OTgzOTk3NWZfYjU4N2I5YzAxZGQzMWM1ZjgwYjZlM2VkOThhYWUxYzhfSUQ6NzY0NjMwODM5MDU3NzMyNzA3M18xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

上图就是网站初始化的时候给我们的V1 坦克对战的逻辑代码，其实不用管他干什么的，直接问AI就好了。

根据上面的视频，其实已经知道了基本的玩法。

- 1、自己可以多创建几个不同类型的坦克
- 2、然后对战的时候可以选择不同的地图
- 3、对战分为模拟和实战，模拟就是跟系统训练的机器人进行对战，用来提升你代码版本的质量，实战的话更可以检验你代码的质量如何了

## 三、封装成Skill

我前段时间安装了 Claude Code，还没安装任何skill。所以现在第一步就是先在 Claude Code 中安装能创建 Skill 的 Skill。

```Plain Text
npx skills add https://github.com/anthropics/skills --skill skill-creator 

                 

帮我安装一下这个skill


```



![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWFkODI5ZjI1OWI3OGU4Nzg5ZWU4MmMzMTY5MzhlNDZfYjZhNzAyZmY5MTM0MTAwMWRmY2M1ZmM2Y2MwY2I4ZDNfSUQ6NzY0NjMwODQxNzQ4NDg2ODU3N18xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

封装成 skill 之后就变成我的资产了，因为在上下文中使用完毕，我下次再想玩游戏就又得从头重新来过，有了 skill 之后，我想什么时候玩直接告诉 skill 就可以了，也就是将重复性的工作或功能封装成 skill，来减少我们的重复工作，哪怕是娱乐。

## 四、实战

下面就直接在 Claude Code中的实战



![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YmJmNzlkZWMyMTc0ZGZmZjg2MzFmYTkzZGRlY2ZmNjlfMjc2NjNlZTlkOGI3NjgxNTZhYTQxNzNlZjhiMDJiNTBfSUQ6NzY0NjMwODQzODgxMjk4NjMyMF8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

看视频其实是从直接实战，到两场失败，开始让AI Agent 优化策略，然后先跑模拟对战，测试代码，再继续实战。

## 五、实战完去网站看结果

其中有Agent 游戏演示，有兴趣的可以看看。



![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2VmZTU2ZGM1MjYzYzQ5NDI3YmIzNjI4ODYzNzY2M2JfNzM0MzcwODUzY2Q2ZmY0OTg0NjE1OTQwMjMwZDAxMTBfSUQ6NzY0NjMwODQ1OTExNzYxMTk2NF8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

## 六、总结

看时间这是我使用openrouter平台上 Ring-2.6-1T 模型的实时消耗。

其实没多少，反正挺好玩的。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmM2ODY0ODkwZWEzNTAxNzU3ZmVjYjA1NTAwYzhhNjZfMzJjYmZiZTRhMDQyNThlNzVjNzhlOGM1NjliYTkzMDVfSUQ6NzY0NjMwODQ4MjM0NzIwNzYxMV8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

这个模型跑个小策略看来是没太大的问题，而且推理能力还是很强的，当然可能我这里测试的强度还没上来。

上面主要是跑策略玩游戏 花不了多少。前期准备工作 了解游戏、加上制作Skill 总共大概一刀的成本。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmVlNGFkZjM5NDJlYzY4ZDZlMzM0NzJhYTFmYTg2M2FfODEwMzYxNTUxNzVkMzI2NjY4ZDYzZGYxY2JhZDYzYTFfSUQ6NzY0NjMwODQ5OTI3NDQ1MTkxNl8xNzgyMTA3MjY1OjE3ODIxMTA4NjVfVjM)

---

> 来源：飞书 · AI Spark AI Wiki ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/HExPwjWeniDtICko4jickJj1ncc> ｜ 归档：2026-06-22
