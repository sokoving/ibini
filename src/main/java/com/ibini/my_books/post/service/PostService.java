package com.ibini.my_books.post.service;

import com.ibini.my_books.hashtag.service.HashTagService;
import com.ibini.my_books.post.domain.Post;
import com.ibini.my_books.post.dto.FormattingDateDTO;
import com.ibini.my_books.post.dto.PostWithName;
import com.ibini.my_books.post.repository.PostMapper;
import com.ibini.my_books.postImg.service.PostImgService;
import com.ibini.my_books.util.CommonUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class PostService {

    private final PostMapper postMapper;
    private final HashTagService tagService;
    private final PostImgService imgService;


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
        log.info("Post Service : fineOnePostWithName call");
        PostWithName p = postMapper.fineOnePostWithName(postNo);
        p.setting();
        p.setOneLineTag(tagService.mergeTag(postNo));
//        log.info("p.caName - {}, p.epName -{}", p.getCaName(), p.getEpName());
        return p;
    }

//    포스트 삭제
    public boolean removeService(Long postNo){
        log.info("Post Service : removeService call - {}", postNo);

//        포스트 삭제 전 해시태그, 이미지 전부 지우기
        tagService.removeTagOnPost(postNo);
        imgService.removeByPostNo(postNo);

        return postMapper.remove(postNo);
    }

//    수정
    public boolean modifyService(Post post){
        log.info("Post Service : modifyeService call - {}", post);
        return postMapper.modify(post);
    }

//    계정별 포스트 수 전체 조회
    public int getTotalCount(String account){
        log.info("Post Service : getTotalCountService call");
        return postMapper.getTotalCount(account);
    }


}
