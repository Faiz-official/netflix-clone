# 🎬 Netflix Clone (Static Frontend)

A simple Netflix landing page clone built with HTML, CSS, and JavaScript — containerized using Docker and deployed automatically via Jenkins.

## 🧱 Project Structure
- index.html — main UI
- style.css — styling
- script.js — interactivity
- Dockerfile — container build
- Jenkinsfile — CI/CD pipeline

## 🐳 Docker Commands
```bash
docker build -t netflix-clone .
docker run -d -p 8080:80 netflix-clone

