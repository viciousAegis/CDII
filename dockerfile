# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /usr/src/app


# Skip installing ChromeDriver because we'll use chromedriver_autoinstaller in our script

# Install Python dependencies (make sure you have a requirements.txt with selenium and chromedriver_autoinstaller)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Ensure that the main.py configures Selenium to run Chrome in non-headless mode
# You can do this by setting the `headless` option to `False` when configuring the WebDriver.

# Use xvfb-run to start a virtual display and then execute the main.py script
# RUN google-chrome --version
# Run HTTP server in the background and execute the app.py script
CMD python -m http.server 8000 & python app.py > output.txt 2>&1

# CMD ["xvfb-run", "--auto-servernum", "--server-num=1", "python", "./main.py"]
# CMD ["python", "./main.py"]


