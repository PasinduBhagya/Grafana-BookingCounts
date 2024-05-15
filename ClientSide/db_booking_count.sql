set markup csv on;

spool lastMonthBookingCount.csv

SELECT year,
       month,
       Count(booking_id) AS BOOKING_COUNT,
       Sum(pax_count)    AS PAX_COUNT,
       Count(CASE
               WHEN option_status = 200 THEN 1
             END)        AS QUOTE_COUNT,
       Sum(CASE
             WHEN option_status = 200 THEN pax_count
           END)          AS QUOTE_PAX_COUNT
FROM  (SELECT RB.booking_id,
              RB.option_status,
              Count(RP.passenger_no)           AS PAX_COUNT,
              To_char(RB.booking_date, 'MON')  AS MONTH,
              To_char(RB.booking_date, 'YYYY') AS YEAR
       FROM   res_booking RB,
              res_passenger RP
       WHERE  RB.booking_id = RP.booking_id
              AND RB.booking_date >= (SELECT TRUNC(ADD_MONTHS(SYSDATE, -1), 'MM') AS first_day_last_month
FROM dual)
              AND RB.booking_date <= (SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)), 'DD-MON-YYYY') AS last_day_last_month
FROM dual)
       GROUP  BY RB.booking_id,
                 RB.option_status,
                 RB.total_price,
                 To_char(RB.booking_date, 'MON'),
                 To_char(RB.booking_date, 'YYYY')
       ORDER  BY RB.booking_id DESC)
GROUP  BY year,
          month
ORDER  BY To_date(month, 'MM')

/

spool off