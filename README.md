# LifeOS

**中文** · [English](README.en.md)

LifeOS 是一个 idea、一个 MVP、也是一颗种子：让每个人都能从自己正在使用的 Codex 或 Claude Code 开始，在本地长出一套真正属于自己的个人系统。

它不是一个要求用户安装和遵守的 harness，不是一棵固定目录，不是一套完整产品，也不是 Git 仓库模板。这个仓库只是给 Agent 一个足够好的起点：如何理解用户、如何组织证据与当前状态、如何接入用户已有的工具，以及如何随着真实使用逐步演进。

## 一句话开始

当前仓库是 private，只有所有者和获邀协作者能读取。未来公开后，用户只需要把下面这句话交给自己的 Codex 或 Claude Code：

```text
请阅读 https://github.com/coffin5257/lifeos/blob/main/START.md，
在我指定的本地目录中，和我一起建立一套适合我的 LifeOS。
语言、结构和工作方式都跟随我的习惯；不要默认使用 Git。
```

Agent 会先了解这个人真正想解决的问题，再在用户选择的本地位置创建最小可用系统。用户不需要 fork 或 clone 这个仓库，也不需要把个人内容上传到 GitHub。

## Workspace 只保留值得长期带走的东西

用户的 LifeOS workspace 是一个可长期保存、备份和同步的个人空间，不是 Agent 的通用工作台。它主要保存重要的原始来源，以及从这些来源和真实工作中沉淀出的长期产出，例如当前状态、决定、知识、可复用材料和正式交付物。

需要下载临时数据、写中间代码、转换文件、构建项目、生成缓存或反复试验时，Agent 应在 workspace 之外使用单独的工作目录。工作完成后，只把用户真正需要长期保留的来源、最终结果和必要的来源说明写回 LifeOS；中间脚本、依赖、构建产物、日志和临时副本默认留在外部工作目录，并应可以安全重建或清理。

这样，LifeOS workspace 始终轻量、可理解，也更容易由用户自行选择 Git、云存储、NAS 或其他方式同步，而不会把机器相关的工作状态一起带走。

## 这颗种子包含什么

- [`START.md`](START.md)：Agent 建立 LifeOS 时使用的起始引导；
- [`seed/.lifeos/core.md`](seed/.lifeos/core.md)：证据、当前状态、判断、知识与历史的基本语义；
- [`seed/.lifeos/connectors.md`](seed/.lifeos/connectors.md)：发现和复用现有 Connector 的方式；
- [`seed/.lifeos/evolution.md`](seed/.lifeos/evolution.md)：内容、结构、skill 与自动化如何按需演进；
- [`seed/templates/`](seed/templates/)：可以翻译、裁剪或舍弃的参考结构；
- `seed/AGENTS.md` 与 `seed/CLAUDE.md`：分别给 Codex 和 Claude Code 的最小入口。

这些材料是种子，不是必须原样复制的运行时。Agent 应根据用户的语言、现有目录、实际领域和使用习惯选择、翻译、合并或重写它们。

## 它会先理解用户

LifeOS 不从“大而全的人生分类问卷”开始，而是从一个真实需求开始，例如：

- 理清当前优先级和项目；
- 准备一次重要沟通；
- 消化会议、聊天或外部文档；
- 记录并复查一个决定；
- 管理一个长期生活领域；
- 快速捕获想法，之后再整理。

Agent 会进一步了解用户的内容语言、目录习惯、重要 context、未来 30–90 天目标、隐私边界和协作偏好。默认的 `me/people/project/...` 只是语义示例；目录可以使用中文或其他语言，也可以改名、嵌套、合并或省略。

## 它会复用已有 Connector

建立 LifeOS 前，Agent 会先检查当前 Codex / Claude Code 环境已经提供的 connector、connected app、MCP、plugin、skill 和本地 CLI，再结合用户真正使用的数据源判断是否需要设置。

常见例子包括：

- Lark / 飞书：Lark CLI、connector、plugin 或 MCP；
- Slack：Slack connector、connected app、plugin 或 MCP；
- Figma：Figma integration、plugin 或 MCP；
- Notion：Notion connector、connected app、plugin 或 MCP。

系统会分别判断能力是否存在、用户是否已授权、最小只读验证是否通过。已有能力未授权时，Agent 应提醒用户走当前环境的原生授权流程；能力缺失时，说明用途并询问用户是否设置。不会要求用户把 token、密码或设备码写进 LifeOS。

## 它如何逐步长大

LifeOS 从真实使用中的摩擦演进，而不是一开始预建所有东西：

| 真实需要 | 可能长出的东西 |
|---|---|
| 当前内容陈旧或互相矛盾 | 内容更新、归档或健康检查 |
| 目录开始妨碍检索 | 结构调整与可预览迁移 |
| 同类文档反复出现 | 模板 |
| 稳定工作流反复发生 | Skill |
| 外部信息反复手工搬运 | 复用或创建 Connector |
| 稳定的周期性动作 | Hook 或自动化 |
| 跨工作流都必须遵守的边界 | 规范或 Policy |

每次演进都应说明真实证据、会读取和修改什么、需要什么权限、如何验证，以及如何移除。刚开始时不需要创建 skill 或自动化。

## GitHub 在这里扮演什么角色

GitHub 只是方便分享这颗种子和持续改进公共材料。用户自己的 LifeOS 可以放在普通本地目录、云盘、NAS、Git 仓库或其他位置；项目不限制，也不默认推荐任何一种方式。

## 当前状态

这是一个可以实际尝试的早期 MVP。它已经包含从链接开始、个性化构建、Connector 预检和持续演进所需的最小材料，但仍会通过真实用户的使用不断修正。
