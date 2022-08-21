package com.ibini.my_books.genre.api;

import com.ibini.my_books.genre.service.GenreService;
import com.ibini.my_books.platform.domain.PlatformDomain;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/genre/c1")
public class GenreApiController {
    private final GenreService genreService;

    @GetMapping("")
    public void genreList(){

    }

    @PostMapping("")
    public void removeGenre(){

    }

    @DeleteMapping("/{account}/{platformId}")
    public void delete(@PathVariable String account,
                         @PathVariable int platformId){

    }

    @PutMapping("/{account}/{platformId}")
    public void modify(@PathVariable int platformId
            ,@RequestBody PlatformDomain platformDomain){


    }



}
