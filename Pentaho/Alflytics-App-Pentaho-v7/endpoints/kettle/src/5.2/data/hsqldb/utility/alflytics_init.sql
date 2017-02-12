﻿/*
 * 
 * Alflytics - The Alfresco data warehouse and analytics for Pentaho platform.
 * 
 * Script to clean the Alflytics Data Warehouse.
 * Author: Francesco Corti (all rights reserved)
 * Date: 10 May, 2016
 *
 * Disclaimer:
 * We can't be responsible for any damage done to your system,
 * which hopefully will not happen.
 *
 */ 
TRUNCATE TABLE STG_ALF_CATEGORIES;
TRUNCATE TABLE STG_ALF_NODES;
TRUNCATE TABLE STG_ALF_USERS;
TRUNCATE TABLE OPE_ALF_CATEGORIES;
TRUNCATE TABLE OPE_ALF_USERS;
TRUNCATE TABLE DWH_DATA_QUALITY_LOGS;
TRUNCATE TABLE DWH_DATA_QUALITY;
TRUNCATE TABLE DWH_ALF_DIM_USERS AND COMMIT NO CHECK;
ALTER TABLE DWH_ALF_DIM_USERS ALTER COLUMN ID RESTART WITH 0;
TRUNCATE TABLE DWH_ALF_DIM_CONTENTS AND COMMIT NO CHECK;
ALTER TABLE DWH_ALF_DIM_CONTENTS ALTER COLUMN ID RESTART WITH 0;
TRUNCATE TABLE DWH_ALF_DIM_FOLDERS AND COMMIT NO CHECK;
ALTER TABLE DWH_ALF_DIM_FOLDERS ALTER COLUMN ID RESTART WITH 0;
TRUNCATE TABLE DWH_ALF_DIM_CATEGORIES AND COMMIT NO CHECK;
TRUNCATE TABLE DWH_ALF_DIM_TAGS AND COMMIT NO CHECK;
TRUNCATE TABLE DWH_DIM_DATES AND COMMIT NO CHECK;
TRUNCATE TABLE DWH_DIM_DATES_MONTHS AND COMMIT NO CHECK;
TRUNCATE TABLE DWH_DIM_DATES_YEARS AND COMMIT NO CHECK;
TRUNCATE TABLE DWH_ALF_DIM_INSTANCES AND COMMIT NO CHECK;
INSERT INTO DWH_ALF_DIM_INSTANCES (ID,DESCRIPTION,LOGIN,PASSWORD,PROTOCOL,HOST,PORT,USER_LIMIT,AUDIT_LIMIT,NODE_LIMIT,WORKFLOW_LIMIT,IS_ACTIVE) VALUES (1,'Alfresco','admin','admin','http','192.168.1.7','8080',5000,5000,5000,5000,'Y');
INSERT INTO DWH_ALF_DIM_INSTANCES (ID,DESCRIPTION,LOGIN,PASSWORD,PROTOCOL,HOST,PORT,USER_LIMIT,AUDIT_LIMIT,NODE_LIMIT,WORKFLOW_LIMIT,IS_ACTIVE) VALUES (30001,'Unit tests','unknown','unknown','http','localhost','80',0,0,0,0,'N');
TRUNCATE TABLE DWH_ALF_CLASS_PROPERTIES AND COMMIT NO CHECK;
TRUNCATE TABLE DWH_ALF_CLASSES AND COMMIT NO CHECK;
INSERT INTO DWH_ALF_CLASSES (ID,NAME,IS_FILE,IS_FOLDER,IS_ASPECT,IS_ROOT,OPE_TABLE_NAME,DWH_TABLE_NAME,ORDINAL,INSTANCE_ID,IS_ACTIVE) VALUES (1,'cm:content','Y','N','N','Y','OPE_ALF_CONTENTS',null,1,1,'Y');
INSERT INTO DWH_ALF_CLASSES (ID,NAME,IS_FILE,IS_FOLDER,IS_ASPECT,IS_ROOT,OPE_TABLE_NAME,DWH_TABLE_NAME,ORDINAL,INSTANCE_ID,IS_ACTIVE) VALUES (2,'cm:folder','N','Y','N','Y','OPE_ALF_FOLDERS',null,2,1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (1,'cm:node_type','d:text','N',null,null,null,null,'["nodeType"]','NODE_TYPE',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (2,'cm:name','d:text','N',null,null,null,null,'["name"]','NAME',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (3,'cm:created','d:datetime','N',null,null,null,null,'["createdAt"]','CREATED_AT',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (4,'cm:creator','d:text','N',null,null,null,null,'["createdByUser","id"]','CREATED_BY',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (5,'cm:modified','d:datetime','N',null,null,null,null,'["modifiedAt"]','MODIFIED_AT',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (6,'cm:modifier','d:text','N',null,null,null,null,'["modifiedByUser","id"]','MODIFIED_BY',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (7,'cm:owner','d:text','N',null,null,null,null,'["properties","cm:owner","id"]','OWNER',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (8,'mimeType','d:text','N',null,null,null,null,'["content","mimeType"]','MIME_TYPE',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (9,'sizeInBytes','d:int','N',null,null,null,null,'["content","sizeInBytes"]','SIZE_IN_BYTES',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (10,'cm:taggable','d:category','Y','OPE_ALF_CONTENT_TAGS','Y',null,null,'["properties","cm:taggable"]','TAG_NODE_UUID',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (11,'cm:categories','d:category','Y','OPE_ALF_CONTENT_CATEGORIES','Y',null,null,'["properties","cm:categories"]','CATEGORY_NODE_UUID',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (12,'parent_id','d:text','N',null,'Y',null,'Y','["parentId"]','PARENT_NODE_UUID',1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (13,'cm:node_type','d:text','N',null,null,null,null,'["nodeType"]','NODE_TYPE',2,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (14,'cm:name','d:text','N',null,null,null,null,'["name"]','NAME',2,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (15,'cm:created','d:datetime','N',null,null,null,null,'["createdAt"]','CREATED_AT',2,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (16,'cm:creator','d:text','N',null,null,null,null,'["createdByUser","id"]','CREATED_BY',2,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (17,'cm:modified','d:datetime','N',null,null,null,null,'["modifiedAt"]','MODIFIED_AT',2,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (18,'cm:modifier','d:text','N',null,null,null,null,'["modifiedByUser","id"]','MODIFIED_BY',2,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (19,'cm:owner','d:text','N',null,null,null,null,'["properties","cm:owner","id"]','OWNER',2,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (20,'cm:taggable','d:category','Y','OPE_ALF_FOLDER_TAGS','Y',null,null,'["properties","cm:taggable"]','TAG_NODE_UUID',2,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (21,'cm:categories','d:category','Y','OPE_ALF_FOLDER_CATEGORIES','Y',null,null,'["properties","cm:categories"]','CATEGORY_NODE_UUID',2,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (22,'parent_id','d:text','N',null,'Y',null,'Y','["parentId"]','PARENT_NODE_UUID',2,'Y');


/*
 * For test purpose only.
 */
INSERT INTO DWH_ALF_CLASSES (ID,NAME,IS_FILE,IS_FOLDER,IS_ASPECT,IS_ROOT,OPE_TABLE_NAME,DWH_TABLE_NAME,ORDINAL,INSTANCE_ID,IS_ACTIVE) VALUES (3,'exif:exif','N','N','Y','N','OPE_ALF_ASPECT_EXIF','DWH_ALF_DIM_ASPECT_EXIF',3,1,'Y');
INSERT INTO DWH_ALF_CLASSES (ID,NAME,IS_FILE,IS_FOLDER,IS_ASPECT,IS_ROOT,OPE_TABLE_NAME,DWH_TABLE_NAME,ORDINAL,INSTANCE_ID,IS_ACTIVE) VALUES (4,'dl:dataList','N','Y','N','N','OPE_ALF_FOLDER_DATALIST','DWH_ALF_DIM_FOLDER_DATALIST',4,1,'Y');
INSERT INTO DWH_ALF_CLASSES (ID,NAME,IS_FILE,IS_FOLDER,IS_ASPECT,IS_ROOT,OPE_TABLE_NAME,DWH_TABLE_NAME,ORDINAL,INSTANCE_ID,IS_ACTIVE) VALUES (5,'dl:todoList','Y','N','N','N','OPE_ALF_CONTENT_TODOLIST','DWH_ALF_DIM_CONTENT_TODOLIST',5,1,'Y');
INSERT INTO DWH_ALF_CLASSES (ID,NAME,IS_FILE,IS_FOLDER,IS_ASPECT,IS_ROOT,OPE_TABLE_NAME,DWH_TABLE_NAME,ORDINAL,INSTANCE_ID,IS_ACTIVE) VALUES (6,'cm:versionable','N','N','Y','N','OPE_ALF_ASPECT_VERSIONABLE','DWH_ALF_DIM_ASPECT_VERSIONABLE',6,1,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (23,'exif:xResolution','d:int','N',null,null,null,null,'["properties","exif:xResolution"]','XRESOLUTION',3,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (24,'exif:yResolution','d:int','N',null,'Y',null,null,'["properties","exif:yResolution"]','YRESOLUTION',3,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (25,'exif:model','d:text','N',null,null,null,null,'["properties","exif:model"]','MODEL',3,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (26,'exif:flash','d:boolean','N',null,null,null,null,'["properties","exif:flash"]','FLASH',3,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (27,'exif:fNumber','d:float','N',null,null,null,null,'["properties","exif:fNumber"]','F_NUMBER',3,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (28,'exif:dateTimeOriginal','d:datetime','N',null,'Y',null,null,'["properties","exif:dateTimeOriginal"]','DT_ORIGINAL',3,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (29,'dl:dataListItemType','d:text','N',null,'Y',null,null,'["properties","dl:dataListItemType"]','DATA_LIST_ITEM_TYPE',4,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (30,'dl:todoTitle','d:text','N',null,'Y',null,null,'["properties","dl:todoTitle"]','TODO_TITLE',5,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (31,'dl:todoDueDate','d:datetime','N',null,'Y',null,null,'["properties","dl:todoDueDate"]','TODO_DUE_DATE',5,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (32,'dl:todoPriority','d:int','N',null,'Y',null,null,'["properties","dl:todoPriority"]','TODO_PRIORITY',5,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (33,'dl:todoStatus','d:text','N',null,'Y',null,null,'["properties","dl:todoStatus"]','TODO_STATUS',5,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (34,'cm:versionLabel','d:text','N',null,'Y',null,null,'["properties","cm:versionLabel"]','VERSION_LABEL',6,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (35,'cm:initialVersion','d:boolean','N',null,'Y',null,null,'["properties","cm:initialVersion"]','INTIAL_VERSION',6,'Y');
INSERT INTO DWH_ALF_CLASS_PROPERTIES (ID,NAME,TYPE,IS_MULTIVALUE,OPE_TABLE_NAME,IS_OPE_INDEXED,DWH_TABLE_NAME,IS_DWH_INDEXED,JSON_PATH,FIELD_NAME,CLASS_ID,IS_ACTIVE) VALUES (36,'cm:autoVersion','d:boolean','N',null,'Y',null,null,'["properties","cm:autoVersion"]','AUTO_VERSION',6,'Y');


