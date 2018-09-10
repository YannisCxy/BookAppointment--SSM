package com.nnic.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nnic.bean.Books;
import com.nnic.bean.Orders;
import com.nnic.service.IBooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.awt.print.Book;
import java.util.List;

/**
 * @Description com.nnic.controller
 * @Author Yannic
 * @Date 2018/9/2
 * @Version 1.0
 */
@Controller
public class BooksController {
    @Autowired
    @Qualifier("booksService")
    private IBooksService booksService;

    public void setBooksService(IBooksService booksService) {
        this.booksService = booksService;
    }

    //插入数据
    @RequestMapping("/addBooks.do")
    public String doInsertBooks(Books books) {
        if (booksService.addBooks(books)) {
            return "redirect:listBooks.do?pn=1";
        } else {
            return "/admin/addbooks.jsp";
        }
    }

    @RequestMapping("/listBooks.do")
    public String doListBooks(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        List<Books> books = booksService.selectAll();
        PageInfo pageInfo = new PageInfo(books, 5);
        model.addAttribute("pageInfo", pageInfo);
        return "/bam/books.jsp";
    }
    //书籍查询：书名、类型、出版社
    @RequestMapping(value = "/queryBooks.do", method = RequestMethod.GET)
    public String doQueryBooks(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model, String queryinfo, String querytype) {
        int pageSize = 5;
        PageHelper.startPage(pn, pageSize);
        model.addAttribute("queryinfo",queryinfo);
        model.addAttribute("querytype",querytype);
        if (querytype.equals("book_name")) {
            List<Books> books = booksService.selectByName(queryinfo);
            if(books==null||books.isEmpty()){
                model.addAttribute("msg","哎哟喂，找不到这本书咯，换一个搜搜吧");
                return "/exceptionError/queryBookError.jsp";
            }
            PageInfo pageInfo = new PageInfo(books, 5);
            model.addAttribute("pageInfo", pageInfo);
            return "/bam/bookslistbyquery.jsp";
        } else if (querytype.equals("book_type")) {
            List<Books> books = booksService.selectByType(queryinfo);
            if(books==null||books.isEmpty()){
                model.addAttribute("msg","哎哟喂，找不到这本书咯，换一个搜搜吧");
                return "/exceptionError/queryBookError.jsp";
            }
            PageInfo pageInfo = new PageInfo(books, 5);
            model.addAttribute("pageInfo", pageInfo);
            return "/bam/bookslistbyquery.jsp";
        } else if (querytype.equals("book_publish")) {
            List<Books> books = booksService.selectByPublish(queryinfo);
            if(books==null||books.isEmpty()){
                model.addAttribute("msg","哎哟喂，找不到这本书咯，换一个搜搜吧");
                return "/exceptionError/queryBookError.jsp";
            }
            PageInfo pageInfo = new PageInfo(books, 5);
            model.addAttribute("pageInfo", pageInfo);
            return "/bam/bookslistbyquery.jsp";
        }else{
            model.addAttribute("msg","哎哟喂，找不到这本书咯，换一个搜搜吧");
            return "/exceptionError/queryBookError.jsp";
        }
    }
    //跳转到详情页面
    @RequestMapping(value = "/booksInfo.do")
    public String doJumpBooksInfo(@RequestParam(value = "id") int id, Model model){
        Books bookInfo = booksService.selectById(id);
        model.addAttribute("bookInfo",bookInfo);
        return "/bam/booksinfo.jsp";
    }
}
