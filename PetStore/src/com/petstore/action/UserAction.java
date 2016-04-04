package com.petstore.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.petstore.dao.UserDao;
import com.petstore.entity.User;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * Created by hezhujun on 2016/4/3.
 */
public class UserAction extends ActionSupport implements ModelDriven<User> {
    private User user = new User();
    private String msg = null;

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    /**
     * 注册
     * @return
     */
    public String sign(){
        // 为密码MD5加密
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        if (UserDao.getInstance().add(user)) {
            // 注册成功
            ActionContext.getContext().getSession().put("user", user);
            return SUCCESS;
        } else {
            msg = "注册失败";
            // 注册失败
            return ERROR;
        }
    }

    /**
     * 登录
     * @return
     */
    public String login(){
        // 获取用户信息
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        user = UserDao.getInstance().getUser(user.getUsername(), user.getPassword());
        if(user != null){
            // 获取成功
            ActionContext.getContext().getSession().put("user", user);
            return SUCCESS;
        } else {
            // 获取失败
            msg = "用户名或密码输入错误，请重新登录。";
            return ERROR;
        }
    }

    /**
     * 更新用户信息
     * @return
     */
    public String update(){
        if (user.getPassword().equals("")){
            // 没有修密码
            String psd = ((User)ActionContext.getContext().getSession().get("user")).getPassword();
            user.setPassword(psd);
        } else {
            user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        }
        boolean result = UserDao.getInstance().update(user);
        // 修改成功
        if (result){
            // 更新session的内容
            ActionContext.getContext().getSession().put("user", user);
            msg = "修改资料成功";
            return SUCCESS;
        } else {
            // 修改失败
            msg = "修改资料失败";
            return ERROR;
        }
    }

    @Override
    public User getModel() {
        return user;
    }
}
