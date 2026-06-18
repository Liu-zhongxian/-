# kimi K2.5的发布，让Remotion制作视频的能力无限放大

# kimi K2.5的发布，让Remotion制作视频的能力无限放大

​

![图片展示了Kimi K2.5视频转代码的流程。原始视频素材经OpenCode下载、剪辑后，Kimi K2.5利用视觉能力生成干净专业代码，最终用于Remotion项目完美复刻二创。图片还对比了Gemini Pro/ChatGPT Plus（效果差）与Kimi K2.5（效果惊艳，近乎完美）的效果，底部提示“快来试试！GitHub & Demo分享中~”。该图与文档中Kimi K2.5通过视觉能力复现视频，为Remotion制作短视频提供示例的内容相契合。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTJmMGE2NTRhZTkzNzRhZjY3Nzg4ZDlkN2JjYzU2NGVfMzEwZTE4ZmVjMzRlMWE4YzNmMzFjNzdiNTcyZTU0ZGJfSUQ6NzY0NjMwNDMwNzg5NzM3MTYwOV8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

标题是我亲自实践后得出的结论，看看会有多少人来喷我，当然了我本身也没做过视频，有些场景可能确实很难复现出来，但是我短短几天的实践，它确实太强大了，至于放大的程度我相信会得到大家的验证。

昨天Kimi 发布了最新的K2.5，我在听杨植麟视频的时候，意外发现了一个很重要的点，K2.5通过视觉能力，录个屏给它，它就会用干净、专业的代码把我们上传的视频从头到尾的复现出来。这不简直就是给remotion 制造短视频提供了绝佳的demo例子嘛，这样我们就可以二创别人的视频风格或者复刻别人视频的某一个精彩画面。

记住了我没写一行代码哟。

下面这个视频就是我复刻一张GIF图片加一个视频的结合体。我只是随便凑起来的。当然里面肯定有一些瑕疵，效果出来后我就没去调整里面的细微差异了。你往下看就知道我对两个例子改了什么。



0:00 / 0:22

因为我一直使用的是OpenCode客户端。之前的文章也详细介绍过，关于如何下载视频，剪辑视频，这里我就不过多的进行介绍了。

剪辑出视频之后再让kimi的k2.5 给我们把视频用代码复刻一下，再把代码结合remotion让AI生成我们想要的场景就可以了。

那接下来我就来试试，K 2.5到底行不行？因为我前两天刚好用Gemini Pro、ChatGPT Plus试过视频来转代码的功能，效果都很差，也可能是我姿势调整的不对？

所以对这个功能非常期待。真巧不巧Kimi就来了。大半夜的我也必须得试试。下面先是我在OpenCode中配置Kimi的API的过程，大部分可以忽略。直接到下一节。

## 上菜

先打开OpenCode 客户端，直接在聊天对话窗口里面输入/model，或者使用下图中的快捷键。

![图片展示了OpenCode客户端中输入模型选择界面。在聊天对话窗口输入/model后，弹出下拉菜单，显示“/model”字样，下方有“Build”和“GLM-4.7”选项，右侧有“Ctrl+”快捷键提示。该图片与文档中“先打开OpenCode客户端，直接在聊天对话窗口里面输入/model，或者使用下图中的快捷键”内容对应，直观呈现了输入模型选择的操作界面及样式。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODM3MDc2YjM1Yjg4YmNjNDQ2MzI5NDZjYmY1ZGZkYTZfMGMyNGZkMTRkM2QwNmM1MGM0NmUzYjdjOTgzYTE3NTVfSUQ6NzY0NjMwNDMyODE5NzgxOTMyM18xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

然后会弹出如下图所示的窗体

在弹窗中点击连接提供商

![图片展示了OpenCode客户端中选择模型的弹窗界面。界面左侧有“ 选择模型 、搜索模型、管理模型等选项，右侧是模型列表，包括OpenCode Zen、OpenAI、GPT - 5.1 Codex 、G addCriterion](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OGRhNDg5MDQyZDFhMmM5NDliOThmYzYwM2QzYTIwYzdfNjM5NTI5M2M2ZDIwMGIxOGFmZmUzMTc4ZThiMmJhMzhfSUQ6NzY0NjMwNDM0ODYyNDMyNTU4MV8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

![图片展示的是OpenCode客户端中连接提供商的弹窗界面。在搜索框内输入“kimi”后，下方出现“Kimi For Coding”选项。该图片与上文提到的在OpenCode客户端聊天对话窗口输入 自动生成](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmZkOTdlZDY1NzljNjExODA4ODNiY2JiMjBjNmRmMDJfMDBhMjhjYzJiZDFiNzFmNzhhMjNhNzg2MTE3ZGIyMWNfSUQ6NzY0NjMwNDM2NDg0ODUzMjQyMl8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

输入kimi，然后就输入API密钥了。

![图片展示的是OpenCode客户端连接Kimi For Coding的窗体界面。窗体上方显示“连接 Kimi For Coding”，下方提示输入Kimi For Coding API密钥以连接账户，并在OpenCode中使用Kimi For Coding模型。窗体中部有一个“API密钥”输入框，底部有一个“提交”按钮。该图片与文档中“先打开OpenCode客户端，直接在聊天对话窗口里面输入/model，或者使用下图中的快捷键”及“在弹窗中点击连接提供商，输入kimi，然后就输入API密钥了”等内容相关，是输入API密钥这一步骤的展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODYzNjhhY2Q4NzkxZWNkYjE4Y2Y3N2U4ZGRiYTdiNDJfMTU3ZTUwYTFmNDI0ZjAwMDI5MWU5ZmM3MDFjNjc3NjdfSUQ6NzY0NjMwNDM4ODMwNjQ3MTg5OF8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

这个时候只需要去官网进行充钱申请就可以了。[https://www.kimi.com/](https://www.kimi.com/)

我看他有个7天试用包五元钱。但是记得要去取消自动续费。

![图片展示了Kimi Code可使用的套餐信息。有Andante、Moderato、Allegretto三个套餐，Andante每月49元，提供专属Kimi Code使用额度、旗舰模型抢先体验等；Moderato每月99元，每周更新使用额度，允许多种设备登录等；Allegretto每月199元，有充足每周额度、更高并发上限等。每个套餐下方有“当前订阅”“升级退差价”“订阅”按钮。该图与上下文关系紧密，直观呈现了Kimi Code的订阅套餐及价格，帮助用户了解使用条件。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTFhNzdkZTNmZmQ2NDQ4NDJhYzFlY2EwMTA2YjNjZGZfMTRlYzFiODIxODBlZWM1MGM3MDgxNTNmYTM0MTkyMjNfSUQ6NzY0NjMwNDQwNTU1Nzg3MzYyNV8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

再到控制台[https://www.kimi.com/code/console](https://www.kimi.com/code/console) 进行新增API Key就可以使用了。

然后将API 密钥输入到OpenCode中，就会出现如下图所示的弹窗。

![图片展示的是Kimi For Coding已连接的弹窗。弹窗背景为深色，中间有白色文字“Kimi For Coding已连接”，下方是“现在可以使用Kimi For Coding模型了”。左侧有一个带有对勾的图标，右侧有一个“X”图标。该图片与上下文紧密相关，上下文提到在OpenCode中输入API密钥后，会弹出此弹窗，表明Kimi For Coding已成功连接，图片直观呈现了连接成功的状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NzMwMjBmYmEwOTU4NzVlYjdiODM4ZGFiN2Y5YmIyYjhfNWZjYzdiNTE2NzllYjFkYThmN2I5NzM4Y2NiMjRjNWNfSUQ6NzY0NjMwNDQyNzcxODE1MTA5OF8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

再去看模型有没有了，好家伙完蛋了。还没跟着更新。没关系去官网看看。

![图片展示了Kimi AI平台中模型选择界面。左侧为模型列表，包括OpenAI、Kimi For Coding、Kimi K2 Thinking、Zhipu AI Coding Plan、GLM-4.5-Flash、GLM-4.7等。右侧是当前选中的“Kimi For Coding K2 Thinking”模型信息，显示允许文本、推理，上下文限制为262,144。该图片与文档中介绍Kimi K2.5发布，让Remotion制作视频能力放大上下文相关，展示了在Kimi AI平台中选择模型的操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTBlNjljZTdlYzEzNDc4NmY5YmVlYjY3NGE5YWFlNTJfNjQ4ODJkM2Q4MTkyOWQ2ZWZhOWUyYTkyNmM4MjQ2NmRfSUQ6NzY0NjMwNDQ0NzQwODg1MTkzMF8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

官网靠谱可以有的，等OpenCode对接后再来直接尝试。

## 第一个gif图片复刻



GIF

上面这个其实是一个GIF图片，因为Kimi官网是不支持上传GIF的，主要是我上传失败了。所以我把它转换成mp4再进行上传。



0:01 / 0:18

看上面视频代码出来了，也预览了，其实效果可以说是完美复刻了，你们看看有瑕疵吗？可能有点但简直一模一样吧。

接下来干嘛，复制上面的代码，加上你想要的效果给你的remotion 项目，去复刻这个场景就完事了。

我的提示词很简单

![图片展示的是一个HTML页面代码，用于实现动画效果。代码中定义了一个点击事件监听器，当点击页面时，会移除SVG元素的动画效果，10秒后重新添加动画效果。页面底部有提示，表示在“ShoppingListScene.tsx”场景前面新增一个页面组件，参考上面代码，新增一个场景，帮其复刻一个文字“你好，前端哥社群！”。该图片与上下文紧密相关，是上下文提到的“复制上面的代码，加上你想要的效果给你的remotion项目，去复刻这个场景”操作示例。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjE0M2QyNGRiM2Q5Nzk4ZGQ2MGEwODE2ZWU4ZWY4NDNfZWIzOTk4MGIzNzY2OTI2Zjc1MWUwODdiYjZiNmYxZDJfSUQ6NzY0NjMwNDQ2NjgxMDMwOTU4NV8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

回读才发现我的提示词写的漂了一点，但是没影响我的效果

## 第二个短视频

我用OpenCode下载了一个推特视频

![图片展示的是OpenCode平台下载推特视频的界面。上方显示视频下载请求，链接为https://x.com/geekbb/status/2016114131364151557。下方提示视频下载完成，文件保存在downloads/twitter_video.mp4。接着有提示“完整路径给我一下”，下方回复完整路径为E:\\opencode\\downloads\\twitter_video.mp4。该图片与文档中“我用OpenCode下载了一个推特视频”及后续操作下载视频的上下文相关，展示了下载视频的具体操作结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTU5M2I3MDMzMjVlNTAyODUxN2FhMWIzZjBhM2Y1NThfNGIwODRlMDYxZWEzZTMyNmIwZWIyMjk1ZTYxY2E3YzRfSUQ6NzY0NjMwNDQ4ODU1NDkwODYyNV8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

这个是视频直接丢给Kimi,然后叫它给我使用网页复刻视频。



0:00 / 0:19

同样的复制代码给我的remotion

![图片展示的是一个HTML文件代码片段，包含`<html>`、`<head>`、`<body>`等标签，其中`<script>`标签内有`startAutoPlay()`函数代码，用于自动播放视频。代码最后有注释“FrontendCommunityScene.tsx”，提示在该场景之前再新增一个场景，新增一个单独的页面组件，组件实现的代码如上所示。该图片与上下文紧密相关，上下文提到在Kimi K2.5发布后，可使用代码复刻视频场景，此图片展示了代码实现方式。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjU0MzI3NjY1YjU3YzMyMjI3YWNkNmNmNzlhMmExNjRfYmMwMWUzNjgwZmYxZWE0MjVmYTZiZDFjOTAxZjQxZWFfSUQ6NzY0NjMwNDUwNzU0MjUwNjQ2Nl8xNzgxNzcwOTUxOjE3ODE3NzQ1NTFfVjM)

## 第三个短视频



0:13 / 0:39

实在想睡觉了，明天有时间再来复刻吧。

## \\## 最后

如果你跟我着我操作，是绝对可以复刻出你自己的视频的。如果你有问题也可以留言，我给你看看能不能解决你的问题，或者我直接把我的remotion的demo 发给你。不过我也可以留到在github上，看有没有必要吧。[https://github.com/aehyok/remotion](https://github.com/aehyok/remotion)
