# 从Markdown到上线:Obsidian +Claude Code +VitePress+Github+Cloudflare+ Spaceship零成本自动化建站全攻略

​

![图片为一张宣传图，背景为黑白放射状线条。上方文字为“小白零成本入门”，中间大字部分是“迎接GEO时代：自动化部署个人网站”，最下方是“保姆级教程”，其中“保姆级教程”为蓝色字体。该图片位于文档开头部分，与文档中介绍从Markdown到上线的自动化建站全攻略的上下文相呼应，起到吸引读者、介绍教程主题的作用。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTc4NjcwOTc4NGM3NDcxYWVlNWNiMzdiNjZiYjU0YjVfYmE1NmMzY2FkMDQ2ZGM3MmM5MDkxNzg1YzYwM2M2YjFfSUQ6NzY0NjMwNTAxNzk1OTQzNTIyNF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

这是一篇完整的从零开始搭建，到最终自己的网站上线的全部过程。不需要写任何什么代码，后期只需要写markdown文档，提交文档便会自动化触发部署网站。

站在2026年的视角，AI时代，我们还有必要创建我们的个人门户网站吗？我们还有必要自己写点东西留存在互联网上吗？未来互联网会死吗？

况且现在不论什么问题，我都愿意先问问AI了，看看它能给我什么答案? 我相信已经有很多很多人跟我一样了。那么你有没有想过一个问题: AI给我们的这些高质量答案，又是从哪里来的呢?

答案其实就是: 来自AI“能看见”的地方。

同时最近的315GEO数据投毒事件，某网上爆火，关注AI几乎所有人都能看到这个话题的内容。那么这里我顺便简单说一下GEO。

GEO（Generative Engine Optimization，也叫生成式引擎优化）是一种针对AI搜索引擎内容的优化策略。核心目标不是让你的网页排名靠前，而是让AI在回答用户问题时，**直接引用你的内容、提及你的品牌。**

那我们应该怎么做呢？我可以在微信公众号、短视频、小红书、抖音、头条、知乎等等平台来构建自己的内容和品牌。而且完全可以做到全平台批量构建。 但是这些平台都有一个重大的弊端，我的内容或者我的账号，会在某个特定的早晨，因为一些各种各样的问题而意外面临某篇文章或视频的下架，甚至某个账号的永久封禁，从而导致我很多的内容资产消失。

所以当下我觉得AI时代，我的个人网站又必须排上日程了。它不再仅仅是给我记录笔记也好，构建内容和品牌也罢，学习当前最流行的AI前线技术也行。而更重要的一点，就是上面提及的让AI能更好的发现我。

我们的网站可能被某某云下架，但是我们的内容在本地，在云端、在github，通过简单整改后仍然可以再次上线，甚至部署在别人无法触手可及的地方，只要不违背大的原因，他甚至可以永远存在。

而针对我们的网站，我们可以给它架设robots.txt确保AI能爬取到我们的内容，也给网站部署上llms.txt，告诉AI我是谁，我的网站干什么的，有什么内容，内容列表又是哪些。

有关SEO和GEO的更多内容可以参考这篇文章

<cite doc-id="BdgMwkUxTiByCWkPEhlcwfaWnEc" file-type="wiki" title="分享一份最近学习GEO期间整理的教程文档（如何让AI搜索主动引用你）" type="doc"></cite>

自媒体，现在流行的OPC，甚至越来越多的人，可能都在构建自己的个人独立网站，以前更多的程序员们的玩具。

说了那么多没用的，下面开始建造属于自己的避风港。

## 1、网站整体搭建流程

我先说一下我这套方案整体的一个工作流程是怎么样的

![图片展示了“第二大脑”构建与发布流程。左侧为本地Obsidian客户端，用Markdown编写文章，按VitePress规范目录。中间是Claude Code对内容整理加工，可拆给多个Skills/SubAgent/Agent Teams。右侧是加工好的Markdown保存本地仓库，图床方案提交改动到GitHub，Cloudflare Git集成自动触发，Cloudflare Pages自动构建与发布，最后绑定域名，页面对外访问。该图直观呈现了从编写到发布的一系列操作步骤。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTUxNzM5NmJhNmRmODdmZWZiOWIzNTcxY2ZkODA5NzhfYThhNWI5NDZkMWFlY2E2MTJlMjkyYjIwY2Q0YzhjMGFfSUQ6NzY0NjMwNTA0MjA3NzE1ODM0OF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

- 我在本地使用 **Obsidian客户端** 管理我的个人知识库，作为我的第二大脑
- 目前所有知识库的文章都用 **Markdown** 编写
- Markdown 的目录结构按 **VitePress** 规范来组织，其实也就是文件夹而已
- 平常使用 **Claude Code** 对内容做整理加工
- Claude Code 的处理过程可以拆给多个 **Skills / SubAgent/ Agent Teams**
- 加工好的 Markdown 文件保存本地仓库，图床下面我会提供最简方案
- 把改动提交到 **GitHub**
- 提交完毕自动触发 Cloudflare 的 Git 集成流程，**Cloudflare Pages** 自动构建并发布
- 绑定域名后，页面即可对外访问

下面正式开始，注意从零搭建到最后可以一分钱都不花的，域名可买可不买

## 2、搭建本地环境

前置条件其实就是安装nodejs、git、Obdisian客户端，如果没有的话可以让AI帮忙安装一下也可以自己手动进行下载，如果你本地没有AI工具，可以先下载使用Codex或者OpenCode，这两个客户端工具不需要其他依赖安装就可以使用，还是非常方便的，然后再来安装其他搭建所需的工具就可以了。 版本最好都安装最新的。

**“帮我看看nodejs,git,obdisia客户端是否安装了，如果没安装帮我安装一下”**

![图片展示的是Claude Code对“帮我看看nodejs,git,obsidian客户端是否安装了，如果没安装帮我安装一下”这一指令的回复。内容显示已检查nodejs、git和Obsidian客户端在这台机器上的安装状态，均已安装，版本分别为v24.12.0、2.23.0和1.12.4，客户端路径为/Applications/Obsidian.app。该图片与上文“帮我看看nodejs,git,obsidian客户端是否安装了，如果没安装帮我安装一下”的指令对应，直观呈现了指令执行结果，表明相关工具已安装，为后续搭建本地环境及安装vitepress准备项目代码等操作做准备。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWNiZmIxNWZhNzEwM2Q2YmIyODEyZDAyYWViYzc5NWRfNzYxYTNkY2JkMTNmODZiZDM5MjU4ZWJhMmFkMDlkY2JfSUQ6NzY0NjMwNTA2MjYzNDAxNTcwMF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

箭头所示中间过程我已经省略了，这里默认工具都已经安装好了，如果你没有安装，可自行搜索进行逐一安装。

## 3、安装vitepress准备项目代码

搭建项目前，先来简单看看VitePress用来干什么的。

它主要就是用来**把 Markdown 文档变成一个可访问的网站**的。所以我们完全可以不关注VitePress，我们只需要关注目录和Markdown文档就可以了，就跟直接在Obsidian 客户端下面打开一个文件夹一样，so easy!

同时他也有很方便的拓展性，这个简单提一嘴，后期有需要专门写一篇。

当然了其实还有很多其他类似的框架，我就不列举了，有兴趣可以多问问AI。

**“在当前文件夹下给我使用vitepress给我创建一个代码仓库”**

![图片展示了Claude Code在当前文件夹下使用vitepress创建代码仓库的对话结果。上方红框内显示指令“在当前文件夹下给我使用vitepress给我创建一个代码仓库”。下方内容说明已在当前目录创建了可用的VitePress Git仓库，完成初始提交，包括初始化Git仓库、创建VitePress基础结构、安装依赖等关键步骤，还提供了运行项目指令。该图片与上下文紧密相关，直观呈现了使用Claude Code创建代码仓库的操作结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjgwYWYwNDg5ZjI2ZThmOGYyNThmODBkZGM2MWQ5YmZfNTcyNjIzYjQwMmM1MzUzZGQ5NGQ4NWU2OGI0YjJmODhfSUQ6NzY0NjMwNTA4NzU2ODEzNzE0N18xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

依赖安装完毕，可以叫他本地直接跑项目看效果了。

**"你直接给我启动运行本项目"**

![图片展示了在Mac系统中使用Claude Code启动VitePress项目并运行的界面。画面中突出显示了“你直接给我启动运行本项目”这一指令。下方内容显示项目已启动，VitePress开发服务正在运行，访问地址为http://127.0.0.1:5173/ 。该图片与上文“在当前文件夹下给我使用vitepress给我创建一个代码仓库”及“依赖安装完毕，可以叫他本地直接跑项目看效果了”等内容相呼应，直观呈现了项目启动及运行后的访问地址，帮助用户确认项目是否成功运行。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NGRlMTgyNjE5Zjk3NTkxYzQ3YTMyNmZkOGZkMTk5MGRfYTk2MTc3ZjI5Nzg4Y2E1NmJjNzE3ODlhODU5N2M1NTZfSUQ6NzY0NjMwNTEwNDk1NDMzMDA3MV8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

看到访问地址基本就OK了，浏览器输入访问看效果。

![图片展示的是VitePress Obdisian项目页面。页面上方显示“VitePress Obdisian 一个开箱可用的VitePress项目”，并说明当前目录已初始化为VitePress文档站点。下方有“开始写文档”“VitePress指南”按钮，以及“立即可用”“中文默认配置”“结构清晰”三个板块，分别介绍项目已配置开发、构建和预览脚本，站点语言、标题和基础主题配置已完成，使用标准的docs目录组织内容，后续扩展简单。该图片与上文“在当前文件夹下给我使用vitepress给我创建一个代码仓库”及“看到访问地址基本就OK了，浏览器输入访问看效果”等内容相关，展示了项目创建成功后的页面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjdlZWI2MjVhMzNmZjhiYWVmNWU0MDYwNzI0MjdhMzZfMTE4YWU5YzlmMjI4NWUwMzc0MTEwMWIxNGU2YTQ2OGNfSUQ6NzY0NjMwNTEyOTIwNTMwNDI0OF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

## 4、将代码上传github

我相信看到这里的人绝大部分人应该都知道它是全球最大的开源项目大本营。现在有太多跟AI相干的开源项目，都放在了这个github网站上。它不仅仅能放项目代码，而且文档、少量图片、教程等都可以，付费用户当然功能更多，咱就不展开了，知道能放代码，知道能跟Git结合使用管理代码的版本历史，暂时就够了。

**"将项目上传到github"**

![图片展示了终端命令执行结果。先执行`git status --short --branch`，显示仓库未初始化；再执行`git remote -v`，提示没有git仓库；接着执行`gh auth status`，显示`gh`命令未找到；最后执行`git config user.name && git config user.email`，显示用户名为`aehyok`，邮箱为`455043818@qq.com`。该图片与文档中“将项目上传到github”部分相关，用于说明在GitHub远程推送前，需先检查仓库状态、Git配置等信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmI5NDM0MTNmODM5MTkyMGI3MWJkNTk4OWUxZTM3ZTJfNDY1ZGY4YjZjNTUwMGQ3M2U4M2NiMDc2MTA4MDYyYmRfSUQ6NzY0NjMwNTE1MDM4Njg4MzUzM18xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

上面图里告诉我还差github项目仓库信息，那么现在就需要到github官网上创建一个项目。

[https://github.com/new](https://github.com/new) 浏览器打开这个链接，直接创建项目

![图片展示的是GitHub官网创建项目页面。页面上方显示“aehyok - vitespress-obsidian”，下方有项目名称“vitespress-obsidian is private”及描述“个人知识库一键打造为个人网站”。页面中部有“Choose visibility”下拉框，当前选中“Public”（开源）。下方还有“Start with a template”“Add README”“Add .gitignore”“Add license”等选项，底部有“Create repository”绿色按钮。图片与上文提到的在GitHub官网创建项目相关，直观呈现了创建项目时的界面及关键设置选项。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDc5M2I3NjRmYzk0NWI1NTRjYzRhOTQ5MTZmM2IxZGRfZWU5NmUyZThjZjg2ZjI3YTYwMGUwMTRiOWFlM2QxM2JfSUQ6NzY0NjMwNTE3NTMyOTc3MDQyN18xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

上面链接要先进行登录这里就不进行重点讲解了，主要就是箭头两个重点

- 仓库名称，尽量用英文字母
- choose visibility，我选择的public，意思就是开源，所有人都可以看到，另外一个private就是私有的，只有自己能看到。
- 剩下的你可以直接默认，也可以参考我的进行选择，然后点击右下角 Create repository。
- 仓库创建完毕就会直接跳转到当前仓库。

![图片展示了GitHub上vitepress-obsidian仓库的页面。页面左侧显示仓库文件列表，右侧有仓库介绍、About等内容。关键信息是页面中部“Code”区域，有“Local”“HTTPS”“SSH”“GitHub CLI”等选项，其中“SSH”选项被红色箭头指向，其下方显示git@github.com:aehyok/vitepress-obsidian.git的SSH链接。该图片与上下文紧密相关，用于说明在将本地代码上传到GitHub时，应复制SSH链接以继续与AI聊天。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGM1ODgwNDUxMjdkYjFkZmQ0NjI2MmI0OTM1NTM3NjhfYzQ3M2FjZDFhODE2YzZlYjU5ZjIzNjQxZWYxOWViNDFfSUQ6NzY0NjMwNTE5NDE0MTU1MTU0NF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

如上图箭头所示 复制SSH链接， 继续跟AI聊天。

“ git@github.com:aehyok/vitepress-obsidian.git 这是我新创建的仓库，创建类型为public，请将当前仓库代码上传github”

![图片展示的是在终端中上传代码到GitHub的相关操作及结果。先是 addCriterion图片中显示了终端命令“git push -u origin main”的执行过程，包括向“github.com:aehyok/vitepress-obsidian.git”推送代码，分支“main’ set up to track remote branch ‘main’ from ‘origin’，以及git status --short --branch的输出结果。最后说明当前仓库已成功推送到GitHub，本地分支状态是main...origin/main，已建立上游源库，可最新推送提交是335c712，可直接在GitHub查看仓库内容。该图片与文档中将代码上传至GitHub的操作步骤相关，是上传操作后的结果展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGY3ODI3YmM1YzBiYzU0ZWNmNDBmYjI2OTU5NjAzMTNfYTA5YzBkYTJiNjgzOWJkY2UwMGMwZGYxYmVmZDRiZWFfSUQ6NzY0NjMwNTIxNzIyODk1MDQ5NF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

好了，我们已经将本地代码上传到Github上了。

## 5、cloudflare上部署我们的项目代码

cloudfare上功能实在太多，而在中文圈被誉为互联网的赛博菩萨大善人。提供了众多免费的功能。 尤其是部署个小站点，完全免费。接下来跟着我操作一下。

[https://cloudflare.com](https://cloudflare.com/) 打开网站，如果没有账号就进行注册登录，登录之后右上角语言切换简体中文，设置完毕首页如下所示。

![图片展示的是Cloudflare网站页面。左侧为导航栏，有“首页”“网站”“最近访问”等选项。右侧显示“@gmail.com's Account”账户信息，下方有“将用于Cloudflare保护的网站的API密钥”“Workers和Pages”“零信任安全”等板块。底部“Next steps”部分有“统一登录来提高安全性能”“最常用功能的快速入门”“获取教程，找出常用功能”等选项。该图片与文档中Cloudflare上部署项目代码的操作流程相关，展示了登录后页面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTI3NTJmOTI4Y2JjNmU2MTBhNjBkNWNmMzcyNjc3MzJfYTVkNzdlNmNkYzFmNzJjNzRhYzhjODMyN2M0Y2U5ZjNfSUQ6NzY0NjMwNTIzNjU4MDEwOTI3MV8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

点击开始\\[构建\\]，进入页面会看到下面 \\[pages\\] 点击 \\[开始使用\\]

![图片展示的是Cloudflare网站上“创建Worker”页面，用于选择部署方式。页面中有多个选项，如“Continue with GitHub”“Connect GitLab”“从Hello World!开始”“选择模板”“Upload your static files”等。页面底部有一个红色箭头指向的“想要部署Pages？开始使用”按钮。该图片与上文“cloudflare上部署我们的项目代码”内容相关，对应“进入页面会看到下面\[pages\]点击\[开始使用\]”的步骤，指引用户点击此按钮开始部署Pages。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTkxMjVhODk0NWQ0ZTJiYzQ2MDQ3MDJiMjU2ZDA4OWJfOTE0ZGIwNWU1ZTRkNTdlMWVjNjM1Mzk4YmMyZjhmYTlfSUQ6NzY0NjMwNTI1OTI3NzA0NDY4NV8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

进入页面后点击 导入现有Git存储库 开始使用，如果没关联过需要登录github进行授权的

选择 Only select repositories-> Select repositories=-> 文本框输入 obsidian-> 选中代码仓库->点击绿色的 Save->稍等片刻会返回到cloudflare网站。也就是关闭弹窗。

回到cloudflare网站，选择好刚刚设置的仓库，点击右下角开始设置就可以了。

![图片展示 addCriterion图片展示了在Cloudflare上部署项目代码时的设置界面。上方提示选择作为项目源代码进行连接的存储库，新提交将使Cloudflare自动构建和部署更改。界面中有GitHub和GitLab选项，当前选中 addCriterion图片展示了在Cloudflare上部署项目代码时的设置界面。上方提示选择作为项目源代码进行连接的存储库，新提交将使Cloudflare自动构建和部署更改。界面中有GitHub和GitLab选项，当前选中GitHub，下方显示GitHub账户为“sethyck”，并有“添加账户”按钮。还提示选择一个存储库，当前选中“vitepress - obsidian”，并有“开始设置”按钮。该图片与上下文紧密相关，是进行Cloudflare上部署项目代码操作的设置步骤展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzI5Zjk5Y2FjNTRjM2UwNGQ3MzFmZWQwZDAzODBlNzdfNjdmN2VmZTIzZjA0OGJjNjRhNTQzZDc1NDE3ZDlkZThfSUQ6NzY0NjMwNTI3Nzg1MTQzODAzMF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

点击下一步 框架预设：选择VitePress 构建命令： npm vitepress build 构建输出目录：docs/.vitepress/dist

![图片展示了在Cloudflare上部署VitePress项目的相关设置界面。其中，框架预设选择了VitePress，构建命令为“npm vitepress build”，构建输出目录为“/vitepress/dist”。在“域名”字段中，输入了“doc”。该图片与上文提到的在Cloudflare网站选择仓库并设置构建命令等内容相呼应，是部署VitePress项目时的具体操作步骤展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTQ3YzUyMzAzMWNlYWI1ZTVmNTZjZDA5ODM3MDZhYTBfZTJlNzU2MzZkNDRkODllYzM1MzE1MjM3MzgwZTQxOWFfSUQ6NzY0NjMwNTI5NzEyOTAxNjI2N18xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

点击保存并部署后，即可看到一个cloudflare送给我们的默认域名。

好了，兄弟们，网站有了。直接进行点击，cloudflare给我们的免费域名

![图片展示的是一个VitePress Obdision项目首页。页面背景为黑色，上方显示网址“vitepress-obsidian.pages.dev”。中间大标题为“VitePress Obdision 一个开箱可用的 VitePress 项目”，下方说明“当前目录已经初始化为 VitePress 文档站点”。底部有两个蓝色按钮，分别为“开始写文档”和“VitePress 指南”。右上角有“首页”和“...”选项。该图片与文档中“更新网站内容”部分相关，用于展示更新代码后部署成功的网页界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTQ2OTY2MGIzZTk5NzAzZjRiOTZiNGI5YmM3MWYzZjBfMjYzNzM1MGZiMWVlYWUyNDhkYmM4MjU0ZWU4NzljMDJfSUQ6NzY0NjMwNTMxNzU0NjU0NDA5MF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

## 6、更新网站内容

直接用下面的提示词修改首页的title。

![图片展示了在Cloudflare上部署项目代码后，更新网站内容的操作步骤。画面中显示了在Cloudflare的提示词中修改首页title的操作，将文件中的title修改为“前端哥社群”。下方有Claude Code的代码编辑界面，显示了对docs/.vitepress/config.mts文件的修改，将title从“VitePress Obdision”改为“前端哥社群”，并有代码修改前后对比。该图片与文档中更新网站内容的上下文对应，直观呈现了修改操作。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NGE5OWExNjdiMmM1YjQ2NjZjOTE5Y2M4NDk3ZWE3MjZfYWRiNTMwYTBjNTI4N2ZmZGMzOTc2NGE1NDYyNDMwOTdfSUQ6NzY0NjMwNTMzNjI3MTkxNTk3Ml8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

更新完毕后，直接提交代码

![图片展示了在终端中提交代码到GitHub的相关操作及结果。上方红框突出显示“提交代码到GitHub”，下方红框呈现代码提交信息，显示提交信息为“chore: update site title”，提交哈希是74ba164，当前main已成功推送到origin/main。该图片与文档中“更新网站内容”部分相关，说明在更新首页title后，需提交代码到GitHub，此图直观呈现了提交代码到GitHub的操作结果，是零成本自动化建站流程中提交代码步骤的可视化呈现。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDFkZGVjZGQ4YTNlNGQ1MWFkM2QwYzQzZTQ1NjlkZjBfNzM3NDM2ZWI1MTA3ODM2NTE3ZGY3NGNjMzMzMTMwOWVfSUQ6NzY0NjMwNTM2MDIzNjMwMTI3NF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

稍等片刻，或者你也可以在cloudflare中查看部署是否完毕

![图片展示的是Cloudflare后台的Workers和Pages界面。左侧导航栏中“Workers和Pages”选项被红色箭头指向。右侧界面显示“image_id>项目下的“update site title”节小时数为11，下方有“1”等信息。右侧还呈现了使用情况，如CPU使用率为0，请求次数为0，服务器数为1等。该图片与文档中“更新网站内容”部分相关，用于说明在Cloudflare中查看部署状态的操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmE5NDU2MTYwZjFmYzQzODE5M2UzNjdiMjNhYjI3NTVfMWNlZWQzZTBiYWRjNzA1NjQ4Mjk3ZTc4MTA0NzI1MTdfSUQ6NzY0NjMwNTM4MTUxODUxMTA3NF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

随后刷新浏览器查看我们部署的网页

![图片展示了VitePress Obdision项目首页。标题为“VitePress Obdision 一个开箱可用的VitePress项目”，下方说明“当前目录已经初始化为VitePress文档站点”。页面有“开始写文档”和“VitePress指南”两个蓝色按钮。右上角有“首页”和“...”选项，左侧有“前端哥社群”标识。该图片与文档中“更新网站内容”部分相关，展示了更新首页title后，刷新浏览器查看部署的网页效果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=M2I3NzQwZDRjZWZhOTQyNTBkZmEwNGZkZWU4NTEwYjJfMmQ2YmZmZjg2MDE2ZWQzYWM2YmM4NWQ5YjhmZTQ0MzFfSUQ6NzY0NjMwNTQwMzY3MjA4NzUwMV8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

左上角的标题更新成功了，以后相当于只更新markdown文档，然后提交代码网站就自动更新。真的太方便了。

## 7 、spaceship购买域名

[https://www.spaceship.com](https://www.spaceship.com/) 此域名下注册登录后直接输入想要的域名

![图片展示的是spaceship购买域名的结算页面。上方显示已选1个域名，名称为“aehyok.best”，原价$15.58，现价$1.48，续费价格$15.58。下方有“Add promo code”添加优惠码选项，ICANN费用为+$0.20，总计$15.78，显示为$1.68。底部有“Checkout”结账按钮和“Customize in cart”在购物车中定制选项。该图片与文档中购买域名步骤相关，展示了购买流程中的结算环节。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDlkODlmMzQyMTEyY2RkOWE0YzI1YjI4N2RkNjAwMTNfNWE5ZjdkYTY1NWNmMjI0ZjU1ZjM0ZjdhNjYxNWI0ZjJfSUQ6NzY0NjMwNTQyMzQ4MjgwMTA4M18xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)



这里面我使用的VISA卡购买了一年的。看里面选项可以支持支付宝，不过我没尝试,大概十元钱多一点。

![图片展示图片展示了spaceship购买域名后的页面。左侧显示感谢购买spaceship，用户将收到购买确认邮件，下方列出已注册1 addCriterion图片内容](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDM2ZGJkMWVlODMyYzFiZGRhNjUzZWI1NTQxNWU3ZWZfYmE1ZDY1YzIxMzAzOGU4YmI4ZWQ3M2ZlMTNhNWZiZmRfSUQ6NzY0NjMwNTQ0NDkyMzAxODIwNl8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

## 8、绑定域名

先在[cloudflare.com](https://cloudflare.com/) 首页，点击左侧菜单\\[帐户主页\\]，然后右上\\[添加\\]=>再点击\\[连接域\\]，输入上面购买的域名，点击\\[继续\\].

![图片展示的是spaceship平台购买域名的页面。页面上方提示连接域名，开始通过Cloudflare发送Web流量。中间有“输入现有域或注册新域”区域，输入框内显示域名“aehyok.best”。下方有三种DNS记录选择方式，当前选中“快速扫描DNS记录”。底部有控制AI爬网程序访问站点的选项，当前选中“已在所有页面上阻止”。最下方有“继续”按钮。该图片与文档中“spaceship购买域名”部分内容对应，是购买域名操作步骤中的一个环节。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjdkMDI4NGYyZDJmZmNhYTdmNWMwMzZiYTdlOTY4ZWZfODFiNzg1ZmQ3ZjBkNzIzNzI1MWI2NjAyYjA5ZjhjODZfSUQ6NzY0NjMwNTQ2NDcxOTg1NDU0Ml8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

选择完最左侧的Free计划即可看到域名解析了，然后你可以直接访问域名了

然后再回到spaceship 右上角点击切换中文。

会在右上角看到\\[库\\]->点击后再到\\[my account\\]->看到域名管理器->点击行记录右侧会弹出面板->再点击namespace+dns->在点击Change->**Custom nameservers->输入上面cloudflare 下有两个dns 品牌服务器，等个十分钟上面DNS解析的类型A前面叹号可能就没了，说明配置成功了。**

![图片展示的是Cloudflare域名管理器界面](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODIwMWUwMWQ1NThiNTZiOGE2ZDZkOGQ3MjA3MDUyMTVfZjJlMzlkNjVjMTBkYWE5NzY2OTMwNTU2M2FmNjU5MGJfSUQ6NzY0NjMwNTQ4OTA4NTA0MTYxM18xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

再根据下图操作

![图片展示了Spaceship平台中“Workers and Pages”下的“自定义域”设置界面。左侧导航栏中“Workers and Pages”被红框圈出。右侧界面中“自定义域”选项被红框圈出，下方提示为站点添加自定义域。关键操作步骤为点击“设置自定义域”，输入申请的域名，再点击“继续”和“激活域”。该图片与文档中spaceship购买域名的操作步骤相关，是设置自定义域操作的指引图。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmRjNTY2NmFlNTFhY2M0MjliYTQ3N2VlZTcwZTQ1NTFfMmJlYzk3ZjBmOGUxNTY3OTc0ZGEwYzllYTVkOTg2YzRfSUQ6NzY0NjMwNTUwOTMwMTk4MDEzMl8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

点击设置自定义域，输入我们申请的域名，点击继续，再点击激活域。

![图片展示的是Cloudflare域名管理界面，用于设置自定义域。界面中显示现有记录的A类型记录，内容为54.149.79.189和34.216.117.25，以及新记录的CNAME类型记录，内容为vitepress - obsidian.pages.dev。下方提示更新后，访问者可通过https://aehyok.best访问站点。该图与文档中spaceship购买域名后配置域名解析的操作步骤相关，是配置成功后的界面展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWU5Y2E5OGM2M2FlNTFmZDIxNTc5ZjFlYTE0YWIwZWJfYjlhY2Y1YWM0ODA1NmY3NDE1NDhjMWEyNDZmYzZhNWFfSUQ6NzY0NjMwNTUyOTY1NjY1ODkwM18xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

稍等片刻就可以针对我们上面部署的网站用自己的域名进行访问了。

![图片展示的是一个VitePress Obdisian项目页面，页面标题为“VitePress Obdisian 一个开箱可用的VitePress项目”，下方说明当前目录已初始化为VitePress文档站点。页面有“开始写文档”和“VitePress指南”两个按钮。页面左上角有浏览器地址栏，显示网址为“aehyok.best”。图片与上文提到的在spaceship购买域名后突出配置成功后可使用自定义域名访问网站的内容相关，展示了使用自定义域名后的网站访问效果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzNlM2NkNGViOWFlMjQ3OGM0NDg4NmM2ZjRlY2U3MDBfNDA4ZmVkNDFlNzk3ZGQ5MzJhYzkxMWUzYjdiOTc1Y2JfSUQ6NzY0NjMwNTU1NDQwNjkxOTEwOF8xNzgyMTA3MjQ3OjE3ODIxMTA4NDdfVjM)

## 最后

文章耗时两周，终于完工了，当然中间断断续续。将整个构建的过程进行了记录。由于推特对每篇文章上传图片限制了25张，我只好对上面的某些图片进行删减了。不过删减的图片就是效果图，可以忽略的。

后续我还会对使用过程中遇到的一些问题进行记录。欢迎有需要的点赞关注，跟踪后续更新。

如果有兴趣的也可以轻轻松松的将它接入小龙虾。

---

> 来源：飞书 · AI Spark AI Wiki ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/CEERwwjshiODs1kuTvcc5FkAnk3> ｜ 归档：2026-06-22
