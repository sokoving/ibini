package com.ibini.my_books.genre.service;

import com.ibini.my_books.genre.domain.Genre;
import com.ibini.my_books.genre.repository.GenreMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class GenreService {

    private final GenreMapper genreMapper;

    public boolean saveService(Genre genre){
        log.info("Genre Service : saveService call - {}", genre);
        return genreMapper.save(genre);
    }

    public List<Genre> findAllService(String account){
        log.info("Genre Service : findAllService call - {}", account);
        return genreMapper.findAllGenre(account);
    }

    public Genre findOneService(int genreId){
        log.info("Genre Service : findOneService call - {} ", genreId);
        return genreMapper.fineOneGenreByGenreId(genreId);
    }

    public boolean modifyService(Genre genre){
        log.info("Genre Service : modifyService call - {}", genre);
        return genreMapper.modify(genre);
    }

    public int getTotalCountService(String account){
        log.info("Genre Service : getTotalCountService call - {}", account);
        return genreMapper.getTotalCount(account);
    }
    public boolean removeService(int genreId){
        log.info("Genre Service : removeService call - {}", genreId);
        return genreMapper.remove(genreId);
    }

}
