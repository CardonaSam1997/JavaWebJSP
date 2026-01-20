package dao.impl;

import java.util.List;
import model.User;

public interface IUserDao {
    
    List<User> listar();
    
    void insertar(User usuario);
    
    User buscar(int id);
    
    void actualizar(User usuario);
    
    void eliminar(int id);
}