package com.ibini.my_books.platform.service;

import com.ibini.my_books.platform.domain.PlatformDomain;
import com.ibini.my_books.platform.repository.PlatformMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

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
    public boolean modifyPlatform(int platformId){
        PlatformDomain platform = platformMapper.findOnePlatform(platformId);
        boolean mflag = platformMapper.ModifyPlatform(platform);
        return mflag;
    }


}
