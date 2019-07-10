# Plista

- [Mysql](#mysql)
- [API](#api)
- [Application](#application)

# Mysql

![db (1)](https://user-images.githubusercontent.com/3720473/60980843-84e97f80-a335-11e9-82b4-4a11d8d3789b.png)

**showing all campaigns of advertiser #100 that have more than 50 ads**

```sql
SELECT count(ads.id) as count, campaigns.*
FROM ads
INNER JOIN campaigns on ads.campaign_id = campaigns.id
WHERE campaigns.advertiser_id = 100
GROUP BY campaign_id
HAVING count > 50
ORDER BY count DESC
```

**showing all campaigns that do not have any ads**

```sql
SELECT campaigns.*
FROM campaigns
LEFT JOIN ads on campaigns.id = ads.campaign_id
WHERE ads.id IS NULL
```

# Api

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

# Application

- [Backend]()
- [Frontend]()
