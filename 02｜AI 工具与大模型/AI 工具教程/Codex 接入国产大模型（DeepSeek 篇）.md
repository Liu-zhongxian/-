# Codex 接入国产大模型（DeepSeek 篇）

把 Codex 的模型供应商到 DeepSeek，用 CC Switch 管理配置。全程图形界面操作，不需要手动编辑配置文件。

### 原理

能让 Codex 用上 DeepSeek，基于两点：

- Codex 支持自定义模型供应商，不绑定 OpenAI。
- DeepSeek 提供 OpenAI 兼容的 API，可以作为自定义供应商填入。

### 前置条件

- 已安装 Codex 桌面应用
- 已安装 CC Switch。
- 有一个 DeepSeek 账号。

![图片展示的是Codex的登录界面。界面上方有红色、黄色、绿色的圆点图标。中间部分上方有Codex的标志，下方文字为“欢迎使用 Codex”，并有“所有功能”和“扩展功能包”两个选项。下方有一个黑色的“使用”按钮，按钮上有“使用”字样和一个钥匙图标，旁边还有“继续”字样。再下方是“使用其他方式登录”选项，最下方是“注册”字样。该图片与文档中“步骤1：创建DeepSeek API key”上下文相关，是登录Codex平台的界面示例。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDYyYjdhN2E0NTdmZmMyMzZiYWE3NDAwNDY1MjJlYzBfOTNkODQ0NTkwNDZkNzg1ZTY3OGQwOTRjZjRhNTEwOTlfSUQ6NzY1MDgwMTc4NTM4ODgxMzUwNl8xNzgyMTA3MDA1OjE3ODIxMTA2MDVfVjM)

### 步骤 1：创建 DeepSeek API key

登录 DeepSeek 开放平台，左侧进入「API keys」，点击「创建 API key」。

![图片展示了DeepSeek开放平台的API keys页面。左侧导航栏中“API keys”选项被红色箭头1指向。右侧主区域显示API keys列表，暂无API key，下方有“创建API key”按钮，被红色箭头2指向。该图片与文档中“步骤1：创建DeepSeek API key”内容相关，直观呈现了在DeepSeek开放平台创建API key的操作入口，帮助用户了解操作位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTcwYTIwNjdmZGYyODYwMjUzNWU0NzQ3OWMxM2Y1NGFfYzNjY2VkZmUwMzE5MzQ4YjdmODQ0YWUzYjY2MWZiZjRfSUQ6NzY1MDgwMTc4NTUyNDYzNjg1M18xNzgyMTA3MDA1OjE3ODIxMTA2MDVfVjM)

填写名称（示例：`codex+ds`），点击创建。

![图片展示了在DeepSeek开放平台创建API key的界面。界面上方显示“创建API key”，下方有“名称”输入框，示例名称为“codex+ds”。界面右下角有“取消”和“创建”按钮，其中“创建”按钮被红色箭头指向。该图片与文档中“步骤1：创建DeepSeek API key”内容相关，直观呈现了创建API key时的操作界面及关键操作按钮位置，帮助用户了解创建API key的具体操作步骤。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDAzZThhMzUzMWE4YWIzYjhiNDRjNjM1OTIxODRjZDZfNjE2YmQ4ODA0MTQxNjU5Y2UzNTVlOWNmOTQzMjM5YTVfSUQ6NzY1MDgwMTc4NzI5Njg5Mzg5Ml8xNzgyMTA3MDA1OjE3ODIxMTA2MDVfVjM)

⚠️ API key 仅在创建时完整显示一次，需立即复制保存。关闭弹窗后无法再次查看，丢失只能重建。

![图片展示的是在CC Switch添加DeepSeek供应商时创建API key的弹窗。弹窗上方有红色提示“注意，此处的API key只会出现1次，要认真保存。”，下方是“创建API key”内容，提示将此API key保存在安全且易于访问的地方，因安全原因无法再次查看。API key部分被部分遮挡，下方有“关闭”和“复制”按钮。该图片与上文“步骤2：在CC Switch添加DeepSeek供应商”中将上一步复制的API key填入API key栏的内容相关，直观呈现了API key的创建及保存提示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzU1YTQ4YThhYmU5ZTViNDVjM2U3NDkzMmM4ZTA4NTJfYTg0ODc3Y2ZiMWE5OTBhOWI5MWRhY2EzOWQzYmIxZmFfSUQ6NzY1MDgwMTc4Njk4MjMyMTExMl8xNzgyMTA3MDA1OjE3ODIxMTA2MDVfVjM)

### 步骤 2：在 CC Switch 添加 DeepSeek 供应商

打开 CC Switch，点击右上角「+」添加供应商。

![图片展示了CC Switch界面，用于添加供应商。界面顶部有多个图标，其中红色箭头1指向的“+”号图标是添加供应商的入口。界面下方显示了“default”供应商，其官网地址未配置。红色箭头2指向的“+”号图标与上文“打开CC Switch，点击右上角「+」添加供应商”相呼应，直观呈现了添加供应商的具体操作位置，帮助用户明确操作步骤。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OThkNTc1NjlkZGQ1YTY1ZjYyYWEzYjJkMWNmY2I3NTlfZTg1N2Q0NDYyNWEwZjUyODI5OTJlNzhmMzk5ODJlZjlfSUQ6NzY1MDgwMTc4NzM5NzU0MDgyMl8xNzgyMTA3MDA1OjE3ODIxMTA2MDVfVjM)

在添加页填写：

- 顶部选择「Codex 自定义」标签。
- 预设供应商中选择 DeepSeek，名称与地址会自动填好。
- 将上一步复制的 API key 填入 API key 栏。

点击右下角「添加」。

![图片展示了Codex添加新供应商界面。在预设供应商中选择“DeepSeek”，名称与地址会自动填好。需将上一步复制的API key填入API key栏，最后点击右下角“添加”。图片中用红色箭头和数字序号标识了关键操作步骤：①选择“DeepSeek”；②将API key填入对应栏；③点击“添加”。该图片与上文步骤2的内容紧密相关，直观呈现了添加新供应商的具体操作界面及关键操作位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDZjNDk5NTY3OTQ4MGViZjM5YWFmOTE3ZDc1N2JhZGNfN2I1Yzk4OTg5OGRiNWUzMWJiYzU3NGU2NjFhMzE4ZjZfSUQ6NzY1MDgwMTc4MzUxNDA3NDMyOV8xNzgyMTA3MDA1OjE3ODIxMTA2MDVfVjM)

### 步骤 3：启用 DeepSeek 并开启本地路由

在供应商列表中找到 DeepSeek，点击「启用」。

![图片展示了CC Switch界面，用于设置DeepSeek供应商。界面中显示了“DeepSeek”供应商，其官网地址为https://platform.deepseek.com。图片中有红色箭头和数字标识，①处箭头指向“DeepSeek”下方的“启用”按钮，提示点击启用；②处箭头指向左上角的齿轮图标，提示点击设置。该图片与上文“步骤3：启用DeepSeek并开启本地路由”相关，直观呈现了在供应商列表中找到DeepSeek后，点击“启用”和进入设置的操作位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzkxY2YyNzA1MTFhNTFmNzY1MTBjNmYyYzc1MTRlNThfZjVmNTBiMjAwODQ4MTdkYTY4MGNjMDNjMjk3NWRkZDlfSUQ6NzY1MDgwMTc4NTY0NDU4NDExNF8xNzgyMTA3MDA1OjE3ODIxMTA2MDVfVjM)

点击左上角齿轮进入设置，切到「路由」标签，开启：

- 路由总开关
- 服务中的「Codex」开关

![图片展示的是DeepSeek在设置界面中“路由”标签下的内容。画面中“路由总开关”“服务中的Codex开关”“服务中的Gemini开关”均被红色箭头和数字序号标识为开启状态。该图片与上文“步骤3：启用DeepSeek并开启本地路由”相关，直观呈现了在设置中开启路由总开关及服务中Codex、Gemini开关的操作步骤，帮助用户在实际操作中明确操作位置和状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTUyYWEyY2RiMmE3NGRhM2Q1NTgzMjcxODA1ZDM1NzZfZDc4YzFlOTJjZDFkZTE2YzFkN2ZmNTk5MGRkMjFhODBfSUQ6NzY1MDgwMTc4NjAwMTA4MzM0OF8xNzgyMTA3MDA1OjE3ODIxMTA2MDVfVjM)

### 步骤 4：重启 Codex 验证

重启 Codex 以重新加载配置。在对话框发送任意消息（如「你好」），能正常回复即接入成功。

![图片展示的是Codex界面，左侧为导航栏，有“新对话”“商家”“模型”“自动化”等选项，当前选中“模型”。右侧是对话框，显示“你好，有什么我可以帮助你的吗？”字样，右上角有“你好”“已处理 On”“你好，有什么我可以帮助你的吗？”等信息。该图片与文档中“重启Codex验证”部分相关，用于说明重启Codex后在对话框发送消息能正常回复即接入成功的情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2JkZDRlODZlNWU5MjM1NzZkNjg4MGNmNDFlOGQ4NTBfMDczY2IzZDQ4Y2ZmNjIwYzcyZmI0NTk5ODBjNmJhNDVfSUQ6NzY1MDgwMTc4NDQyODM2NzA2NV8xNzgyMTA3MDA1OjE3ODIxMTA2MDVfVjM)

### 切换回原模型

CC Switch 是供应商切换工具。在列表中启用其他供应商即可切回，无需手动修改配置。

---

> 来源：飞书 · AI Spark AI Wiki ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/Gtppwyyd1iUtWVkRtiGc8V0mnKg> ｜ 归档：2026-06-22
