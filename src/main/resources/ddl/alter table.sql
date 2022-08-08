ALTER TABLE tbl_post
ADD CONSTRAINT fk_member_user_id
FOREIGN KEY (user_id)
REFERENCES tbl_member(user_id);

ALTER TABLE tbl_post
ADD CONSTRAINT fk_genre_id
FOREIGN KEY (genre_id)
REFERENCES prj_genre(genre_id);

ALTER TABLE tbl_post
ADD CONSTRAINT fk_ca_id
FOREIGN KEY (ca_id)
REFERENCES prj_category(ca_id);

ALTER TABLE tbl_post
ADD CONSTRAINT fk_platform_id
FOREIGN KEY (platform_id)
REFERENCES prj_platform(platform_id);

ALTER TABLE prj_post_memo
ADD CONSTRAINT fk_post_memo
FOREIGN KEY (post_no)
REFERENCES tbl_post(post_no);

ALTER TABLE prj_post_mark
ADD CONSTRAINT fk_post_mark
FOREIGN KEY (post_no)
REFERENCES tbl_post(post_no);

ALTER TABLE prj_hashtag
ADD CONSTRAINT fk_hashtag
FOREIGN KEY (post_no)
REFERENCES tbl_post(post_no);

ALTER TABLE prj_post_img
ADD CONSTRAINT fk_post_img
FOREIGN KEY (post_no)
REFERENCES tbl_post(post_no);

ALTER TABLE prj_genre
ADD CONSTRAINT fk_genre
FOREIGN KEY (user_id)
REFERENCES tbl_member(user_id);

ALTER TABLE prj_platform
ADD CONSTRAINT fk_platform
FOREIGN KEY (user_id)
REFERENCES tbl_member(user_id);

ALTER TABLE login_list
ADD CONSTRAINT fk_login_list
FOREIGN KEY (user_id)
REFERENCES tbl_member(user_id);

commit;