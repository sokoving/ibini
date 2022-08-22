package com.ibini.my_books.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtil {

   /**
    * KST 표준시를 원하는 포멧으로 변환하는 메서드
    * @param targetDate - java.util.Date ex) Tue Aug 16 15:32:45 KST 2022
    * @param dateFormat - 없으면 yyyy.MM.dd로 변환 ex) yy-MM-dd a hh:mm
    * @return String 타입으로 변환된 날짜
    */
   public static String changeDate(Date targetDate, String dateFormat){
      SimpleDateFormat newDate = new SimpleDateFormat(dateFormat);
      return newDate.format(targetDate);
   }
   public static String changeDate(Date targetDate){
      SimpleDateFormat newDate = new SimpleDateFormat("yyyy.MM.dd");
      return newDate.format(targetDate);
   }
}
