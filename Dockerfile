# -------------------------------
# Dockerfile by Bhavana_System
# Purpose: Run system health check script in container
# -------------------------------

# 1️⃣ Base image
FROM ubuntu:latest

# 2️⃣ Set working directory inside container
WORKDIR /app

# 3️⃣ Copy your script into container
COPY Automation/functions/sys_health_check.sh .

# 4️⃣ Give execute permissions
RUN chmod +x sys_health_check.sh

# 5️⃣ Command to run when container starts
CMD ["./sys_health_check.sh"]
