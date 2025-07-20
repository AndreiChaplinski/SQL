select t.request_at as Day, Round(Sum(case when t.status in ('cancelled_by_driver', 'cancelled_by_client') then 1 else 0 end) / Count(*), 2) as 'Cancellation Rate' from Trips t
    join Users cl on t.client_id = cl.users_id and cl.banned = 'No'
    join Users dr on t.driver_id = dr.users_id and dr.banned = 'No'
where t.request_at between '2013-10-01' and '2013-10-03'
group by t.request_at order by t.request_at;
