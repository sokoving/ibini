package com.ibini.my_books.post.service;

import com.ibini.my_books.common.search.SearchPost;
import com.ibini.my_books.hashtag.service.HashTagService;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.repository.PostMapper;
import com.ibini.my_books.postImg.service.PostImgService;
import com.ibini.my_books.util.LoginUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class PostService {

    private final PostMapper postMapper;
    private final HashTagService tagService;
    private final PostImgService imgService;
    private final LinkPostService linkPostService;


//    포스트 등록
    public boolean saveService(Post post){
        log.info("Post Service : saveService call - {}", post);
        return postMapper.save(post);
    }

//    계정별 포스트 전체 조회
    public List<Post> findAllPostService(String account){
        log.info("Post Service : findAllService call");
        return postMapper.findAllPost(account);
    }

//    계정별 포스트dto 전체 조회
    public List<PostWithName> finaAllPostWithNameService(String account){
        log.info("Post Service : finaAllPostWithNameService call");

        List<PostWithName> postWithNameList = postMapper.findAllPostWithName(account);
        int size = postWithNameList.size();
        for (PostWithName postWithName : postWithNameList) {
            postWithName.setting();
            postWithName.setOneLineTag(tagService.mergeTag(postWithName.getPostNo()));
        }
        return postWithNameList;
    }

//    포스트 개별 조회
    public Post findOnePostService(Long postNo){
        log.info("Post Service : findOnePostService call");
        return postMapper.findOnePost(postNo);
    }

//    포스트 dto 개별 조회
    public PostWithName fineOnePostWithName(Long postNo){
        log.debug("Post Service : fineOnePostWithName call");
        PostWithName p = postMapper.fineOnePostWithName(postNo);
        p.setting();
        p.setOneLineTag(tagService.mergeTag(postNo));
        log.info("findOnePostWitheName - {}", p);
        return p;
    }

//    포스트 삭제
    public boolean removeService(Long postNo){
        log.info("Post Service : removeService call - {}", postNo);

//        포스트 삭제 전 해시태그, 이미지, 링크포스트 전부 지우기
        tagService.removeTagOnPost(postNo);
        imgService.removeByPostNo(postNo);
        linkPostService.postDeleteService(postNo);

        return postMapper.remove(postNo);
    }

//    수정
    public boolean modifyService(Post post){
        log.info("Post Service : modifyService call - {}", post);
        return postMapper.modify(post);
    }

//    계정별 포스트 수 전체 조회
    public int getTotalCount(String account){
        log.info("Post Service : getTotalCountService call");
        return postMapper.getTotalCount(account);
    }

    // 검색이 적용된 전체 포스트
    public List<PostWithName> searchAllPostWithNameService(SearchPost searchPost){
                log.info("Post Service :searchAllPostWithName call - {}", searchPost);
        List<PostWithName> postList = postMapper.searchAllPostWithName(searchPost);
        for (PostWithName p : postList) {
            p.pubSetting();
        }

        return postList;
    }


}
