package com.thanhh.java5shop.controller;

import com.thanhh.java5shop.constant.SessionAttr;
import com.thanhh.java5shop.model.Account;
import com.thanhh.java5shop.repository.AccountDao;
import com.thanhh.java5shop.service.MailerService;
import com.thanhh.java5shop.service.RandomService;
import com.thanhh.java5shop.utils.CookieService;
import com.thanhh.java5shop.utils.ParamService;
import com.thanhh.java5shop.utils.SessionService;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("home")
public class UserController {

    @Autowired
    ParamService paramService;

    @Autowired
    CookieService cookieService;

    @Autowired
    SessionService sessionService;

    @Autowired
    AccountDao accountDao;

    @Autowired
    RandomService randomService;

    @Autowired
    MailerService mailerService;

    @RequestMapping ("login")
    public String login(Model model) {
        String username = paramService.getString("username","");
        String password = paramService.getString("password","");
        boolean remember = paramService.getBoolean("remember",false);

        Account user = accountDao.login(username,password);
        if (user != null) {
            sessionService.set(SessionAttr.CURRENT_USER,user);
            if (remember) {
                cookieService.add("username",user.getUsername(),10);
                cookieService.add("password",user.getPassword(),10);
            } else {
                cookieService.remove("username");
                cookieService.remove("password");
            }
            return "redirect:/home/index";
        } else {
            return "user/login";
        }
    }

    @RequestMapping("/logout")
    public String logout() {
        sessionService.remove(SessionAttr.CURRENT_USER);
        return "redirect:/home/index";
    }

    @GetMapping("/register")
    public String showRegister(Model model) {
//        Account item = new Account();
        model.addAttribute("item",new Account());
        return "user/register";
    }

    @RequestMapping("/register/create")
    public String register(@Validated @ModelAttribute("item") Account item, BindingResult bindingResult, Model model,
                           @RequestParam(value = "photo")MultipartFile multipartFile) throws IOException {

//        if (bindingResult.hasErrors()) {
//            System.out.println("thieu field kia ban oi");
//            return "user/register";
//        }else {
//            System.out.println("dung het roi do");
//        }

        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "template/admin/dist/img/users/";
        item.setPhoto(fileName);
        item.setActivated(true);
        accountDao.save(item);
        paramService.save(multipartFile,uploadDir);
        model.addAttribute("MESSAGE","Sign Up Success!");
        model.addAttribute("item",new Account());
        return "user/register";

    }

    @RequestMapping("/customer-info")
    public String customerInfo(Model model) {
        Account userInfo = sessionService.get(SessionAttr.CURRENT_USER);
        model.addAttribute("userInfo",userInfo);
        return "user/customer-info";
    }

    @RequestMapping("/update-account")
    public String updateAccount(Model model, @RequestParam("photo") MultipartFile multipartFile) throws IOException{
        String username = paramService.getString("username","");
        String fullname = paramService.getString("fullname","");
        String email = paramService.getString("email", "");
        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "template/admin/dist/img/users/";
//        Account user = accountDao.findById(username).get();
        Account user = sessionService.get(SessionAttr.CURRENT_USER);
        user.setUsername(username);
        user.setFullname(fullname);
        user.setEmail(email);
        user.setActivated(true);
        user.setPhoto(fileName);
        paramService.save(multipartFile, uploadDir);
        accountDao.save(user);
        model.addAttribute("MESSAGEUpdate","Update account successfully!");


        return "user/customer-info";
    }

    @RequestMapping("/change-pass")
    public String changePass(Model model, Account ac) {
        String username = paramService.getString("username","");
        String currentPass = paramService.getString("currentPass","");
        String newPass = paramService.getString("newPass","");
        String confirmPass = paramService.getString("cfmNewPass","");
        try {
            Account user = accountDao.findById(username).get();
            if (!user.getPassword().equals(currentPass)) {
                model.addAttribute("MESSAGE","Wrong Password!");
            } else {
                if (newPass.equals(confirmPass)) {
                    user.setPassword(newPass);
                    accountDao.save(user);
                    model.addAttribute("MESSAGE", "Password is changed!");
                } else {
                    model.addAttribute("MESSAGE", "Password not match!");

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("MESSAGE", "Account Invalid!");
        }
        return "user/customer-info";
    }

    @RequestMapping("forgot-pass")
    public String forgotPass(Model model) {
        String username = paramService.getString("username", "");
        String email = paramService.getString("email", "");
        String randomPass = randomService.randomAlphaNumeric(8);
        String subject = "CR7 Shop send your new password";
        String body = "Your new password: "+ randomPass+"    \nClick here to login => "+"http://localhost:8080/home/login";

        try {
            Account user = accountDao.findById(username).get();
            if(!user.getEmail().equals(email)) {
                model.addAttribute("MESSAGEMail", "Email is incorrect");
            } else {
                user.setPassword(randomPass);
                accountDao.save(user);
                mailerService.send(email, subject, body);
                model.addAttribute("MESSAGEMail", "Please check your Email!");
                System.out.println("----------==> Send mail success -------------------------");
            }
        } catch (MessagingException e) {
            e.printStackTrace();
            model.addAttribute("MESSAGEMail", "Account is invalid!");
        }


        return "user/customer-info";
    }

}
