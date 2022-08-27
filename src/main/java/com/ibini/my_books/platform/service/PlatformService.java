package com.ibini.my_books.platform.service;

import com.ibini.my_books.platform.domain.PlatformDomain;
import com.ibini.my_books.platform.repository.PlatformMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class PlatformService {

    private final PlatformMapper platformMapper;

    // 전체조회
    public List<PlatformDomain> findAllPlatform(String account){
        List<PlatformDomain> platformList = platformMapper.findAllPlatform(account);
        return platformList;
    }
    //하나만 조회
    public PlatformDomain findOnePlatform(int platformId){
        PlatformDomain platform = platformMapper.findOnePlatform(platformId);
        return platform;
    }


    // 저장
    public boolean savePlatform(PlatformDomain platformDomain){
        boolean flag = platformMapper.savePlatform(platformDomain);
        return flag;
    }

    // 삭제
    public boolean deletePlatform(int platformId){
        boolean dflag = platformMapper.deletePlatform(platformId);
        return dflag;
    }

    // 수정
    public boolean modifyPlatform(PlatformDomain platformDomain){
        boolean mflag = platformMapper.modifyPlatform(platformDomain);
        return mflag;
    }

    //    새 회원 가입할 때 기본 플랫폼 세팅
    @Transactional
    public boolean setPlatformForNewMember(String account){
        log.info("Platform Service : setPlatformForNewMember call - {}", account);
        String[] basic = {"미분류", "카카오페이지", "네이버시리즈", "리디북스", "카카오웹툰", "네이버웹툰"};

        for (String b : basic) {
            PlatformDomain p = new PlatformDomain();
            p.setAccount(account);
            p.setPlatformName(b);
            platformMapper.savePlatform(p);
        }

        return platformMapper.getTotalCount(account) == basic.length;
    }

    //    회원 탈퇴 시 계정 내 모든 장르 삭제
    @Transactional
    public boolean removePlatformForOutMember(String account){
        log.info("Platform Service : removePlatformForOutMember call - {}", account);

        List<PlatformDomain> pl = platformMapper.findAllPlatform(account);
        for (PlatformDomain p : pl) {
            int id = p.getPlatformId();
            platformMapper.deletePlatform(id);
        }

        return platformMapper.getTotalCount(account) == 0;
    }


}
