# 完全不懂 也能3 分钟搞懂 Agent Skills，让 AI 自动替你干活

​

![图片以“Agent Skills：AI的超能力插件”为主题，介绍其为AI装App，即插即用的核心机制。画面中，机器人向人类求助，人类表示每次都要重教，重复劳动。右侧展示了技能包结构，包含操作说明、参考资料、可执行脚本、资源文件等内容。还呈现了核心机制的三个步骤：只看目录省Token、需要时看说明书精确、干活时调用工具执行。最后强调更省资源、更专注、少出错，助力驾驭AI系统指数级增长，提升未来竞争力。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTY4NjI5ODQzMjgyNDRmYTBhNWIzNjM3NDNkMzIxNTNfNTViMjU4ZjFjOGVhOTgyODBjNTJlM2IyZjliMmEwYzVfSUQ6NzY0NjMwNzk1MzQ3ODczMjc3MF8xNzgyMTA3MjQzOjE3ODIxMTA4NDNfVjM)

这篇文章就是通过宝玉Skill自动推送上来的，我检查了一下，然后就发布了。

因为前两天写了关于使用宝玉Skill，如何将本地markdown文章推送到推特后台，我看有些人似乎没有使用过Agent Skills，所以写一篇通俗易懂的文章，来简单说一下Agent Skills的强大。

希望让每个人都能用上更强大的 AI 工具，不做浪潮下的看客，而做驾驭 AI 的人。

先简单一句话总结：

> **Agent Skills = 给 AI 安装“技能插件”，让它学会某件事，并且下次还能直接用。**

就像手机我们给手机装 App 一样：

- 想拍照 → 打开相机
- 想聊天 → 打开微信
- 想让 AI 帮你整理笔记 → 用“笔记技能”
- 想让AI帮你下载大片 → 用“下片技能”
- ..........等等等等

这样就不需要每次重新教了！

先讲解一下以前的情况，AI 能做什么，主要取决于下面的两点：

- 它学过什么（开始训练数据里包含了哪些知识）
- 你当下告诉它什么（聊天开始或者过程中你喂给它什么数据）

但有个问题：

👉 **每次我们都需要重新讲一遍，很浪费时间。**

而 Skills 的出现，让 AI 有了长期记忆的工作方法。

你可以把 AI 想象成：

🧠 一个超级大脑

🧰 Skills 就是它的工具箱

工具箱里不只是工具，还有：

- 使用说明
- 操作步骤
- 注意事项

AI 不需要提前记住所有内容—— 只要需要，就会打开说明书。

这叫：

非常聪明。

其实，一个 Skill 就像一个文件夹，里面放着：

![图片展示了GitHub仓库中技能文件夹的文件结构。左侧是仓库目录，右侧是文件列表，包含assets、references、scripts三个文件夹和SKILL.md文件。其中，assets、references、scripts文件夹被红色箭头1、2、3指向，SKILL.md文件被红色箭头4指向。该图片与上下文紧密相关，直观呈现了技能文件夹中各部分的存放位置，帮助理解技能文件的组织形式。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWVhMDRjZTk5ODY0ZDhlYWZmNzMzYTFmYWRiNjYyOTdfNjZiMjllOWUyMmIxOTdjOTM0MDUwNTYxODI0OTk4OWFfSUQ6NzY0NjMwNzk3ODUyNjM5NTM0OF8xNzgyMTA3MjQzOjE3ODIxMTA4NDNfVjM)

## ✅ 1. 操作说明（最重要）

告诉 AI：

- 要做什么？
- 按什么步骤？
- 输出什么格式？

例如：

> “先读文章 → 判断风格 → 再润色 → 最后输出优化版本”

## ✅ 2. 参考资料（可选）

更详细的说明，比如：

- 写作技巧
- 编程规则
- 解题思路

## ✅ 3. 可执行脚本（进阶）

比如：

- Python 程序、或者可执行的文件
- 自动整理数据的脚本

让 AI 不只是会说，还能会做。

## ✅ 4. 资源文件

可能包括：

- 模板
- 图片
- 表格

如果 AI 一次性记住 50 个技能，会发生什么？

⚠️ 成本暴涨 （每个技能2000token,50个就是100000token，每次都要发送）

⚠️ 注意力分散 （上下文过长、总要进行压缩）

⚠️ 容易出错

于是设计者想出了一个非常聪明的机制：

听起来复杂，其实非常好理解：

## 第一步：只看目录

![图片展示了名为“baoyu-post-to-x”的Skill文件夹内容，其中SKILL.md文件被记事本打开。文件中以Markdown格式定义了Skill的name为“baoyu-post-to-x”，description为“将内容和文章发布到X（Twitter）。支持带图片/视频的常规推文和X文章（长篇Markdown）。通过真实的Chrome CDP绕过自动化检测。当用户提到‘post to X’，‘tweet’，‘publish to Twitter’，或‘share on X’时使用。”该图片与上文提到的“第一步：只看目录”相关，直观呈现了Skill的定义格式。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDUxNTY5NThjMmU4MDE5ZTMyMzBiYzk3OThhNDMwMGVfNzA5NjYzMDNiZTExYTFhYmIyOTI1NjhhM2JhNmVmMDZfSUQ6NzY0NjMwNzk5ODEzMTAzMDk4M18xNzgyMTA3MjQzOjE3ODIxMTA4NDNfVjM)

图中只是一个Skill的，时间就像一本书的目录。

AI 只知道：

- 我会整理 Excel
- 我会写周报
- 我会润色作文

但不知道具体怎么做。

👉 **占用极少资源，也就一两百的token，多了也就三四百**

## 第二步：需要时再看说明书

当你说：

> “帮我将文章发布到X。”

AI 才会打开“发推文的处理技能”。

读取详细步骤，也就是去读取SKILL.md， 这样精确到具体的技能说明。

![图片展示了名为“SKILL.md”的Markdown文件内容。文件说明了名为“baoyu-post-to-x”的技能，可将内容和文章发布到X（Twitter），支持带图片/视频的常规推文和长篇Markdown文章，通过Chrome CDP绕过自动化检测。脚本目录位于“scripts/”子目录，Agent执行时需确定SKILL.md文件目录路径为“SKILL_DIR”，脚本路径为“${SKILL_DIR}/scripts/<script-name>.ts”，并替换实际路径。该图片与上文提到的“需要时再看说明书”相呼应，直观呈现了技能说明书的内容。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGFhMmZmOTQ2YTI4MWIxMGJlNDU5YjcxMmZlMjYzMDhfZjIyYjI4YjA4NGE4NjYzOWM3YzVjMzhmNmNkYjNkYWJfSUQ6NzY0NjMwODAyMzkwNDIyNjIzNl8xNzgyMTA3MjQzOjE3ODIxMTA4NDNfVjM)

## 第三步：真正干活时再调用工具

比如：

- 查资料
- 运行脚本
- 读取文件

只有用到才加载，如上面第二步。

## ✅ 更省资源 更省token(也就是更前)

## ✅ 更专注，不容易出错（上下文短理解就更好一些）

这就是为什么很多专家认为：

> **Skills 是未来 AI 工作方式的重要方向。**

## Skills 像工作流程打包器

适合：

- 固定学习方法
- 写作流程
- 编程步骤
- 知识整理

👉 更偏向本地能力，也可以写脚本调用外部接口，Skills中也可以调用MCP（这里不过多强调知道有这么个词就好）。

- AI 自带基础能力
- MCP 负责连接世界
- Skills 帮你形成自己的学习和工作体系

三者并不会互相取代，而是协作。

因为未来学习方式正在改变。

不再只是：

> 背知识的人更强

而是：

> **会使用 AI 系统的人更强。**

举个例子：

普通自媒体工作者：

> 每次写作文 → 从零开始。

会用 Skills 的AI自媒体：

- 自动整理素材
- 优化结构
- 检查逻辑
- 提供高级表达

效率可能高出 **30%–70%**。差距会越来越明显。

现在已经有很多开源社区，例如： [https://skills.sh](https://skills.sh/)

而且好消息是：

只要你会写清楚步骤，就能做一个。

甚至已经有工具：

> 用自然语言描述需求 → 自动生成 Skill。

未来可能人人都会拥有：

> **努力只是线性增长的话，那么能驾驭AI系统是人便会呈现指数级的增长。**

早点理解 Skills，不是为了炫技，而是为了在未来的学习竞争中——

👉 **拥有真正的“超能力”。**

---

> 来源：飞书 · AI Spark 知识库 ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/KeYPw2iy2iISLHkm00Sc5DlIn0d> ｜ 归档：2026-06-01
