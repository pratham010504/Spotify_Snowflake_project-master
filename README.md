# 🎧 Spotify Data Pipeline - ETL with AWS & Snowflake

### Introduction

This project implements a fully automated ETL (Extract, Transform, Load) data pipeline that ingests data from the Spotify API, processes it through AWS services, and loads it into Snowflake using SnowPipe for analytics using Power BI.


### Architecture
![Architecture Diagram](https://github.com/AtharvThakur7/Spotify_Snowflake_project/blob/df90a53740d9bf26fb273cf9a1116150d1431098/Architecture%20Diagram.png)


#### 1. Extract
- Source: Spotify Web API
- Scheduler: Amazon CloudWatch triggers the pipeline daily.
- Extraction Logic: A Python script (packaged in AWS Lambda) retrieves streaming data such as playlists, tracks, and artists.
- Storage: Raw data is saved to Amazon S3 (Raw Zone) in JSON/CSV format.

#### 2. Transform
- Trigger: An S3 PutObject event initiates the transformation process.
- Transformation Logic: Another AWS Lambda function processes the raw data (e.g., flattening nested JSON, standardizing timestamps, removing nulls).
- Output: Cleaned and structured data is stored in Amazon S3 (Transformed Zone).
#### 3. Load
- Snowpipe: Snowflake's continuous data ingestion tool (Snowpipe) loads transformed files from S3.
- Warehouse: The data resides in Snowflake tables, optimized for analytics.
- BI Layer: Power BI connects to Snowflake for building interactive dashboards.


### Schema Used : 

![Schema Design](https://github.com/AtharvThakur7/Spotify_Snowflake_project/blob/ca043942fd928431361529709c3be98cea852447/Screenshot%202025-07-10%20142656.png)





### Services Used
1. **AWS S3(Simple Storage Service):** AWS S3 is a highly saclable object storage service used for storing and retrieving any amount of data from anywhere using web. It is commonly used to store and distribute large files.
   
2. **AWS Lambda:** AWS Lambda is a serverless computing service that lets you run code without managing servers.
   
3. **Cloud Watch:** AWS Cloudwatch is a monitoring service for AWS Resources and the applications you run on them. It is used to collect and tracks metrics, collect and monitor log files and set alarms.

4. **AWS Data Catalog:** AWS Data Catalog is a centralized metadata repository for all your data assets across various data sources. 

5. **AWS GLue Crawler:**  AWS Data Catalog consists of AWS Glue Crawler which crawls the data sources and identifies data formats, infer schemas and create AWS Glue Data Catalog.

6. **AWS Athena:**  Amazon Athena is a interactive query service that makes it easy to analyze data stored in S3 using standard SQL. It is also used to analyze stored in Glue Data Catalog.

7.  **Snowflake:** Snowflake is a cloud-based data warehouse platform that allows users to store, analyze, and exchange data securely.

8. **PowerBI:** Power BI is a business analytics service by Microsoft that allows organizations to connect to various data sources, transform and clean data, create interactive visualizations, and share insights with others.

### DashBoard
![Spotify_Dashboard](https://github.com/AtharvThakur7/Spotify_Snowflake_project/blob/8e7b211186a18fba0b56c898191ebe0d3dfeca07/Screenshot%202025-07-10%20140110.png)



### Conclusion


This Spotify Data Pipeline showcases a scalable and serverless ETL architecture using modern cloud-native tools. By leveraging AWS Lambda, S3, Snowflake, and Power BI, it enables seamless automation from data ingestion to visualization. The modular design allows easy adaptation for other APIs or data sources, making it a strong foundation for real-time or batch analytics in the music domain or beyond.



