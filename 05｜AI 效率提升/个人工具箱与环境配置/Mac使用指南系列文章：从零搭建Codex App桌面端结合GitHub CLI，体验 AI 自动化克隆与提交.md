# Mac使用指南系列文章：从零搭建Codex App桌面端结合GitHub CLI，体验 AI 自动化克隆与提交

​

![图片展示了新手小白Mac必装的相关内容，标题为“新手小白Mac必装：Codex App + GitHub CLI 打造AI辅助工作流”。左侧有机器人](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzRiZWIwYzEwNTgwZmYyM2RhNDJkZDBmNWUyNjBjNTBfZmUwM2VjOWE4MDNlYzFhYTFmMjA4NjkxMDVlYzJhOWNfSUQ6NzY0NjMwMzg1NTM2MTg4NzE3NF8xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

这是这个系列第二篇文章，我会把自己最近从零开始梳理，整理 Mac 使用过程中的经验与步骤记录下来，作为留存与分享。如果拿到一款新的Mac，我最先安装的AI工具就是Codex App了，因为它无需其他依赖直接下载安装即可使用。

它不仅操作简单，安装方便，更易于操作使用。

我的Mac使用指南系列文章：

> 4月10日

本文主要的内容如下目录

- 通过Homebrew安装Codex App
- 使用Codex App 安装GitHub Cli
- 准备克隆代码
- 修改仓库内容，并提交
- 最后，附新建仓库指引

## 1、通过Homebrew 安装Codex App

如果你还没有安装Homebrew可以看看我上面的系列文章的第一篇。

Codex App就是OpenAI 推出的AI Agent 桌面客户端，打开终端使用brew执行如下命令。

```Bash
## 先查找 codex-app有没有

brew search codex-app



## 查找完了 一般最好确认一下是不是openai的codex app

brew info codex-app



## 找到后安装

brew install codex-app


```

命令执行完毕之后，到App中查看Codex App 是否已经有了。安装成功如下图所示，点击打开即可。

![图片展示了在Mac系统中使用Homebrew安装Codex App的界面。左侧是终端命令行界面，显示了搜索和安装Codex App的相关操作，如“brew search codex”和“brew install codex-app”，并有安装进度和完成提示。右侧弹出窗口提示“Codex”是从互联网下载的App，询问是否确定要打开它，有“取消”和“打开”两个选项。该图片与文档中介绍在Mac系统上安装GitHub CLI并使用Codex App的内容相关，直观呈现了安装过程中的操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OGUwOTA4ZDQzMDUyOTgyYWUxZTY1MjQ1ZDdmNTAxYjlfZmExOTQ0YWFkNWY5Mzg3YzlkYmRkYzIyMTJjODg1MTNfSUQ6NzY0NjMwMzg3NjU5Mjk3ODg4Ml8xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

打开之后，点击继续使用ChatGPT登录，就会打开浏览器进行授权登录，登录完毕就可以跟AI进行对话了。

## 2、使用Codex App安装GitHub CLI

![图片展示的是GitHub仓库页面中“Code”选项卡下的代码克隆界面。界面中显示了“Local”和“Codespaces”选项，下方有“Clone”按钮，可选择“HTTPS”“SSH”“GitHub CLI”等方式克隆代码。其中，“GitHub CLI”选项被突出显示。此外，还有“gh repo clone aehyok/blog”命令输入框，以及“Work fast with our official CLI. Learn more”链接。该图片与上下文介绍的使用Codex App安装GitHub CLI后，可在GitHub仓库页面克隆代码的操作步骤相关，直观呈现了操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTA3NDgxYmU0YWJhYTJjMTczZTRkYTBhZTVkNWZiZTdfNTFjYjdmNzMwODY3YmUyZjQyY2IzMTMzMmI0MWQyNTZfSUQ6NzY0NjMwMzg5ODUyMTE5MzQ0Ml8xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

看上面截图发现自己的仓库，在克隆代码的地方多了一个标签。所以直接点击Learn more, 把链接交给了Codex App。

> 如果你没有建过Github仓库也没关系，我之前写过单独创建新仓库相关的文章，欢迎到文末查看。

![图片展示的是在Mac系统中查看GitHub CLI安装方法的界面。界面中显示了GitHub CLI安装的步骤，包括使用Homebrew安装，具体命令为`brew install gh`，以及安装后验证版本的命令`gh --version`。还提到若需登录GitHub，可执行`gh auth login`。界面底部有GPT - 5.4.4版本提示，以及本地、默认选项等设置。该图片与文档中介绍使用Codex App安装GitHub CLI的内容相关，直观呈现了安装步骤。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjEyNGRjNmRjZjEwNjEwMTVmZTk0NTNkMGQ5NTg2ODZfYjc5MDQ0YWRkZDI4NjgwN2ZjNmI3Mzk4YWQzYjlhMDNfSUQ6NzY0NjMwMzkxODExODczNDc4Nl8xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

**如果没有安装Homebrew,可以点击我上面的系列文章进行查看安装使用。**

安装Homebrew之后，继续根据上图来安装gh。

![图片展示的是Mac系统中Codex App安装GitHub CLI后的界面。界面显示“homebrew 安装好了 继续安装gh”，并告知gh已安装完成并验证可用，可执行文件路径为/opt/homebrew/bin/gh，版本为2.89.0，发布日期为2026 - 03 - 26。还提示可直接使用，如先登录，接着给出“gh auth login”命令。该图片与上文提到的安装Homebrew后继续安装gh的操作步骤相关，直观呈现了安装成功后的状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzAzNzk0ZjhiYjRiODEzNmM0OTNlNzhlYjQ3NWJiMjlfZDQyMTg2MzFiOTNmNTI2ODI0Yzg4Mjg4Mzc5ZWZiYTdfSUQ6NzY0NjMwMzkzOTIwNjQwMDk5M18xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

就会开始后台执行gh auth login，然后打开浏览器进行授权登录，比之前的SSH还是方便了很多。

![图片展示了Codex App中查看GitHub CLI安装方法的界面。界面显示用户已登录，当前状态包括GitHub账号、gh已认证并可用、Git协议为https等等信息。下方有可执行的命令示例，如gh repo view、gh repo clone等。右上角有“好的，继续”按钮。该图片与上文提到的安装Homebrew后根据上图安装gh，以及后台执行gh auth login并授权登录的内容相关，展示了安装后的状态及可操作命令。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDgwOTU5MzM2ODdlMTYyODJlZjIwZGQyODQxNDNiMWFfNTJhZTExNmI2MjY5N2RkNjk0N2M0Yjk4OTQxMjAxNmFfSUQ6NzY0NjMwMzk2MzIxNDQ4MjM5MV8xNzgyMTA3MzMwOjE3ODIxMTA5MzBfVjM)

## 3、准备克隆代码

首先需要找到一个本地路径，存放克隆仓库的代码。

然后从github上复制使用GitHub CLI标签下的命令行。

![图片展示了在Mac上使用GitHub CLI准备克隆代码的操作界面。界面中显示了当前路径为/Users/aehyok/Desktop/daily，有指令将路径切换到/Users/aehyok/Desktop/github。还显示了用于克隆仓库main分支的指令“gh repo clone aehyok/blog”。操作完成后提示仓库克隆完成，位置在/Users/aehyok/Desktop/github/blog ，并确认了当前分支是main等信息。此图片对应文档中“准备克隆代码”部分，直观呈现了克隆代码前的路径设置及克隆指令操作情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjllNmIxOTc3YmUyZmFkMzdkZDVjZTU1ZDcxNDg0MGRfOTRhYjU4N2NhNjQwMGNhYzk4YzlkYzllMmQ4MTgwMGFfSUQ6NzY0NjMwMzk4NDkyNDA4NTE3Nl8xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

## 4、修改仓库内容，并提交

![图片展示的是GitHub CLI在Mac系统中的界面。界面上方显示当前仓库有1处未提交修改，分支是main，相对origin/main没有提交差异，只有工作区改动，已修改文件为README.md。下方有“帮我看看仓库下有什么更改”按钮，以及“查看文件完整差异”和“直接提交”选项。该图片与文档中“到github看效果”部分对应，展示了使用GitHub CLI查看仓库更改后的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MWE3ZThkMmFjZGJmMDZjYWIwNjU5ZDhiNTk1ODkwZDlfYzg0YTQzYjJhNzhjNTdlYmE5YTRiYjA5OTljZmUzNTBfSUQ6NzY0NjMwNDAwNzUxODM0MjExOF8xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

我随便将README.md中的内容，删减了一点，然后跟他说提交内容。

![图片展示的是Codex App界面，显示“帮我提交代码并推送到github”指令已执行完成。内容包括提交信息为“chore: update README”，提交哈希为“14c0ba3”，推送结果为已推送到origin/main，当前仓库状态干净，本地main和远端origin/main已同步。下方有“要求后续变更”区域，可添加GPT版本、本地仓库等信息。该图与文档中“4、将代码上传github”部分对应，直观呈现了使用GitHub CLI上传代码并推送至GitHub后的反馈结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2QwNDBmZTQzMTg4MTM4MjI4MGY3ZTU3MmYxNzJiMGZfMTFjYzY2YWNkNWVkMTE5ZDIyNTJkNGM4MGVhMzAxMTRfSUQ6NzY0NjMwNDAyNjQxOTkyMzkzN18xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

到github看效果

![图片展示了GitHub仓库“blog”的页面。页面上方有Code、Issues等导航栏，右侧显示仓库信息，如创建者、星标数、关注者数等。左侧是仓库文件列表，包含main分支下的多个文件和文件夹，如AI、agent、data等，部分文件有更新时间标注。图片中红色箭头指向“AI”文件夹，该文件夹下有chore: update README等更新记录。此图与文档中“到github看效果”部分相关，用于展示在GitHub上查看仓库文件及更新记录的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTkwNzNlYzNmNWE2YmRlMTg4MTNlMjZiNzlkYjRkZWZfNjk1MmE2ZjAyODE3NmFjYjIzODJlMTJlYzZmZDUwZThfSUQ6NzY0NjMwNDA1MDE5OTM2NjU5OF8xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

## 5、最后

GitHub CLI 支持的功能还有非常多，可以结合本地的Agent 客户端体验很多功能。

![图片展示了在Mac系统中使用Codex App与GitHub CLI结合的界面。界面中显示了GitHub CLI的主要功能命令分类，包括gh auth、gh repo、gh pr、gh issue等，还列出了如发布版本、上传release资源、管理gists等具体功能。该图片与文档中介绍GitHub CLI支持功能的内容相关，直观呈现了其功能分类，帮助用户了解GitHub CLI在代码管理、仓库操作、拉取请求管理等方面的功能，为后续结合本地Agent客户端体验相关功能提供参考。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmY2NzRkNGIwYTlkYjY4NTYyYjJmY2MyOTBkYjA4MGNfYmQ3OTcxMWIzOGE1MWVmMTYwZjJiOTUyNTQ1ZDk1MWNfSUQ6NzY0NjMwNDA2OTY4ODExODIyMV8xNzgyMTA3MzMxOjE3ODIxMTA5MzFfVjM)

当然了，上面我是直接把原来有的仓库文件进行克隆本地，你也可以直接创建一个新的仓库，然后与本地文件直接进行关联上传提交，思路其实是一样的。

> 3月22日

这篇文章中的“**4、将代码上传github**”，演示的就是新建仓库并上传项目文件的过程，可以参考并结合上面的功能命令进行实测，也是一个不错的尝试。

---

> 来源：飞书 · AI Spark AI Wiki ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/QKCZwzUPBilOBzkdgoKckEITnme> ｜ 归档：2026-06-22
