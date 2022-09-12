-- tag_name 똑같은거 구하기

        SELECT * FROM prj_hashtag
        WHERE account = 2208310001
        and tag_name = 'tag'
        Order By tag_no;

-- tag 전체 갯수 구하기?

    SELECT * FROM prj_hashtag
    WHERE account = 2208310001
    ORDER BY tag_no;

-- tag 전제 조회

    SELECT COUNT(*) FROM prj_hashtag;

--두가지 조건

    select
    count(*) as one
    from prj_hashtag
    where account = '2208310001'
    and tag_name like 'tag';


-- test

