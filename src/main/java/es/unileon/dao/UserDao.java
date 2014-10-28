package es.unileon.dao;

import es.unileon.model.User;

public interface UserDao extends Dao<User> {
    public User findByUsername(String username);
}
