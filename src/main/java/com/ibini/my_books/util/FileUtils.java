package com.ibini.my_books.util;

import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class FileUtils {

    private static final Map<String, MediaType> mediaMap;

    static {
        mediaMap = new HashMap<>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);
    }
    // 확장자(ext)를 알려주면 미디어타입을 리턴하는 메서드 upper(높은)
    // .toUpperCase() 메서드는 문자열을 대문자로 변환한 값을 반환 /소문자가대문자됌
    public static MediaType getMediaType(String ext) {
        String upperExt = ext.toUpperCase();
        if (mediaMap.containsKey(upperExt)) {
            return mediaMap.get(upperExt);
        }
        return null;
    }

    // 1. 사용자가 파일을 업로드했을 때 새로운 파일명을 생성해서
    //    반환하고 해당 파일명으로 업로드하는 메서드
    // ex) 사용자가 상어.jpg를 올렸으면 이름을 저장하기 전에 중복없는 이름으로 바꿈

    /**
     *
     * @param file - 클라이언트가 업로드한 파일 정보
     * @param uploadPath - 서버의 업로드 루트 디렉토리 (E:/sl_test/upload)
     * @return - 업로드가 완료된 새로운 파일의 full path
     */ // 컨트롤러에서 upload 에서 uploadPath가져옴

    public static String uploadFile(MultipartFile file, String uploadPath) {

        // 중복이 없는 파일명을 변경하기
        // ex) 상어.png -> dfsfsdfsdfsdfsdfsdfd_상어.jpg
        String newFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();



        // 업로드 경로를 변경
        // E:/sl_test/upload -> E:/sl_test/upload/2022/08/09
        String newUploadPath = getNewUploadPath(uploadPath);

        // 파일 업로드 수행
        File f = new File(newUploadPath, newFileName);


        try {
            file.transferTo(f); // 그 폴더에 그 파일명으로 폴더저장
        } catch (IOException e) {
            e.printStackTrace();
        }


        // 파일의 풀 경로 (디렉토리경로 + 파일명)
        String fileFullPath = newUploadPath + File.separator + newFileName;

        // 풀경로 - 루트 경로 문자열 생성
        // full-path -> E:/sl_test/upload/2022/08/01/
        // res-path -> /2022/08/01/sdfsdfsd_상어.jpg
        // uploadPath => E:/sl_test/upload
        String responsFilePath = fileFullPath.substring(uploadPath.length());

        return responsFilePath.replace("\\", "/");
    }

    private static String getNewUploadPath(String uploadPath) {

        LocalDateTime now = LocalDateTime.now();
        int y = now.getYear();
        int m = now.getMonthValue();
        int d = now.getDayOfMonth();

        // 폴더 생성
        String[] dateInfo = {
                String.valueOf(y)
                , len2(m)
                , len2(d)
        };

        String newUploadpath = uploadPath;

        // File.separator : 운영체제에 맞는 디렉토리 경로구분문자(\\, /)를 생성
        // 리눅스 : / , 윈도우 : \
        for (String date : dateInfo) {
            newUploadpath += File.separator + date;

            // 해당 경로대로 폴더를 생성 / mkdir 디렉토리생성
            File dirName = new File(newUploadpath);
            if (!dirName.exists()) dirName.mkdir();
        }

        return newUploadpath; // 폴더 다만들고 파일을 넣어줌
    }

    // 한자리수 월, 일 정보를 항상 2자리로 만들어주는 메서드
    private static String len2(int n) {
        return new DecimalFormat("00").format(n);
    }

    // 파일명을 받아서 확장자를 반환하는 메서드
    public static String getFileExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }
}
