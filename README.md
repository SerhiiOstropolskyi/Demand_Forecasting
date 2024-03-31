### Repository Description

This repository contains a demand forecasting application built with Python, utilizing TensorFlow for creating a neural network model to forecast product demand based on historical sales data. The application integrates with Apache Kafka for data streaming, allowing for dynamic demand predictions. This setup is containerized using Docker to streamline the deployment and execution environment, ensuring consistency across different setups. 

### Features
* Demand forecasting with a neural network model
* Data preprocessing and visualization
* Data streaming with Kafka
* Containerized setup with Docker for easy deployment (using WSL subsystem)

### Prerequisites
* Python 3.11.1
* Docker and Docker Compose (WSL subsystem)
* Apache Kafka (included in the Docker setup)

### Application Setup

* Clone this repository to your local machine.

* Install the required Python libraries: **pandas numpy tensorflow matplotlib scikit-learn keras kafka-python**

### Setting Up Docker and Kafka

Ensure Docker and Docker Compose are installed on your system. If not, follow the Docker installation steps included in **Docker.txt**.

To launch Kafka and Zookeeper instances, navigate to the repository's root directory and run in the WSL console: **sudo docker-compose up -d**

* Verify that Kafka and Zookeeper are running correctly:  **sudo docker-compose ps**

* Create topic in Kafka:
 
**sudo docker exec -it <kafka_container_name> kafka-topics --create --topic <kafka_topic_name> --partitions 1 --replication-factor 1 --if-not-exists --bootstrap-server localhost:9092**

* Start the Kafka and Zookeeper services (if not already running): **sudo docker-compose up -d**

* To stop the Kafka and Zookeeper services without removing them: **docker-compose stop**

* To stop and remove all Docker containers associated with the application: **docker-compose down**

* Setting the Message Lifetime (10s -> 10000ms):
 
**sudo docker exec -it <container_id> kafka-configs --bootstrap-server localhost:9092 --alter --entity-type topics --entity-name sales_data --add-config retention.ms=10000**

### Running the Application

Execute the demand_forecasting.py script to start the demand forecasting process (in console without visualization): **python demand_forecasting.py**

Or run demand_forecasting.ipynb in Jupyter Notebook

### Containerization with Docker. Running a Docker Script

Navigate to the directory that contains your Dockerfile using the cd /path/to/directory command.

* Build the Docker image using: **sudo docker build -t image_name .**

* Start the Docker container using: **sudo docker run --network="host" image_name**

* To check existing images use: **sudo docker ps -a**

* To remove image use: **sudo docker rm image_id**

