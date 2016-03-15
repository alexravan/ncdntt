# Welcome to the ncdent API!
The ncdent API provides a way for third party developers to create applications 
that interact with ncdent platform. Below are descriptions of all our APIs and 
some code examples to get you started. 

We have kept the ncdent API as simple as possible, providing developers with a 
small number of APIs to minimize confusion and keep performance high. 
For instance, if you request a list of incidents our API will simply return all 
incidents to you. It's up to you to do the filtering.

If you have any questions or feedback about the API please email  our API 
developers at notARealEmail@fakeServer.com, we'd love to hear from you.


## GET /api/getincidents

Takes:
*Nothing 
*Returns:
** If successful: All incidents in the database in the JSON format 
** If something went wrong: A error JSON object.

### Example
```javascript
some code
```

## POST - /api/createincident

Takes:
	* usr - The integer user ID of the user who is creating the incident 
	* cat - The integer category of the incident (see here for a list of categories)
	* des - The string description of the incident, e.g. "A comp 20 student forgot about the difference between sever side code and client side code and a TA wondered aloud if they had even been to class once." 
	* sev - The integer severity of the incident (must be between 1 - 10).
	* loc - The string location of the incident - be specific without being verbose, e.g. "Halligan: Ming's usual spot" is ideal - we all know where that is. 
	* img - A link to an image of the incident, e.g. https://pbs.twimg.com/profile_images/476912086355050496/7hUZZ4m2_400x400.jpeg   

Returns: 
	* If successful: The details of the successfully created incident in JSON format. 
	* If something went wrong: A error JSON object. 

### Example
```javascript
some code
```

## POST - /api/updateincident

Takes:
	* id - The integer ID of the incident to be updated.
	* Any of the parameters that /createincident requires. The user must 
	submit at least one parameter to be modified. e.g. posting only a new 
	title would just change the title of the desired incident. Posting a new 
	title and description would change both the title AND description of the 
	desired incident etc. 


Returns:
	* If successful: The details of the successfully modified incident in JSON format.
	* If something went wrong: A error JSON object.

### Example
```javascript
some code
```



##  POST - /api/closeincident

Takes:
	* id - The integer ID of the incident to be deleted. 
	* cmt - The string comment about how/why the incident was closed, e.g "Ming hacked into the Internet, extinguished the firewalls, ate a TOR onion and saved the Presidents' level 100 prot spec Dwarf warrior from the Russians"

Returns:
	* If successful: The details of the successfully deleted incident in JSON format.
	* If something went wrong: A error JSON object.

### Example
```javascript
some code
```

##  POST - /api/deleteincident

Takes:
	* id - The integer ID of the incident to be deleted. 

Returns:
	* If successful: The details of the successfully deleted incident in JSON format.
	* If something went wrong: A error JSON object.

### Example
```javascript
some code
```



