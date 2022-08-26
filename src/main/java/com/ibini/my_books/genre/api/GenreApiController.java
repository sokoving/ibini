package com.ibini.my_books.genre.api;

import com.ibini.my_books.genre.domain.Genre;
import com.ibini.my_books.genre.service.GenreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/genre/c1")

// 장르 수정/삭제 url {account}/{genreId}

public class GenreApiController {
    private final GenreService genreService;

    @GetMapping("/{account}")
    public List<Genre> showGenre(@PathVariable String account, Model model){
        log.info("GenreApiController genre account - {}", account);
        List<Genre> genreList = genreService.findAllService(account);
        log.info("GenreApiController genreList - {}", genreList);

        model.addAttribute("account", account);

        return genreList;
    }

    @PostMapping("/{account}")
    public String saveGenre(@PathVariable String account,
            @RequestBody Genre genre){
        log.info("GenreApiController genre POST! - {}", genre);
        boolean b = genreService.saveService(genre);
        log.info("GenreApiController genre POST! boolean - {}", b);
        return b ? "insert-success" : "insert-fail" ;

    }

    @DeleteMapping("/{account}/{genreId}")
    public String delete(@PathVariable String account,
                         @PathVariable int genreId){
        log.info("GenreApiController genre Delete! - {} - {}", account, genreId);

        boolean flag = genreService.removeService(genreId);

        return flag ? "del-success" : "del-fail";
    }

    /*
        수정 페이로드
          {
                "genreId": 3,
                    "account": "ibini",
                    "genreName": "romance"
                  }
     */
    @PutMapping("/{account}/{genreId}")
    public String modify(@PathVariable String account ,
                         @PathVariable int genreId ,
                         @RequestBody Genre genre){
        log.info("GenreId - {}", genreId);
        log.info("GenreApiController genre PUT! genre - {}", genre);
        boolean flag = genreService.modifyService(genre);

        return flag ? "modi-success" : "modi-fail";
    }



}
