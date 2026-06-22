# Obsidian 写作环境搭建：这 6 款插件让我的博客管理效率翻倍

前段时间Obsidian非常的火，所以我准备上手学习一下，就看到我自己其实有挺多文章需要归纳和处理的，所以准备花时间尝尝鲜。

现在的主要工作就是设置Obsidian然后把我博客文章里面的文章全部从 Halo 迁移到了 Obsidian 管理，折腾了一圈之后发现这套组合比想象中顺手很多。这篇记录一下我现在的配置，顺便把迁移途中踩的几个坑也说清楚，省得你重踩。

其实最主要的点，还是因为我想配合AI去使用，在Obsidian结合AI使用会非常的便利。我也是看中了这一点，花了一些时间主动学习了这个工具

---

## 安装

其实直接搜索Obsidian就可以了，但是怕很多人搜索错我就直接贴对应的地址了。

[Obsidian官方下载地址](https://obsidian.md/download)

![图片展示的是Obsidian的官网下载页面。页面背景为黑色，中央有一个紫色的岩石图标，下方有“Obsidian”字样。页面上方有“Download”“Pricing”“Sync”“Publish”“Enterprise”等导航选项，右上角有“Community”“Account”等按钮。页面底部有一个紫色的“Download for macOS”按钮，显示“Last updated March 23, 2025”。该图片与文档中“安装”部分的内容相关，直观呈现了Obsidian的下载入口。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmFhY2UyYzkwNzU4MDFjZDE4NGJhOWI4YTIxM2IzMGNfZDRhNmRiNzE5MjNmNmVkZjNmOTg4OWZhMDMzZjEyNzZfSUQ6NzY0NDk4MTEwMzg5OTQ5NTYwOV8xNzgyMTA3MzA0OjE3ODIxMTA5MDRfVjM)

## 主题：AnuPpuccin

我这里使用了好几个主题，最让我舒服的还是AnuPpuccin，主要是它的暗黑系风格和我的IDEA的主题像类似，这样我就可以很好的使用它。

而且AnuPpuccin的下载量 80 万+，目前 Obsidian 社区里最受欢迎的主题之一。亮暗模式都好看，配色方案多，不会让你盯着屏幕眼睛酸。

我主要用深色模式写作，配色调成了偏冷的灰蓝，长时间写稿不容易疲劳。如果你对界面颜值有要求，AnuPpuccin 基本是开箱即用不用再找别的。

配置方式也很简单，点击左下角设置按钮，然后找到外观，主题设置就可以更换你自己想要的主题了。

![图片展示了Obsidian的外观设置界面。左侧为设置菜单，选中“外观”。右侧是外观设置内容，包含基础颜色、主题色、主题等选项。其中“主题”部分被红色框突出显示，显示已安装主题为“AnuPpuccin”，并有“管理”按钮，下方还有“已安装主题”区域，提示已安装3个主题，以及“检查更新”按钮。该图片与上文介绍的AnuPpuccin主题配置方式相关，直观呈现了主题设置位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZThlNjQ5YWUxNmM0MTYwNTM2MDNiZTg2MjEzOTlkMGZfMTQ3YmZlMTg5Nzc0Y2Y3MjI3YzQxZjA3MGRlNDk0MTBfSUQ6NzY0NDk4MTEzMzEwNDQ4MzUyNF8xNzgyMTA3MzA0OjE3ODIxMTA5MDRfVjM)

---

## 插件配置

安装的使用第三方插件是需要关闭安全模式，如果没有关闭是无法安装第三方插件。下面就是我使用很不错的第三方插件。

![图片展示了Obsidian插件管理界面。界面中“社区插件市场”选项被紫色框突出显示，旁边有“浏览”按钮。下方“插件安装情况”显示已安装6个插件，右侧有“检查更新”按钮。最下方“自动检查插件更新”开关处于关闭状态。该图片与上下文紧密相关，上下文提到在Obsidian中安装插件时，需先点击“浏览”进入社区插件市场，再选择插件进行安装，此图直观呈现了“浏览”按钮所在位置，帮助用户了解插件管理操作流程。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDUwODk5MzU3YTU5NjFlOTYzM2I3YTE4NjIyMThiZGRfNGE1YjgzZjc5ZDhjYWM4ZmI0MzJmODhiZWM4MThlMWNfSUQ6NzY0NDk4MTE1ODMzMzE0MDE2MV8xNzgyMTA3MzA0OjE3ODIxMTA5MDRfVjM)

### Custom Attachment Location

附件按笔记名自动归类到对应子文件夹。以前图片全扔在 vault 根目录，找起来一团乱；装了这个之后，每篇文章的截图自动进 `assets/文章名/`，整洁很多。

![图片展示了Custom Attachment Location插件的Advanced设置界面。左侧显示“Markdown URL格式”，说明插入到Markdown中的URL格式，可查看可用令牌，留空使用默认格式。右侧输入框中显示格式为“assets/${noteFileName}/${generatedAttachmentFileName}”。该图片与上下文紧密相关，是对上文提到的“设置全部文件和图片位置需要设置”及“URL格式不习惯标准markdown文档格式，需设置”的具体操作展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzlhNWEzZjI2NzVlOWZiZmE2OTBkYzEwZGQ0OWFhNDlfZDM0MzVkZmFiOGRkYWM4ZWE3YWJjNmYzMGQ5NTM2YjFfSUQ6NzY0NDk4MTIwOTY2NzM3NDI3M18xNzgyMTA3MzA0OjE3ODIxMTA5MDRfVjM)

![图片展示了Obsidian的外观设置界面。左侧为功能导航栏，选中“外观”。右侧设置区域中，基础颜色可跟随系统，主题色为紫色；主题部分显示已安装主题为AnuPpuccin，有“管理”按钮，还可点击“检查更新”。该图片与上下文紧密相关，上下文提到安装了“Custom Attachment Location”插件，此图展示了在Obsidian中进行外观设置的操作界面，是插件配置中外观设置的呈现。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGNlMjc1N2ZkYWMxMWFiYmRiM2Y5OTcxMzU0ODczOTdfNGRlNzFmOGRlMjQ0NjM4ZGY0ZmU1ZWY0MTBmZDk2OGZfSUQ6NzY0NDk4MTE4ODQ4MTg2Mjg1OV8xNzgyMTA3MzA0OjE3ODIxMTA5MDRfVjM)

> 这里需要简单设置一下安放图片的位置，设置全部文件和图片位置需要设置。URL其实也不习惯不是标准的markdown文档的格式，所以需要设置一下。

### Dataview

用类 SQL 语法查询笔记内容，适合做内容索引。我主要拿它追踪文章状态——哪些草稿还没发、哪些选题已经有文章对应——写一条查询语句就能汇总，不用手动翻文件夹。

### Enhancing Export

支持导出 PDF、HTML、ePub、Markdown 多种格式。偶尔要给人发一份格式整齐的文档，用这个比直接复制粘贴省事。

### Git

自动定时备份到 GitHub。版本控制这件事我以前全靠手动，某次误删了半篇稿子才意识到有多危险。装上之后基本不用管，按设定的时间间隔自动 commit，在哪台机器上都能拉到最新版本。

![图片展示了Git操作界面，左侧为.gitignore文件，右侧是对比窗口。左侧文件中列出了My-VPS/我的VPS/.obsidian/workspace.json和My-VPS/我的VPS/.obsidian/workspace-mobile.json两个文件。右侧对比窗口显示这两个文件被添加到仓库。该图片与文档中介绍Git自动定时备份到GitHub的内容相关，直观呈现了Git操作中文件添加到仓库的场景。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmUwODlkYzM3MzFiZmM5MzMwODY0YjE3NjI3OTM2YTNfYmFkZjg2ZDIxMDU1ZTgzMzU3YmFkYjAwMDIxMTU1ZmJfSUQ6NzY0NDk4MTI2MDU4MTg2NjcwMF8xNzgyMTA3MzA0OjE3ODIxMTA5MDRfVjM)

![图片展示了Git插件的自动定时备份设置界面。界面中有“Split timers for automatic commit and sync”开关，用于启用一个间隔用于提交，另一个用于同步；“Auto commit-and-sync interval (minutes)”设置提交和同步间隔，当前为1分钟；“Auto commit-and-sync after stopping file edits”开关，开启后在停止文件编辑后每1分钟自动提交和同步，编辑文件时不会自动同步。这些设置与文档中介绍的自动定时备份到GitHub功能相关，可按需进行配置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Zjc2ZDliNTQ4YjU1MzU5MWNjMmJjZDIzN2NhZTJiNmNfNDBlZTY3ZDgxZTZjNzRkYjk2YjMwZjQ4NjkyNDUzMzBfSUQ6NzY0NDk4MTIzMzYxMjc3MDUyOF8xNzgyMTA3MzA0OjE3ODIxMTA5MDRfVjM)

> 这里有几个推荐设置，不是必须的编辑停止之后自动push，我这里设置了一分钟之后知道同步。还有就是设置两个json文件去掉，不需要同步到git因为经常修改容易冲突。

### Local Images Plus

检测笔记里所有外链图片，自动下载到本地并更新链接。**这个对从 Halo 迁移过来的文章特别重要**——导出的文章图片链接还指向服务器，服务器一旦停了图片就全挂，用这个插件一键本地化可以彻底解决问题。

### Templater

预设文章模板，新建文件自动套用。我的模板里带 Front Matter，包含文章状态、发布日期、分类等字段，配合 Dataview 查询能直接看到哪些文章的状态是"草稿"或"待发布"。

---

## 迁移途中踩的几个坑

### Halo 导出的是 HTML，不是 Markdown

当时以为官方「文章导入导出」插件能直接导出 Markdown，结果打开一看全是 HTML。原因是 Halo 2.x 默认编辑器存储格式就是 HTML，导出自然也是 HTML。

解决方式：用 Python 的 `markdownify` 库批量转换。写一个脚本扔进文件夹跑一遍，几十篇文章几分钟搞定。

### HTML 转 Markdown 格式混乱

一开始用 Pandoc 转换，结果富文本 HTML 转出来格式一团糟，标题层级乱、列表嵌套出问题。后来换成 `markdownify` + `BeautifulSoup` 组合，效果稳定很多，基本不需要再手动修正格式。

### 图片链接失效

从 Halo 导出的文章，图片 URL 还是指向原服务器的。迁移完之后如果不处理，服务器一停图片就全挂。

用 Local Images Plus 扫一遍，插件会自动把外链图片下载到本地，并把 Markdown 里的链接替换成本地路径，一步到位。

---

## 我现在的工作流

### Halo → Obsidian

```
导出 HTML → markdownify 批量转换 → 导入 Obsidian Vault → Local Images Plus 本地化图片
```

### Obsidian + Claude Code 创作流

```
分析已有文章风格 → 生成选题灵感 → 确认选题 → 生成大纲 → 确认结构 → 生成文章 → 导回 Halo 发布
```

选题和风格分析这两步现在基本交给 Claude Code 来跑，它能读完整个 vault 里的历史文章，总结出我的写作语气和高频话题，然后按这个风格出新文章。比自己一篇一篇翻快多了。

> 如果对这方面感兴趣，我后面也出一篇相关的内容，怎么使用Obsidian结合Claude Code打造自己的创作流程。

---

## 总结

这套配置没什么特别复杂的地方，核心就两件事：

- **插件组合把「文件管理乱」「备份靠手动」「图片会失效」这三个痛点全堵上了**
- **迁移的坑主要在 HTML 转 Markdown 这一步**，用对工具基本没什么大问题

如果你也在用 Halo 写博客、想迁移到 Obsidian 管理，按这个流程来应该能少走不少弯路。其实这篇最主要还是介绍Obsidian的一些插件和设置，给后续AI对接工作流打下基础。

如果感兴趣，我也会写一篇怎么打造自己的文章创作流程，让自己的内容更完整。

---

## 延伸阅读

- [Claudian 安装教程：把 Claude Code 接进 Obsidian](https://lcnniolukk80.feishu.cn/wiki/F17rwrrLHiYt0OkEnGucptI5nBf) — Obsidian 接入 AI
- [别让 AI 写得像 AI：83 篇博客训练专属写作助手](https://lcnniolukk80.feishu.cn/wiki/L3rhw5d1AigmZAkD2HPcA4EFnic) — Obsidian 写作 + AI Skill 实践
- [GitHub 狂揽 10.7k Star！这款飞书神器配合 AI Agent](https://lcnniolukk80.feishu.cn/wiki/S4Y0wf95qi0rW1k8ylAcVgAdnzb) — 飞书与 Obsidian 协同思路

---

> 来源：飞书 · AI Spark AI Wiki ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/Jv5jwEFN0iKCZ6kmHp3czzVInpb> ｜ 归档：2026-06-22
