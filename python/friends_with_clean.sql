create table friends_with_1
  (primary key (user_id1, user_id2))
  select user_id1, user_id2
  from friends_with
  where user_id2 in
        (select user_id from user);