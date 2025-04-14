---

# Wisecow Node.js App - CI/CD Deployment

This project is a sample Node.js web application deployed using a fully automated CI/CD pipeline with **GitHub Actions**, **DockerHub**, and **AWS EC2**. The deployment is secured and uses **HTTPS-based workflows only** (no SSH).

---

## 🚀 Features

- Node.js application containerized using Docker  
- CI/CD pipeline using GitHub Actions  
- Docker image pushed to DockerHub on every `main` branch push  
- AWS EC2 instance automatically pulls and runs the updated image using Watchtower  
- No manual intervention required after initial setup  

---

## 📦 Project Structure

wisecow-node-app/ ├── Dockerfile ├── index.js ├── package.json └── .github/ └── workflows/ └── main.yml

---

## ⚙️ Technologies Used

- Node.js  
- Docker  
- GitHub Actions  
- DockerHub  
- AWS EC2  
- Watchtower  

---

## 🔁 CI/CD Pipeline Flow

1. Developer pushes code to the `main` branch.  
2. GitHub Actions:  
   - Runs tests  
   - Builds Docker image  
   - Pushes image to DockerHub  
3. EC2 server (via Watchtower):  
   - Automatically detects new image  
   - Pulls and redeploys the latest version  

---

## 📄 GitHub Actions Workflow

The CI/CD pipeline is defined in `.github/workflows/main.yml`:

```yaml
on:
  push:
    branches: [main]

Steps:

Checkout code

Install Node.js and dependencies

Run tests

Build Docker image

Push to DockerHub



---

🐳 Dockerfile

FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]


---

🔐 GitHub Secrets

Set the following secrets in your GitHub repo:


---

☁️ EC2 Setup (One-Time)

1. Launch EC2 (Ubuntu)


2. Install Docker:

sudo apt update && sudo apt install -y docker.io


3. Pull and run your container:

docker pull <yourdockerhub>/wisecow-node-app
docker run -d --name wisecow -p 3000:3000 <yourdockerhub>/wisecow-node-app


4. Set up Watchtower:

docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower wisecow \
  --interval 30

👨‍💻 Author

Tharun Katta
Final Year B.Tech Student | DevOps Enthusiast
GitHub: @tharunkatta10
