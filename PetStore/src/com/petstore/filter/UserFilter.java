package com.petstore.filter;

import com.petstore.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by hezhujun on 2016/3/23.
 */
@WebFilter(filterName = "UserFilter",value={"/getShoppingCar","/user.jsp"})
public class UserFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        User user = (User) ((HttpServletRequest)req).getSession().getAttribute("user");
        if (user == null){
            req.setAttribute("msg", "请先登陆");
            ((HttpServletRequest)req).getRequestDispatcher("jsp/user/login.jsp").forward(req, resp);
        } else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
