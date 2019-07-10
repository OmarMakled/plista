## Schema & Current Version

All API access is over HTTPS, and accessed from `https://api.plista.com`. All data is sent and received as JSON.

By default, all requests to `https://api.plista.com` receive the `v1` version of the REST API. We encourage you to explicitly request this version via the Accept header.

```
Accept: application/vnd.plista.v1+json
```

## Ads

### Selecting a specific ad

```
GET /ads/:id
```

**Response**

```
Status: 200 OK
{
    "id": int,
    "campaign_id": int,
    "title": "string",
    "text": "string",
    "image": "string",
    "sponsoredBy": "string",
    "trackingUrl" : "string"
}
```

```
Status 404 Not Found
{
    "message": "Not found"
}
```

### Creating an ad

```
POST /ads
```

**Parameters**

```
{
    "campaign_id": int,
    "title": "string",
    "text": "string",
    "image": "string",
    "sponsoredBy": "string",
    "trackingUrl" : "string"
}
```

**Response**

```
Status 201 Created
{
    "message": "Created"
    "id": int
}
```

```
Status 422 Unprocessable entity
{
    "message": "Unprocessable entity",
    "errors": [
    ]
}
```

### Modifying a specific ad

```
PUT /ads/:id
```

**Parameters**

```
{
    "campaign_id": int,
    "title": "string",
    "text": "string",
    "image": "string",
    "sponsoredBy": "string",
    "trackingUrl" : "string"
}
```

**Response**

```
Status 204 Updated
{
    "message": "Updated"
    "id": int
}
```

```
Status 422 Unprocessable entity
{
    "message": "Unprocessable entity",
    "errors": [
    ]
}
```

## Campaigns

### Selecting all ads of a specific campaign

```
GET /campaigns/:id/ads
```

**Response**

```
Status: 200 OK
{
    "ads": [
        {
            "id": int,
            "campaign_id": int,
            "title": "string",
            "text": "string",
            "image": "string",
            "sponsoredBy": "string",
            "trackingUrl" : "string"
        }
    ]
}
```

```
Status 404 Not Found
{
    "message": "Not found"
}
```

## Advertisers

### selecting all ads of a specific advertiser

```
GET /advertisers/:id/ads
```

**Response**

```
Status: 200 OK
{
    "ads": [
        {
            "id": int,
            "campaign_id": int,
            "title": "string",
            "text": "string",
            "image": "string",
            "sponsoredBy": "string",
            "trackingUrl" : "string"
        }
    ]
}
```

```
Status 404 Not Found
{
    "message": "Not found"
}
```
