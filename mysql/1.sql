-- showing all campaigns of advertiser #100 that have more than 50 ads

SELECT count(ads.id) as count, campaigns.*
FROM ads
INNER JOIN campaigns on ads.campaign_id = campaigns.id
WHERE campaigns.advertiser_id = 100
GROUP BY campaign_id
HAVING count > 50
ORDER BY count DESC