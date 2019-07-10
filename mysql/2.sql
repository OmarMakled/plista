-- showing all campaigns that do not have any ads

SELECT campaigns.* 
FROM campaigns
LEFT JOIN ads on campaigns.id = ads.campaign_id
WHERE ads.id IS NULL