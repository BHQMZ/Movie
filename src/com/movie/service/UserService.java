package com.movie.service;

import com.movie.Dao.impl.UserDaoImpl;
import com.movie.model.UserModel;

public class UserService {
    public int userLogin(UserModel userModel) {
        UserDaoImpl userDao = new UserDaoImpl();
        return userDao.userLogin(userModel);
    }
}