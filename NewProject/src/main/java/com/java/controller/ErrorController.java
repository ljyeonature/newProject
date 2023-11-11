package com.java.controller;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ErrorController {

    // 404 예외 처리 핸들러
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handle404(NoHandlerFoundException e, Model model) {
        model.addAttribute("error", e.getMessage());
        return "error/error";
    }

    // 데이터베이스 오류
    @ExceptionHandler(DataAccessException.class)
    public String handleDataAccessException(DataAccessException e, Model model) {
        e.printStackTrace();
        model.addAttribute("error", e.getMessage());
        return "error/error";
    }

    // 500 에러 처리
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, Model model) {
        e.printStackTrace();
        model.addAttribute("error", e.getMessage());
        return "error/error";
    }

    // 추가: /error 경로 처리
    @RequestMapping("/error")
    public String handleError(Model model) {
        model.addAttribute("error", "General error occurred");
        return "error/error";
    }
}