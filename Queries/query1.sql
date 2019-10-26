select user_name from project1_main.user U, project1_main.review V
             where user_name like "Phi" and U.user_id = V.user_id
             group by V.user_id having count(V.review_text) > 10