select * from df_dallas_availability
select * from host_dallas_df
select * from listing_dallas_df
select * from review_dallas_df



--- Replacing Null Values in Host table

update host_dallas_df
set host_response_time='within an hour' where host_response_time is Null 

update host_dallas_df
set host_response_rate=100 where host_response_rate is Null 

update host_dallas_df
set host_acceptance_rate=100 where host_acceptance_rate is Null 

update host_dallas_df
set host_neighbourhood='Unknown' where host_neighbourhood is Null 

---Replacing Null value of listing table 
select * from listing_dallas_df

update listing_dallas_df
set bedrooms = 1 where bedrooms is null

update listing_dallas_df
set beds = 1 where beds is null

update listing_dallas_df
set bedrooms = 1 where bedrooms is null

 select avg(review_scores_rating)
from listing_dallas_df

update listing_dallas_df
set bedrooms = 1 where bedrooms is null

update listing_dallas_df
set review_scores_rating = 4.70061768135986 where review_scores_rating is Null

 select avg(review_scores_cleanliness)
from listing_dallas_df

update listing_dallas_df
set review_scores_cleanliness = 4.72232804025264 where review_scores_cleanliness is Null

 select avg(review_scores_accuracy)
from listing_dallas_df

update listing_dallas_df
set review_scores_accuracy = 4.75777571692917 where review_scores_accuracy is Null

 select avg(review_scores_checkin)
from listing_dallas_df

update listing_dallas_df
set review_scores_checkin = 4.79139405589063 where review_scores_checkin is Null

 select avg(review_scores_communication)
from listing_dallas_df

update listing_dallas_df
set review_scores_communication = 4.8034942749363 where review_scores_communication is Null

 select avg(review_scores_location)
from listing_dallas_df

update listing_dallas_df
set review_scores_location = 4.76392684417235 where review_scores_location is Null

 select avg(review_scores_value)
from listing_dallas_df

update listing_dallas_df
set review_scores_value = 4.69731079045729 where review_scores_value is Null




select * from listing_dallas_df

select * from review_dallas_df

select * from host_dallas_df

select count(*) from host_dallas_df7
---  Ans = 2366

---SuperHost
select count(*) from host_dallas_df
where host_is_superhost = 1
--- Ans 779

--Host
select count(*) from host_dallas_df
where host_is_superhost = 0
--- Ans 15876

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_has_profile_pic = 1
--- Ans 772 ( here profile pic most necessory for becoming superhost) - 99.10 %  superhost has profilepic


select host_identity_verified,count(*) from host_dallas_df
where host_is_superhost = 1 
group by host_identity_verified
order by host_identity_verified
---Ans 666 superhost identity verified from 779 - 85.5 % superhost verified identity

select host_identity_verified,count(*) from host_dallas_df
where host_is_superhost = 0
group by host_identity_verified
order by host_identity_verified
---Ans 1296 superhost identity verified from 1587 - 85.5 % superhost verified identity
--- Responce time
select host_response_time,count(*) from host_dallas_df
where host_is_superhost = 1 
group by host_response_time
order by count(*) desc
--- Superhost Response atmost within a day ( 88 % superhost responce within an hour,8.6% within a few hours, atlast remaining within a day)

--- Response Rate
select host_response_rate,count(*) from host_dallas_df
where host_is_superhost = 1 
group by host_response_rate
order by host_response_rate desc

--- Acceptance Rate
select host_acceptance_rate,count(*) from host_dallas_df
where host_is_superhost = 1 
group by host_acceptance_rate
order by host_acceptance_rate desc

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate =100
---Ans = 326

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate between 91 and 99
--- Ans = 339

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate between 81 and 90
---Ans = 70

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate between 0 and 80
---Ans = 44

---Host
select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate =100
---Ans = 326

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate between 91 and 99
--- Ans = 339

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate between 81 and 90
---Ans = 70

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate between 0 and 80
---Ans = 44
select * from host_dallas_df

select * from listing_dallas_df

--- Review score for for rating
---Superhost
select review_scores_rating,count(id)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1
group by review_scores_rating
order by count(id) desc

select count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of review for Superhost - 1519

select count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 and review_scores_rating between 4.5 and 5
--- No of people Rating for superhost between  4.5 to 5 = 1495 

---Host
select review_scores_rating,count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by review_scores_rating
order by review_scores_rating desc

select count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of Reviews for host = 3909

select count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and review_scores_rating between 4.5 and 5
--- No of Reviews for host between 4.5 to 5 = 3238


--- Review for Cleanlineess
--- SuperHost
select review_scores_cleanliness,count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
group by review_scores_cleanliness
order by review_scores_cleanliness desc

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of  Review  score for cleanliness for superhost = 1519

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 and review_scores_cleanliness between 4.5 and 5
--- No of Review score for cleanliness for superhost between 4.5 and 5 = 1478

---Host
select review_scores_cleanliness,count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by review_scores_cleanliness
order by review_scores_cleanliness desc

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of  Review  score for cleanliness for host = 3909

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and review_scores_cleanliness between 4.5 and 5
--- No of Review score for cleanliness for host between 4.5 and 5 = 3265


--- Review for Cleanlineess
--- SuperHost
select review_scores_cleanliness,count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
group by review_scores_cleanliness
order by review_scores_cleanliness desc

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of  Review  score for cleanliness for superhost = 1519

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 and review_scores_cleanliness between 4.5 and 5
--- No of Review score for cleanliness for superhost between 4.5 and 5 = 1478

---Host
select review_scores_cleanliness,count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by review_scores_cleanliness
order by review_scores_cleanliness desc

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of  Review  score for cleanliness for host = 3909

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and review_scores_cleanliness between 4.5 and 5
--- No of Review score for cleanliness for host between 4.5 and 5 = 3265


--- Review for value for money
--- SuperHost
select review_scores_value,count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
group by review_scores_value
order by review_scores_value desc

select count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of  Review  score value for money for superhost = 1519

select count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 and review_scores_value between 4.5 and 5
--- No of Review score for value for money superhost between 4.5 and 5 = 1472

---Host
select review_scores_value,count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by review_scores_value
order by review_scores_value desc

select count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of  Review  score value for money for host = 3909

select count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and review_scores_value between 4.5 and 5
--- No of Review score value for money for host between 4.5 and 5 = 3266

--- Instant Bookable
--- SuperHost
select  instant_bookable, count(instant_bookable)  
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
group by instant_bookable
order by instant_bookable desc

select count(instant_bookable)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of   superhost = 1519

select count(instant_bookable)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 and instant_bookable = 1
--- No of instant bookable = 551

---Host
select  instant_bookable, count(instant_bookable)  
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by instant_bookable
order by instant_bookable desc

select count(instant_bookable)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of   superhost = 3909

select count(instant_bookable)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and instant_bookable = 1
--- No of instant bookable = 2320


--- Average No of Booking Per Month
--- SuperHost
with cte as (select  month(date) as mnth, count(r.id)  as cnt 
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 1
group by month(date))

select avg(cnt) as Avg_per_mnth from cte 
---Avg No of Booking Per Month for Superhost = 6828

---Host 
with cte as (select  month(date) as mnth, count(r.id)  as cnt 
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 0
group by month(date))

select avg(cnt) as Avg_per_mnth from cte 
---Avg No of Booking Per Month for host = 7310


select * from review_dallas_df
--- Some words in comments
---Superhost
--- No of comment for superhost 
select  count(comments)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 1
--- No of comment for superhost = 81927

select  count(comments)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 1 and  (comments like ('%great%') 
or comments like ('%lovely%')
or comments like ('%Fantastic%')
or comments like ('%Awesome%')
or comments like ('%Nice%')
or comments like ('%beautiful%'))
--- No of Review for Superhost contain words like 'Great,Lovely,Fantastic,Awesome,Nice,Beautiful'= 55588

---Host
select  count(comments)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 0 
--- No of comment for host = 87685


select  count(comments)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 0 and (comments like ('%great%') 
or comments like ('%lovely%')
or comments like ('%Fantastic%')
or comments like ('%Awesome%')
or comments like ('%Nice%')
or comments like ('%beautiful%'))
--- No of Review for host contain words like 'Great,Lovely,Fantastic,Awesome,Nice,Beautiful'= 58734

--- Property Type 
--- SuperHost
select  property_type,count(property_type)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 1
group by property_type
order by count(property_type) desc

---Host
select  property_type,count(property_type)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 0
group by property_type
order by count(property_type) desc


--- City - Austin 


select * from host_austin_df
select * from listing_austin_df
select * from review_austin_df



--- Replacing Null Values in Host table

update host_dallas_df
set host_response_time='within an hour' where host_response_time is Null 

update host_dallas_df
set host_response_rate=100 where host_response_rate is Null 

update host_dallas_df
set host_acceptance_rate=100 where host_acceptance_rate is Null 

update host_dallas_df
set host_neighbourhood='Unknown' where host_neighbourhood is Null 

---Replacing Null value of listing table 
select * from listing_dallas_df

update listing_dallas_df
set bedrooms = 1 where bedrooms is null

update listing_dallas_df
set beds = 1 where beds is null

update listing_dallas_df
set bedrooms = 1 where bedrooms is null

 select avg(review_scores_rating)
from listing_dallas_df

update listing_dallas_df
set bedrooms = 1 where bedrooms is null

update listing_dallas_df
set review_scores_rating = 4.70061768135986 where review_scores_rating is Null

 select avg(review_scores_cleanliness)
from listing_dallas_df

update listing_dallas_df
set review_scores_cleanliness = 4.72232804025264 where review_scores_cleanliness is Null

 select avg(review_scores_accuracy)
from listing_dallas_df

update listing_dallas_df
set review_scores_accuracy = 4.75777571692917 where review_scores_accuracy is Null

 select avg(review_scores_checkin)
from listing_dallas_df

update listing_dallas_df
set review_scores_checkin = 4.79139405589063 where review_scores_checkin is Null

 select avg(review_scores_communication)
from listing_dallas_df

update listing_dallas_df
set review_scores_communication = 4.8034942749363 where review_scores_communication is Null

 select avg(review_scores_location)
from listing_dallas_df

update listing_dallas_df
set review_scores_location = 4.76392684417235 where review_scores_location is Null

 select avg(review_scores_value)
from listing_dallas_df

update listing_dallas_df
set review_scores_value = 4.69731079045729 where review_scores_value is Null




select * from listing_dallas_df

select * from review_dallas_df

select * from host_dallas_df

select count(*) from host_dallas_df
---  Ans = 2366

select count(*) from host_dallas_df
where host_is_superhost = 1
--- Ans 779 

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_has_profile_pic = 1
--- Ans 772 ( here profile pic most necessory for becoming superhost) - 99.10 %  superhost has profilepic

select host_identity_verified,count(*) from host_dallas_df
where host_is_superhost = 1 
group by host_identity_verified
order by host_identity_verified
---Ans 666 superhost identity verified from 779 - 85.5 % superhost verified identity

--- Responce time
select host_response_time,count(*) from host_dallas_df
where host_is_superhost = 1
group by host_response_time
order by count(*) desc
--- Superhost Response atmost within a day ( 88 % superhost responce within an hour,8.6% within a few hours, atlast remaining within a day)
select host_response_time,count(*) from host_dallas_df
where host_is_superhost = 0
group by host_response_time
order by count(*) desc


--- Response Rate
select host_response_rate,count(*) from host_dallas_df
where host_is_superhost = 1 
group by host_response_rate
order by host_response_rate desc

select host_response_rate,count(*) from host_dallas_df
where host_is_superhost = 0
group by host_response_rate
order by host_response_rate desc

--- Acceptance Rate
select host_acceptance_rate,count(*) from host_dallas_df
where host_is_superhost = 1 
group by host_acceptance_rate
order by host_acceptance_rate desc

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate =100
---Ans = 326

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate between 91 and 99
--- Ans = 339
select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate = 90

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate between 81 and 90
---Ans = 70

select count(*) from host_dallas_df
where host_is_superhost = 1 and host_acceptance_rate between 0 and 80
---Ans = 44

---Host
select count(*) from host_dallas_df
where host_is_superhost = 0 and host_acceptance_rate =100
---Ans = 815

select count(*) from host_dallas_df
where host_is_superhost = 0 and host_acceptance_rate between 91 and 99
--- Ans = 346

select count(*) from host_dallas_df
where host_is_superhost = 0 and host_acceptance_rate = 90

select count(*) from host_dallas_df
where host_is_superhost = 0 and host_acceptance_rate between 81 and 90
---Ans = 70

select count(*) from host_dallas_df
where host_is_superhost = 0 and host_acceptance_rate between 0 and 80
---Ans = 295

select * from host_dallas_df

select * from listing_dallas_df

--- Review score for for rating
---Superhost
select review_scores_rating,count(id)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1
group by review_scores_rating
order by count(id) desc

select count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of review for Superhost - 1519

select count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as 
on h.host_id = l.host_id
where host_is_superhost = 1 and review_scores_rating between 4.5 and 5
--- No of people Rating for superhost between  4.5 to 5 = 1495 

---Host
select review_scores_rating,count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by review_scores_rating
order by review_scores_rating desc

select count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of Reviews for host = 3909

select count(review_scores_rating)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and review_scores_rating between 4.5 and 5
--- No of Reviews for host between 4.5 to 5 = 3238


--- Review for Cleanlineess
--- SuperHost
select review_scores_cleanliness,count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
group by review_scores_cleanliness
order by review_scores_cleanliness desc

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of  Review  score for cleanliness for superhost = 1519

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 and review_scores_cleanliness between 4.5 and 5
--- No of Review score for cleanliness for superhost between 4.5 and 5 = 1478

---Host
select review_scores_cleanliness,count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by review_scores_cleanliness
order by review_scores_cleanliness desc

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of  Review  score for cleanliness for host = 3909

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and review_scores_cleanliness between 4.5 and 5
--- No of Review score for cleanliness for host between 4.5 and 5 = 3265


--- Review for Cleanlineess
--- SuperHost
select review_scores_cleanliness,count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
group by review_scores_cleanliness
order by review_scores_cleanliness desc

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of  Review  score for cleanliness for superhost = 1519

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 and review_scores_cleanliness between 4.5 and 5
--- No of Review score for cleanliness for superhost between 4.5 and 5 = 1478

---Host
select review_scores_cleanliness,count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by review_scores_cleanliness
order by review_scores_cleanliness desc

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of  Review  score for cleanliness for host = 3909

select count(review_scores_cleanliness)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and review_scores_cleanliness between 4.5 and 5
--- No of Review score for cleanliness for host between 4.5 and 5 = 3265


--- Review for value for money
--- SuperHost
select review_scores_value,count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
group by review_scores_value
order by review_scores_value desc

select count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of  Review  score value for money for superhost = 1519

select count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 and review_scores_value between 4.5 and 5
--- No of Review score for value for money superhost between 4.5 and 5 = 1472

---Host
select review_scores_value,count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by review_scores_value
order by review_scores_value desc

select count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of  Review  score value for money for host = 3909

select count(review_scores_value)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and review_scores_value between 4.5 and 5
--- No of Review score value for money for host between 4.5 and 5 = 3266

--- Instant Bookable
--- SuperHost
select  instant_bookable, count(instant_bookable)  
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
group by instant_bookable
order by instant_bookable desc

select count(instant_bookable)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 
--- No of   superhost = 1519

select count(instant_bookable)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 1 and instant_bookable = 1
--- No of instant bookable = 551

---Host
select  instant_bookable, count(instant_bookable)  
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 
group by instant_bookable
order by instant_bookable desc

select count(instant_bookable)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0
--- No of   superhost = 3909

select count(instant_bookable)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
where host_is_superhost = 0 and instant_bookable = 1
--- No of instant bookable = 2320


--- Average No of Booking Per Month
--- SuperHost
with cte as (select  month(date) as mnth, count(r.id)  as cnt 
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 1
group by month(date))

select avg(cnt) as Avg_per_mnth from cte 
---Avg No of Booking Per Month for Superhost = 6828

---Host 
with cte as (select  month(date) as mnth, count(r.id)  as cnt 
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 0
group by month(date))

select avg(cnt) as Avg_per_mnth from cte 
---Avg No of Booking Per Month for host = 7310


select * from review_dallas_df

--- Some words in comments
---Superhost
--- No of comment for superhost 
select  count(comments)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 1
--- No of comment for superhost = 81927

select  count(comments)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 1 and  (comments like ('%great%') 
or comments like ('%lovely%')
or comments like ('%Fantastic%')
or comments like ('%Awesome%')
or comments like ('%Nice%')
or comments like ('%beautiful%'))
--- No of Review for Superhost contain words like 'Great,Lovely,Fantastic,Awesome,Nice,Beautiful'= 55588

---Host
select  count(comments)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 0 
--- No of comment for host = 87685


select  count(comments)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 0 and (comments like ('%great%') 
or comments like ('%lovely%')
or comments like ('%Fantastic%')
or comments like ('%Awesome%')
or comments like ('%Nice%')
or comments like ('%beautiful%'))
--- No of Review for host contain words like 'Great,Lovely,Fantastic,Awesome,Nice,Beautiful'= 58734

--- Property Type 
--- SuperHost
select  property_type,count(property_type)
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 1 and property_type like 'Entire%'
group by property_type
order by count(property_type) desc

---Host
select  property_type,count(property_type) as listing
from host_dallas_df as h join listing_dallas_df as l
on h.host_id = l.host_id
join review_dallas_df as r
on r.listing_id = l.id
where host_is_superhost = 0 and property_type like 'Entire%'
group by property_type
order by count(property_type) desc

select * from host_venice_df
select * from listing_venice_df
select * from review_venice_df