# Cloudflare 最新功能 Mesh 保姆级教程：不用公网 IP，把设备和服务器连成私有网络



![图片展示了Cloudflare Mesh的网络架构，以“Cloudflare最新功能Mesh保姆级教程”为标题。画面中，电脑、手机等Client Devices通过Mesh IP与服务器Node、Warp Connector等设备相连，形成Mesh私有网络。Warp Connector与VPC Network binding相关，还涉及Workers VPC、Workers & AI Agents。图片下方标注了NAT穿透难点、混乱公网、公网IP限制等痛点，与上文介绍Cloudflare Mesh解决这些问题相呼应。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODgyMWI3NjNjMGRiNjZmMTE1NjdkYjZlNjNlMjQ2YmJfODFhMmY3ZGYzMjQwMmYxZDE0YjFjYzk0NzU5MDRhY2JfSUQ6NzY0NTcxMjQ1NDQ1ODIxNTYzN18xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

简单来说，Cloudflare Mesh 可以把你的电脑、手机、服务器，甚至是 Cloudflare Workers 连成一个跨地域的局域网。就算没有公网 IP，你的设备之间也能通过私有 IP（默认 100.96.0.0/12）互相访问，比如直连 SSH 或是调用内部 API。对个人开发者和小团队来说，免费额度（50个节点、50个用户）完全管够。

本文基于 2026-04-14 最新的 Workers VPC 更新整理，主打尝鲜和实操。

![图片展示了Cloudflare私有网络的安全访问与集成架构。左侧是用户与设备，包括笔记本电脑和智能手机，通过Cloudflare One客户端（WARP）接入Cloudflare全球网络。中间是Cloudflare网络（私有网络），使用后量子加密连接服务和设备，通过Workers VPC绑定访问内部资源，如Linux服务器、内部API和数据库。右侧是内部资源，有Linux服务器、内部API和数据库。底部是Workers和AI智能体，包括Worker和AI智能体。该图直观呈现了Cloudflare私有网络的架构及各部分关系。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzU4YzQ0YWJkZDU4MzYyNmIwOTYzNjllMDk4NzE2N2FfZjk2YTBhNWQwMWMwZjBiMzI5N2NkN2NhYjQxYmI3MzhfSUQ6NzY0NTcxMjQ2OTQ2MTE1OTExNV8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

## 核心概念一览

不搞虚的，这 4 个东西你懂了就知道怎么配：

1. **Client Device（客户端设备）**：手机和电脑。装上 Cloudflare One 客户端，登录后就能获得一个局域网（Mesh）IP。
2. **Mesh Node（节点）**：常说的服务端节点，以前叫 WARP Connector。其实就是个没界面的客户端，装在服务器上，让服务器自己加入局域网，或者作为网关把服务器背后的内网设备也拉进来。
3. **Mesh IP**：组网后分配的私网地址，默认都在 100.96.0.0/12 这个段里。
4. **Workers VPC**：新功能。这玩意能让运行在边缘节点的 Workers 也能连进你的私有网络，以后写脚本跨网调本地接口更方便了。

## 基础玩法：把电脑和服务器连起来

准备工作：一个 CF 账号，一台用来折腾的 Linux 服务器，还有你现在的电脑。

**1\\. 在云端创建 Node**

登录 CF Dashboard -> **Networking → Mesh**，点 **Add a node**：

![图片展示的是Cloudflare Dashboard中thet的Mesh页面。页面左侧导航栏中“Mesh”选项被红色框突出显示。右侧上方有“Mesh”标题，介绍其可将服务和设备通过后量子加密的mesh网络连接，无需VPN或桥接。下方显示“还没有节点”，并有“Add your first node”按钮。该图片与文档中“基础玩法：把电脑和服务器连起来”部分相关，对应“在云端创建Node”步骤，直观说明了在CF Dashboard中找到Mesh选项并添加节点的操作指引。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZThhZjVmZTVmZmRkNDQzYzgzMTU3ZjcxMTE3MTA4NzFfNTk2NmZjYTI3Zjk4ODcxYjQxZTI0MDljNTVmY2MwYWNfSUQ6NzY0NTcxMjQ4NDE4MzA4NDI0N18xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

![图片展示的是Cloudflare Dashboard中创建Node时选择团队名称的界面。界面上方提示在创建Mesh节点前需有Cloudflare One团队名称，团队将用此名称连接设备到Mesh网络。下方有“Team name”输入框，示例输入“my - vps”，并有说明该团队名称创建唯一登录URL，团队成员和设备使用此URL认证加入Mesh网络。界面右下角有“Cancel”和“Create team”按钮，其中“Create team”按钮被红色框突出显示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OGE4OWVjNzJmN2YwMjU5Mjg1ZmEwMGYwMjg4MTAyN2NfNzhjZjYyMjA0ZTA2YjQyOWUzY2FmN2FjMTFlZTZkZWVfSUQ6NzY0NTcxMjQ5MTY5NTI0NjUxNl8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

![图片展示的是在Cloudflare Dashboard中创建Node时的“Name your node”界面。界面上方提示为Node命名以便在Mesh网络中识别。下方是Node name输入框，框内已输入“ai-vps”。右下角有“Cancel”和“Continue”按钮。该图片对应文档中“在云端创建Node”步骤，是登录CF Dashboard后，点击“Networking→Mesh”下的“Add a node”后出现的界面，用于输入Node名称以继续创建Node操作。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDM3YTQ0ODYzNzQwZGI3MDQxNTU5ODg2MWRiZTdiNjFfNjJlMDY0YTA5MDVjYzNmMTJlNWY5MmI0ZDgyMzZkMmJfSUQ6NzY0NTcxMjUwMTk4ODAxOTQxN18xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

![图片展示的是Cloudflare Mesh网络设置流程。标题为“Setting up your mesh”，说明是在为Mesh网络配置账户，仅需片刻。流程分为四步：1. Mesh networking（Mesh网络）；2. Device enrollment（设备注册）；3. Device profile（设备配置文件）；4. Create ai-vps（创建ai-vps）。该图片与文档中“在云端创建Node”步骤相关，直观呈现了创建Node时的账户配置流程。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTRiMGVmNTZiN2JiODQwYmQ0OTZmODZmODQ5N2YyMGZfMzgzNTdkYWJkNzRhNjdjZWVlNjhhZGNjYjFiZDQ1MzRfSUQ6NzY0NTcxMjUxMjIyMjIwMzA5Nl8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

如果是新号，跟着向导一路点就行。老手的话注意确认下设备注册规则、配置文件和 Gateway 代理这些开关有没有打开。

**2\\. 服务器入网**

建好 Node 后页面会给一段命令和一个 Token：

![图片展示了Cloudflare Mesh的安装和连接步骤。1. Install部分，以Ubuntu环境为例，给出安装命令，包括添加公钥、更新源、安装cloudflare-warp及开启IP转发等操作。2. Register & connect部分，显示使用warp-cli命令，输入Token连接。图片与上下文紧密相关，上下文介绍了服务器入网步骤，此图直观呈现了安装和连接的具体操作命令，帮助用户在Ubuntu环境下完成Cloudflare Mesh的入网操作。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTg0NzdkMmU0NTMwM2UxZjYxNDQ0NmZlMmYxZDE2ZDNfZWQwZGQyN2E3NGU0M2RkYTBmYTRmNjM2MjUwNDBlMmRfSUQ6NzY0NTcxMjUyNjM3Nzk2MjcxMF8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

\\\*\\\*注意：\\\*\\\*现在官方的包叫 cloudflare-warp，别自己乱敲 cloudflare-mesh。

Ubuntu 环境直接复制上面的官方命令安装

装完后把你的 Token 填进去连上：

```Plain Text
sudo warp-cli connector new <TOKEN>
sudo warp-cli connect

```

回到 Dashboard 看一眼，变成 Online 就算搞定。

![图片展示的是在Ubuntu环境下使用warp-cli命令安装Cloudflare WARP客户端后的操作界面。命令执行后显示“Success”并有相关提示信息。界面底部有“Accept Terms of Service and Privacy Policy? \[y/N\] y”提示，用户需确认接受服务条款和隐私政策，此处以“y”确认。该图片与文档中“3. 本地电脑入网与测试”步骤相关，是安装客户端后的操作步骤展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTkxYWM0MDA5YmZiYmQ2Y2Y5ZDkxMWU5MTkzZjBiYWFfYTFhNWMzYTg3ZmIzYmJlYTdjMjFiNmM5MmQ4MzlmZGZfSUQ6NzY0NTcxMjUzODY5MjQ4ODQwMl8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

![图片展示的是image_id>中Cloudflare Mesh电脑入网与测试后的界面。上方提示“Your node is connected!”，说明节点已连接。中间显示节点状态为“Online”，并有节点名称“ai-vps”及IP地址“](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzY3ZTFiNjUxNjgzNWY1YmRlMzE0MzQ0YzQ2OTI3YWJfZmIwN2UxMzA3OWQxMTRkNGI1ZjhlYTgzOTM1YTRiM2FfSUQ6NzY0NTcxMjU1MjM4MjQzNDUyNF8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

**3\\. 本地电脑入网与测试**

电脑上装好 **WARP 客户端**，下载链接：[https://one.one.one.one/](https://one.one.one.one/) ，进去在偏好设置里选 **Zero Trust security**，填好你的 team name 登录。

显示 Connected 后，你的电脑和服务器就在同一个网络里了。

![图片展示的是WARP客户端在电脑上登录时输入团队名称的界面。界面上方显示IP地址1.1.1.1，中间提示“输入您的团队名称：”，下方有一个蓝色边框的文本框，已输入“my-...cloudflareaccess.com”，底部有“取消”和“确定”两个灰色按钮。该图片与文档中“3. 本地电脑入网与测试”步骤相关，即在电脑上装好WARP客户端后，在偏好设置里选“Zero Trust security”，填好team name登录，显示Connected后，电脑和服务器就在同一个网络里。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmU4ZGU1MGM4MDE0MWZhODY0MDM2N2JmZTA2ZDRkZjlfZGMzMGQ3NzZiYmE3YWNhYzEwYjcxZTlkNTU4NDMxZWJfSUQ6NzY0NTcxMjU2MzA5NjYzNjU5NF8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

![图片展示的是WARP客户端的偏好设置界面。左侧为设置选项栏，当前选中“连接”。右侧显示连接状态，API、DNS、WARP连接均已连接，主机托管中心为LAX（618f1181）。网络性能方面，收到数据262MB，发送数据20MB。下方有Tunnel Latency（device to edge）的折线图，显示时间从16:32到16:36，数值在200 - 202之间波动。该图与上文“显示Connected后，你的电脑和服务器就在同一个网络里了”的内容相呼应，直观呈现了连接状态及网络性能情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2E1YWRlYzk1YzYwN2JmZTNjY2EyYjNiODA1Y2E3ZTBfMDcxMzI2MTgwZWE4NWZkZjU0ZTkzZTVhMTNjMTM1NTVfSUQ6NzY0NTcxMjU3NDQwMzUyOTkxOV8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

找刚才设置的节点的 Mesh IP 试一下

![图片展示了在Mesh网络中测试电脑与服务器连通性的命令。包含三条命令：ping <MESH - IP>，用于测试网络连通性；ssh user@<MESH - IP>，用于远程登录服务器；curl http://<MESH - IP>:8080/health，用于获取服务器健康状态。这些命令与上文提到的电脑上装好WARP客户端，显示Connected后，电脑和服务器就在同一个网络里，以及找设置的节点的Mesh IP试通的内容相呼应，是搭建跨区域局域网的基础操作步骤。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODA3NzJlM2NjNmJhNDk0NWRhNzNlMDRmN2Q0NjIwNDFfMjNmMWJhZDVjZTJlODJlYTc3OGZlODVjMmI2NzZhZWZfSUQ6NzY0NTcxMjU4NzU4OTU1MzM0Nl8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

只要能通，基础的跨区域局域网就搭完了。

![图片展示了在Windows PowerShell中对节点Mesh IP（100.96.0.1）进行网络测试的操作界面及结果。先是使用“ping 100.96.0.1”命令，显示已发送4个数据包，接收4个，无丢失，往返行程估计时间等信息；接着使用“Test - NetConnection 100.96.0.1 - Port 22 - InformationLevel Detailed”命令，显示远程地址、端口、名称解析结果等信息，测试成功。该图片对应文档中“本地电脑入网与测试”部分，用于验证电脑和服务器在同一网络且网络连通性良好。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmVmYjRkYTk4YzdjNWI3YmZmMTY5MGYwYTQ3YjI0OTJfY2MwY2QyYjY4NWZmODBiZDE5MzFhOGNmNjZkODVlN2VfSUQ6NzY0NTcxMjYwMzM2ODQ0MzA1OV8xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

## 进阶玩法：让 Workers 访问本地服务

这是个相当有想象力的功能，你可以把 Worker 绑进局域网里，让它直接去调你服务器上还没暴露到公网的接口（比如内部 AI Agent 或者数据查询 API）。

在 wrangler.jsonc （或 toml）里绑定网络：

```Plain Text
{
  "$schema": "./node_modules/wrangler/config-schema.json",
  "name": "mesh-gateway",
  "main": "src/index.js",
  "compatibility_date": "2026-04-16",
  "vpc_networks": [
    {
      "binding": "MESH",
      "network_id": "cf1:network", // 固定写法，别乱改
      "remote": true
    }
  ]
}

```

代码里直接通过局域网地址请求：

```Plain Text
const NODE_IP = "100.96.1.50";
const NODE_PORT = 8080;

export default {
  async fetch(request, env) {
    try {
      // 魔法就在这行，直接 fetch 你的内网接口
      return await env.MESH.fetch(\`http://<equation>{NODE_IP}:</equation>{NODE_PORT}/api/data\`);
    } catch (error) {
      return new Response("Service unavailable", { status: 503 });
    }
  }
};

```

如果你想连的是组网服务器局域网里的其它机器（例如 10.0.1.50），只要 Mesh Node 那边做好了路由，同样可以直接用局域网 IP 去 fetch。

## 防踩坑指南

跑不通的时候别急着怀疑人生，重点看看这几个坑：

- **最大的坑：分割隧道（Split Tunnel）把你拉黑了** 客户端默认的排除策略里很可能会包含 100.64.0.0/10，而 Mesh 分配的段刚好是 100.96.0.0/12（后者被前者的网段包含进去了）。这会导致你本地发往 Mesh IP 的请求根本不走 CF 代理。赶紧去 Zero Trust 后台的 Settings 检查下，把不该屏蔽的段给放行。

![图片展示的是Cloudflare的拆分隧道条目（排除）界面，显示了1 - 16条记录。其中，100.64.0.0/10地址被勾选。该图片与文档中“认清现实：只能用IP，别整域名”部分内容相关，说明目前Workers调局域网服务只支持IP访问，而100.64.0.0/10是Cloudflare Zero Trust排除的IP和域，体现了只能用IP访问的现实情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWM3NTY0N2RlNmJjZjhiYTllYThjMzViMzA1NTUwZTlfMGVjYzg2MDQ4MTIyMzBjNGRiZWVhNDI5MzNjYWM1NDZfSUQ6NzY0NTcxMjYxNjAwNzY2Njg4N18xNzgxNzcwOTg3OjE3ODE3NzQ1ODdfVjM)

- **认清现实：只能用 IP，别整域名** 目前 Workers 调局域网服务只支持 IP 访问。虽然看着不够优雅，但也只能先这么用着，官方承诺的 Mesh DNS 支持后期会跟上。
- **老老实实敲命令，别等 Docker** 目前主要靠客户端或 Connector 接入，如果你想找 Docker 部署方案，还得再等等，官方的镜像还在画大饼阶段。
- **排障小建议** 如果 Dashboard 显示节点在线但死活连不通：

1. Windows 试试 Find-NetRoute -RemoteIPAddress "100.96.0.1" | Select-Object -Last 1 看看流量到底走没走 WARP。
2. 看下服务器有没有放行 100.96.0.0/12 的安全组和防火墙规则。
3. Ping 不通未必是网断了，可能单纯是你的服务器在装“死”禁了 ICMP，用 SSH 或者 curl 再确认一下。

## 写在最后

如果是日常用，前三个大步骤走完就足够你白嫖一个稳定的远程访问环境。如果你是生产需求想用 Workers VPC，考虑到它还在灰度期，上线前自己多测测，多盯紧一下官方文档。

**文章同步公众号：雨哥聊AI**