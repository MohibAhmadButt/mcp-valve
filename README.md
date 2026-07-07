# 🎛️ MCP-Valve

A high-integrity control valve, firewall, and security proxy gateway designed for **Model Context Protocol (MCP)** tool execution pipelines.

**MCP-Valve** sits between desktop AI agents (such as Claude Code, Cursor, or terminal extensions) and your local environment, intercepting potentially destructive or unauthorized tool calls before they reach your system.

![Telemetry Dashboard](assets/dashboard.png)

---

## ✨ Features

- **Real-Time Tool Interception**  
  Intercepts incoming MCP tool requests and shell command arguments before execution.

- **Rule-Based Threat Mitigation**  
  Applies configurable security policies using blocked and approval-required keyword rules.

- **Human-in-the-Loop (HITL) Approval**  
  Pauses sensitive operations (such as `sudo` or package installations) for manual approval.

- **Persistent Audit Logging**  
  Stores execution metadata, timestamps, and policy decisions in a local SQLite database.

- **Live Security Dashboard**  
  Monitor intercepted requests, policy decisions, and execution history through a Streamlit interface.

- **Privacy-First Design**  
  Runs entirely on your local machine. No telemetry or execution history is sent to external servers.

---

## 📂 Project Structure

```text
mcp-valve/
├── assets/
│   └── dashboard.png
├── app.py
├── database.py
├── proxy.py
├── policies.yaml
├── pyproject.toml
├── uv.lock
├── Dockerfile
├── LICENSE
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- Python 3.12+
- UV (Python package manager)

### 1. Clone the Repository

```bash
git clone https://github.com/MohibAhmadButt/mcp-valve.git
cd mcp-valve
```

### 2. Create a Virtual Environment

```bash
uv venv
uv sync
```

### 3. Launch the Dashboard

```bash
.venv\Scripts\python.exe -m streamlit run app.py
```

Open your browser and visit:

```
http://localhost:8501
```

---

## 🛡️ Configuration

Security rules are configured in `policies.yaml`.

Example:

```yaml
blocked_keywords:
  - "rm -rf"
  - "drop table"
  - "delete from"

pending_keywords:
  - "sudo"
  - "bash_executor"
  - "install"
  - "apt-get"
```

### Rule Types

**Blocked Keywords**

Commands matching these keywords are rejected immediately.

**Pending Keywords**

Commands matching these keywords require manual approval before execution.

---

## 🏗️ Architecture

```text
AI Agent
     │
     ▼
MCP-Valve Proxy
     │
     ├── Policy Engine
     ├── Human Approval Gate
     ├── Audit Logger
     └── SQLite Database
     │
     ▼
Local System
```

---

## 📦 Tech Stack

| Component | Technology |
|-----------|------------|
| Language | Python 3.12+ |
| Protocol | Model Context Protocol (MCP) |
| Dashboard | Streamlit |
| Database | SQLite |
| Configuration | YAML |
| Package Manager | UV |
| Containerization | Docker |

---

## 📄 License

Distributed under the MIT License.

See the **LICENSE** file for more information.

---

## 🤝 Contributing

Contributions are welcome.

If you have ideas for improving security policies, dashboard functionality, or MCP integrations, feel free to open an issue or submit a pull request.

---

## 👨‍💻 Author

**Mohib Ahmad Butt**

Artificial Intelligence Student • AI/ML Engineer • Open Source Developer
