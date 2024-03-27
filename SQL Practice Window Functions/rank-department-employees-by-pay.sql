SELECT
  FIrstName,
  LastName,
  WeeklyPay,
  Department,
  DENSE_RANK() OVER (
    PARTITION BY Department
    ORDER BY WeeklyPay DESC
  ) AS DeptRank
FROM
  Employees
ORDER BY
  Department ASC,
  DeptRank ASC;