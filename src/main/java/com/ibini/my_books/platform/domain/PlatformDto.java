package com.ibini.my_books.platform.domain;

import lombok.*;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PlatformDto {

    private int total;
    private int rowNum;
    private int platformId;
    private String account; // == userId
    private String platformName;
    private String platformBgColor;
    private String platformFontColor;

}
