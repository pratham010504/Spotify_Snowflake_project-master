CREATE OR REPLACE DATABASE SPOTIFY_NEW;

CREATE OR REPLACE SCHEMA TRANSFORMD_SCHEMA_NEW;

DROP STORAGE INTEGRATION s3_init_new;


CREATE STORAGE INTEGRATION s3_init_new
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = 'S3'
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::717279715372:role/spotify_aws_snowflake'
STORAGE_ALLOWED_LOCATIONS = ('s3://new-potify-etl-atharv-2025');


DESC INTEGRATION S3_init_new;



CREATE OR REPLACE FILE FORMAT CSV_FORMAT
TYPE = 'CSV'
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1;

-- TRIM_SPACE = TRUE
-- IGNORE_UTF8_ERRORS = TRUE;



-- SAMPLE_DB.TEST.CSV_FORMAT -- file format name (csv)

CREATE TABLE tranformed_songs(
    song_id VARCHAR(255) , 
    album_id VARCHAR(255) ,
    artist_id VARCHAR(255),
    song_name VARCHAR(255),
    song_uri VARCHAR(255),
    song_duration int ,
    song_popularity int,
    songs_date TIMESTAMP



)

CREATE TABLE tranformed_album(

    album_id VARCHAR(255), 
    album_name VARCHAR(255) ,
    album_release_date TIMESTAMP,
    album_image VARCHAR(255),
    album_total_tracks int 

)




CREATE TABLE tranformed_artist(
    artist_id VARCHAR(255), 
    artist_name VARCHAR(255),
    artist_uri VARCHAR(255),
    artist_playlist_link VARCHAR(255)
)



-- creating a stage 

DROP STAGE snow_stage;

CREATE STAGE snow_stage
URL = 's3://new-potify-etl-atharv-2025/transformed_data/'
STORAGE_INTEGRATION = s3_init_new;




DROP PIPE song_pipe;
DROP PIPE album_pipe;
DROP PIPE artist_pipe;

CREATE PIPE song_pipe 
AUTO_INGEST = TRUE
AS 
COPY INTO tranformed_songs
FROM @snow_stage/songs_data/
FILE_FORMAT  = (FORMAT_NAME  = 'CSV_FORMAT')





CREATE PIPE album_pipe 
AUTO_INGEST = TRUE
AS 
COPY INTO tranformed_album
FROM @snow_stage/album_data/
FILE_FORMAT  = (FORMAT_NAME  = 'CSV_FORMAT')


CREATE PIPE artist_pipe 
AUTO_INGEST = TRUE
AS 
COPY INTO tranformed_artist
FROM @snow_stage/artist_data/
FILE_FORMAT  = (FORMAT_NAME  = 'SAMPLE_DB.TEST.CSV_FORMAT')



SELECT * FROM tranformed_songs;
SELECT * FROM tranformed_artist;
SELECT * FROM tranformed_album;


DESC PIPE song_pipe;
DESC PIPE album_pipe;

DESC PIPE artist_pipe;