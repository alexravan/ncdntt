# Welcome to the ncdntt API!
The ncdent API provides a way for third party developers to create applications 
that interact with ncdent platform. Below are descriptions of all our APIs and 
some code examples to get you started. 

If you have any questions or feedback about the API please email our API 
developers at notARealEmail@fakeServer.com, we'd love to hear from you.

## Table of Contents

1) Get Incident
2) Get Incidents
3) Create Incident
4) Update Incident
5) Close Incident
6) Remove Incident

### Get Incident

##### URL
api/getincident?id=:id

##### Method
GET

##### URL Params
__Required:__  
id=[integer]  
example: id=12  
__Optional:__  
none

##### Success Response
__Example__  
__Code:__ 200  
__Content:__  
```json
{
    "id": 2,
    "title": "Carm is on fire",
    "description": "Second floor",
    "severity": 9,
    "location": "Carmichael Hall",
    "date_closed": null,
    "closing_comment": null,
    "created_at": "2016-03-16T02:26:02.937Z",
    "updated_at": "2016-03-16T02:26:02.937Z",
    "media_file_name": null,
    "media_content_type": null,
    "media_file_size": null,
    "media_updated_at": null,
    "user_id": 2,
    "category_id": 15,
    "is_closed": false
}
```

##### Error Response (NOT FINISHED)
__Example__  
__Code:__ 200  
__Content:__

##### Sample Call
	curl http://localhost:3000/api/getincident?id=1

### Get Incidents

##### URL
api/getincidents

##### Method
GET

##### URL Params
__Required:__  
none
__Optional:__  
none

##### Success Response
__Example__  
__Code:__ 200  
__Content:__  
```json
[{
    "id": 2,
    "title": "Carm is on fire",
    "category": {
        "id": 15,
        "created_at": "2016-03-14T16:19:41.799Z",
        "updated_at": "2016-03-14T16:19:41.799Z",
        "name": "Fire"
    },
    "description": "Second floor",
    "severity": 9,
    "location": "Carmichael Hall",
    "is_closed": false,
    "date_closed": null,
    "closing_comment": null,
    "created_at": "2016-03-16T02:26:02.937Z",
    "updated_at": "2016-03-16T02:26:02.937Z"
}, {
    "id": 3,
    "title": "Wet floor",
    "category": {
        "id": 19,
        "created_at": "2016-03-14T16:19:41.804Z",
        "updated_at": "2016-03-14T16:19:41.804Z",
        "name": "Lab Safety"
    },
    "description": "Floors in lab are covered in water",
    "severity": 5,
    "location": "Pearson Hall",
    "is_closed": false,
    "date_closed": null,
    "closing_comment": null,
    "created_at": "2016-03-16T02:27:06.148Z",
    "updated_at": "2016-03-16T02:27:06.148Z"
}]
```

##### Error Response (NOT FINISHED)
__Example__  
__Code:__ 200  
__Content:__

##### Sample Call
	curl http://localhost:3000/api/getincidents

### Create Incident

##### URL
api/createincident

##### Method
POST

##### URL Params
__Required:__*  
title=[string]  
example: title=Wet floor  
user_id=[integer]  
example: user_id=1  
category_id=[integer]  
example: category_id=5  
severity=[integer]
example: severity=7  
location=Dowling Hall  
__Optional:__  
description=[string]  
example: description=It was slippery.  

##### Success Response
__Example__  
__Code:__ 200  
__Content:__  
```json
{
    "id": 4,
    "title": "Wet floor",
    "description": "It was slippery.",
    "severity": 7,
    "location": "Dowling Hall",
    "date_closed": null,
    "closing_comment": null,
    "created_at": "2016-03-16T03:05:14.349Z",
    "updated_at": "2016-03-16T03:05:14.349Z",
    "media_file_name": null,
    "media_content_type": null,
    "media_file_size": null,
    "media_updated_at": null,
    "user_id": 1,
    "category_id": 12,
    "is_closed": false
}
```

##### Error Response (NOT FINISHED)
__Example__  
__Code:__ 200  
__Content:__

##### Sample Call
	curl --data "title=Wet floor&user_id=1&category_id=12&severity=7&location=Dowling Hall&description=It was slippery." http://localhost:3000/api/createincident

### Update Incident

##### URL
api/updateincident

##### Method
POST

##### URL Params
__Required:__
id=[integer] 
example: id=1

__Optional:__ Any of the optional parameters will overwrite the values of the associated fields for the incident with selected id.  
title=[string]  
example: title=Wet floor  
user_id=[integer]  
example: user_id=1  
category_id=[integer]  
example: category_id=5  
severity=[integer]
example: severity=7  
location=Dowling Hall  
description=[string]  
example: description=It was slippery.  

##### Success Response
__Example__  
__Code:__ 200  
__Content:__  
```json
{
    "id": 4,
    "title": "Wet floor",
    "description": "It was slippery.",
    "severity": 7,
    "location": "Dowling Hall",
    "date_closed": null,
    "closing_comment": null,
    "created_at": "2016-03-16T03:05:14.349Z",
    "updated_at": "2016-03-16T03:05:14.349Z",
    "media_file_name": null,
    "media_content_type": null,
    "media_file_size": null,
    "media_updated_at": null,
    "user_id": 1,
    "category_id": 12,
    "is_closed": false
}
```

##### Error Response (NOT FINISHED)
__Example__  
__Code:__ 200  
__Content:__

##### Sample Call
	curl --data "id=1&title=Wet floor&category_id=12" http://localhost:3000/api/updateincident

### Close Incident

##### URL
api/closeincident

##### Method
POST

##### URL Params
__Required:__
id=[integer] 
example: id=1

__Optional:__    
closing_comment=[string]
example: closing_comment=Floor was cleaned by facilities.

##### Success Response
__Example__  
__Code:__ 200  
__Content:__  
```json
{
    "id": 4,
    "title": "Wet floor",
    "description": "It was slippery.",
    "severity": 7,
    "location": "Dowling Hall",
    "date_closed": 2016-03-16T03:23:36.5367,
    "closing_comment": "Floor was cleaned by facilities.",
    "created_at": "2016-03-16T03:05:14.349Z",
    "updated_at": "2016-03-16T03:05:14.349Z",
    "media_file_name": null,
    "media_content_type": null,
    "media_file_size": null,
    "media_updated_at": null,
    "user_id": 1,
    "category_id": 12,
    "is_closed": true
}
```

##### Error Response (NOT FINISHED)
__Example__  
__Code:__ 200  
__Content:__

##### Sample Call
	curl --data "id=1&closing_comment=Floor was cleaned by facilities." http://localhost:3000/api/closeincident

### Delete Incident

##### URL
api/closeincident

##### Method
POST

##### URL Params
__Required:__* 
id=[integer] 
example: id=1

__Optional:__  
none  

##### Success Response
__Example__  
__Code:__ 200  
__Content:__  
```json
{
    "id": 4,
    "title": "Wet floor",
    "description": "It was slippery.",
    "severity": 7,
    "location": "Dowling Hall",
    "date_closed": null,
    "closing_comment": null,
    "created_at": "2016-03-16T03:05:14.349Z",
    "updated_at": "2016-03-16T03:05:14.349Z",
    "media_file_name": null,
    "media_content_type": null,
    "media_file_size": null,
    "media_updated_at": null,
    "user_id": 1,
    "category_id": 12,
    "is_closed": false
}
```

##### Error Response (NOT FINISHED)
__Example__  
__Code:__ 200  
__Content:__

##### Sample Call
	curl --data "id=1" http://localhost:3000/api/deleteincident



