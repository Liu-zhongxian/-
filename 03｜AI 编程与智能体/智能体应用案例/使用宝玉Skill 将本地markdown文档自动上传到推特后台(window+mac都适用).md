# 使用宝玉Skill 将本地markdown文档自动上传到推特后台(window+mac都适用)

​

![图片展示了宝玉的自动发推Skill流程，分为背景&痛点、准备工作、安装&配置、执行&发布四部分。背景&痛点中宝玉感叹推特编辑器难用，痛点是长文排版难。准备工作包括本地Markdown文档、软连接、安装npx skills add等。安装&配置有OpenCode、agents、skills等操作。执行&发布则有登录信息本地存储、浏览器授权登录、成功上传草稿箱等步骤。该图直观呈现了宝玉Skill的使用流程，与上下文介绍的自动将本地markdown文档上传到推特后台的功能相契合。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTYxODcwOTkxNDY1ZTQ3ODgyNjYxMzczYjIxMjU2NmRfNTA2M2NhYWRmMjk3NWJmMDlkMzQ3MWE5ZTNhNWQ5NDFfSUQ6NzY0NjMwNTkyMDU4NjU5OTM1Nl8xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

想看效果的可以直接到最后，我录了一个视频。

中推AI圈里应该没人不知道宝玉的。这个男人可以说为中国普及AI或者说带动了中国部分热爱AI的人群，让他们在没有多少时间的情况，宝玉通过在推特和微信的分享，让无数中国爱好者能及时了解到ChatGPT、Gemini、Claude、Grok等等国外AI圈发展的情况，立下了汗马功劳，在下也会经常翻阅宝玉的文章进行反复的揣摩。接下来我就会使用宝玉编写的skil来实现自动将本地markdown文件发送到推特上来。

最近我进了一个叫前端哥的社群，请记住这个社群免费，付费的我加不起。

有一次聊天的时候发现很多人对推特的编辑器吐槽尤为厉害，尤其是长文，真的是灾难，有人甚至说终于见到比微信公众号编辑器还难用的了。不过话说回来我1月份写过几篇推特长文，确实体会到了其中的痛苦，于是我看到了宝玉的自动发推Skill。

我的感觉是所有人都可以试试。其实不难当然这里面的知识点我暂时就不进行讲解了，如果有人感兴趣，可以评论告诉我，我后面可以单独开一篇。

比如markdown的基础用法，可能很多人用过，也有很多人没用过。你去看看其实我常用的也就几个。

我一般就是标题‘##’, 正文就不管了， 特别需要注意的 ">"。表格我一般直接用gemini 生成图片放进来。因为上传到推特后台后，表格的渲染是不会正确展示的，等等。

这里就不讲太多了，进入正题。也就是说要先准备一个包含图文的markdown文档，下面是我截图的markdown 文档预览。

![图片展示的是一个markdown文档预览界面。上方有“笔记属性”栏，显示标题为“测试自动发推到推特平台”，封面图片为“/Gemini_Generated_Image_9paxk69pax69pax.png”。中间部分为“引用”内容，开头是“你好啊，这是文章的开头”。下方“中间”部分有“创作”“构思”“呈现”三个图标及文字。最下方“最后”部分写着“哈哈 这篇文章就是测试的”。该图片与文档中介绍准备包含图文的markdown文档以使用宝玉Skill自动上传到推特后台的内容相关，展示了文档的预览样式。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Mzc0OGJhZTg4MDM0NDk4ZmM4ZjMxZmYzOTEzOWFkZTFfZjAxMjk1M2QwYzljYzNkMzZmOGU0NDIyMDdkZTRmMTJfSUQ6NzY0NjMwNTk0MjE3ODcyODkwMF8xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

里面的图片也是在本地文件夹中的。

![图片展示了在本地文件夹中生成的markdown文档及图片文件。其中，“index.md”是包含图文的markdown文档，“test.md”是测试用的markdown文档。红色箭头指向的“output.mp4”是生成的视频文件，下方有多个以“Pasted image”开头的图片文件，这些图片文件是文档中插入的图片。该图片与上文提到的准备包含图文的markdown文档相呼应，直观呈现了文档及图片文件的存储情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTkyZWU2YjBiNjViM2U4ZWEwOGQ5NjQ2MzMyYmI3MjZfZjMyYWE5YzdhMTUwM2FkZWUzNDBlZDhlMjkwN2JmMGVfSUQ6NzY0NjMwNTk2MTMxNzc2NDA0OV8xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

## 准备skill

如果你是mac的话，可以直接打开这个网站 [https://skills.sh/jimliu/baoyu-skills/baoyu-post-to-x](https://skills.sh/jimliu/baoyu-skills/baoyu-post-to-x) ，复制里面的命令行直接安装即可。

> 注意要在项目的根目录进行执行命令

```Plain Text
npx skills add https://github.com/jimliu/baoyu-skills --skill baoyu-post-to-x


```

宝玉的skill目前是不支持window的，所以我进行了变更 [https://github.com/aehyok/Skills](https://github.com/aehyok/Skills)

其中的 baoyu-post-to-x 文件夹就是自动将本地markdown文档发送到推特草稿箱的skills，你可以将这个文件夹复制到对应的skills下。

我现在是一个项目下的skill就统一放到下图 .agents文件夹目录下，因为使用 npx skills 命令时他都会装到这个目录下。

![图片展示了在“github > blog 自动生成](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjkwMDc1OWJhNjcxODQ4YzA2NDFhYjM1MWVhMjRkZmVfZjI4MGU2MjhjMmFlMDU2NzgyYTJhNmJjODVhODFiOTBfSUQ6NzY0NjMwNTk3OTYzNDcxNTU5N18xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

因为我平时使用OpenCode、Codex、google antigravity比较多，所以只需要进行设置软连接就可以了，维护的话只需要维护一份，就是我上图中.agents 目录，其他使用最终都会指向.agnets目录。

软连接是用来干嘛的呢？ 先打个比方，A文件夹和B文件夹。

> // window下 相当于访问A最终访问B，就不用在每个 .claude、 .opencode、codex、.agent等等文件夹在单独再拷贝一份Skill，而且维护的时候也方便 mklink /D A B // window下 使用codex的时候就会去访问.agnet mklink /D .codex .agents // mac下,写法刚好和window下相反,要像下面这样写， 访问A最终才会访问B ln -s B A // 其他类似了

![图片展示了在Windows系统下，使用cmd命令创建符号链接的操作界面。左侧是文件夹结构，显示了多个文件夹，其中“.agents”“.claude”“.codex”“.opencode”被红色箭头指向。右侧是cmd窗口，显示了在“H:\\github\\blog-vitepress”目录下，使用“mklink /D”命令为“.agents”“.claude”“.codex”“.opencode”创建符号链接的命令及结果。该图片与文档中介绍如何通过软连接管理项目skill的内容相关，直观呈现了创建符号链接的操作过程。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=M2Y4Y2ZhOGJkNTZkZWZjNDY2MjJiZWE2OTE0NzAyNTVfMjFlN2I4NGIxMmQ3ZTAwOGU1MjUxYjU4MTU0MTJhZDRfSUQ6NzY0NjMwNjAwMjYwMjU3Njg2MF8xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

第一个是google antigravity使用的agent skill目录

这里相当于也给你简单介绍了如何管理自己一个项目中的skill。

## 开干

现在相当于skill准备好了，也准备好了文章。下面我是在OpenCode中进行操作的

在OpenCode客户端使用@便可以找到我们要

![图片展示的是在OpenCode客户端中使用@技能操作的界面。界面中显示“@docs\\ai\\2026-02-07-post-x-skill\\test.md 将这篇文章自动发送到推特”，下方有“Build”“GPT-5.2”“Medium”选项，以及一个“上传”图标。该图片与文档中介绍使用宝玉Skill将本地markdown文档自动上传到推特后台的操作流程上下文相关，展示了在OpenCode中使用@技能进行相关操作的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODk1ZTA2MzE5ZTkyNmU2Mzc4NmNlNDJlYmFiMTAxNjhfMWVjMmM5MTllMWNjMTIzYTA3N2FmNjI2N2Y1NDU2YzhfSUQ6NzY0NjMwNjAyMzA5MTg5OTM0Ml8xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

执行之后会弹出浏览器进行登录授权

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODUwNmZmZDE5ZmY3YTFmNWE5YWMzODQ3MGM2YWQ2OTFfMDBkNzdlZjE0YjdhMWYxZjYzMDljYWY3YTUyYjE0NjFfSUQ6NzY0NjMwNjA0NjkyNzI3NzAyNV8xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

登录完，你关闭浏览器，你的登录信息就在本地进行存储了，一段时间之内就不需要进行再次登录了。

如果跳转到下面页面也没关系，你点击搜索进入登录就可以了。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTE0NDU0OTcyYWJlODEzODM1NGVhODg4NDY2YjViYTFfYjdlZDA4OTY5NzMxY2UxMWVkYjg0YTNjN2Y3OGJhMDZfSUQ6NzY0NjMwNjA2NDAyNzgzMTI1Nl8xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

进入登录成功后，看看AI聊天会话，不行的话，你就直接说，现在已经登录成功，请重新自动发送推文。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWI2MmQyNDk0ODAxMGNmMmIwZWUyY2QyMjM3ZDc1OWJfN2FlMDRlNjk0M2Y1MjE4YmFiMzIyMmMwNmQwMTM1Y2FfSUQ6NzY0NjMwNjA4NDQ1MDQyMTY5Ml8xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

如果进入到上面这个界面他没有继续自动点击了，你就点击我箭头的指向 \\[文章\\] => \\[撰写\\]，然后他就会自动进行了。看我下面的视频，重点注意视频中我的鼠标位置，其实是没动的。



![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzQzNWFlNjBlNmM0OTdjNzJhNzdkMDU3YjBkM2U2YjFfYzQ5MjRmNjA1MDAzYTVkYzlmZmFmYTQ1MjkzYmM4MGNfSUQ6NzY0NjMwNjEwNjUxNTcwNDgwNF8xNzgyMTA3MjYyOjE3ODIxMTA4NjJfVjM)

自动将本地markdown文档自动上传到推特后台

## 最后

如果你遇到什么问题，可以随时给我留言，我会快速响应，实在不行我要是方便的时间， 你可以找我，我远程帮你搞定。

---

> 来源：飞书 · AI Spark AI Wiki ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/XE3rwxIIQijVThkbKcsclKNcn3d> ｜ 归档：2026-06-22
