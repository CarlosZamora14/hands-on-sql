SELECT
  S.salesId,
  S.customerId,
  S.salesAmount,
  I.modelId,
  I.colour,
  S.soldDate
FROM
  sales AS S
  INNER JOIN inventory AS I ON S.inventoryId = I.inventoryId
WHERE
  I.modelId IN (
    SELECT
      modelId
    FROM
      model
    WHERE
      EngineType = 'Electric'
  )
