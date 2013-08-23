package com.boventech.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/")
public class HomeController {

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "go/{controller}", method = RequestMethod.GET)
    public String index(@PathVariable String controller, HttpSession session) {
        return "redirect:/{controller}";
    }

    @RequestMapping(value = "uploads", method = RequestMethod.POST)
    public String upload(MultipartFile fileToUpload, HttpServletRequest request, ModelMap model)
            throws IOException {
        String path = request.getSession().getServletContext().getRealPath("");
        String mediaPath = "";
        if (!fileToUpload.isEmpty()) {
            String suffix = fileToUpload.getOriginalFilename().substring(
                    fileToUpload.getOriginalFilename().lastIndexOf("."));
            String logImageName = UUID.randomUUID().toString() + suffix;
            if (suffix.equals(".mp4")) {
                path += "/resources/upload/video/" + logImageName;
                mediaPath = "/resources/upload/video/" + logImageName + ";";
            }
            if (suffix.equals(".mp3")) {
                path += "/resources/upload/audio/" + logImageName;
                mediaPath = "/resources/upload/audio/" + logImageName + ";";
            }
            if (suffix.equals(".jpg") || suffix.equals(".png") || suffix.equals(".bmp")) {
                path += "/resources/upload/image/" + logImageName;
                mediaPath = "/resources/upload/image/" + logImageName + ";";
            }
            File file = new File(path);
            fileToUpload.transferTo(file);
        }
        model.addAttribute("path", mediaPath);
        return "path";
    }

}
