package com.ibini.my_books.platform.repository;

import com.ibini.my_books.platform.domain.PlatformDomain;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlatformMapper {

    // 플랫폼 저장 --> TEST 완료
    // js에서 platform_bg_color, platform_font_color 기본값 날려주기
    boolean savePlatform(PlatformDomain platformDomain);
    
    // 삭제 -> TEST 완료
    boolean deletePlatform(int platform_id);

    // 수정 -> TEST 완료
    boolean modifyPlatform(PlatformDomain platformDomain);
    
    // 하나 찾기 --> TEST 완료
    PlatformDomain findOnePlatform(int platform_id);
    
    // 전체조회
    List<PlatformDomain> findAllPlatform(String account);

    // 계정에 있는 플랫폼 수 조회
    int getTotalCount(String account);

}
