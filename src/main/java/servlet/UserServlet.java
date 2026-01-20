package servlet;
import dao.UserDao;
import model.User;
import model.Role;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/users")
public class UserServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        super.init();
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUsers(request, response);
                break;
        }
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            insertUser(request, response);
        } else {
            updateUser(request, response);
        }
    }

    /**
     * Trae el listado de los usuarios
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> list = userDao.listar();
        request.setAttribute("userList", list);
        request.getRequestDispatcher("/views/user-list.jsp").forward(request, response);
    }

    /**
     * Muestra el formulario para registrar un usuario
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("roles", Role.values());
        request.getRequestDispatcher("/views/user-form.jsp").forward(request, response);
    }

    /**
     * Muestra el formulario para editar un usuario
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDao.buscar(id);
        request.setAttribute("user", existingUser);
        request.setAttribute("roles", Role.values());
        request.getRequestDispatcher("/views/user-form.jsp").forward(request, response);
    }

    /**
     * Permite insertar un usuario
     * @param request
     * @param response
     * @throws IOException 
     */
    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Role role = Role.valueOf(request.getParameter("role"));

        User user = new User();
        user.setUserName(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setRole(role);
        user.setCreateAt(new Date(System.currentTimeMillis()));

        userDao.insertar(user);
        response.sendRedirect("users");
    }

    /**
     * Permite la actualizacion de un usuario
     * @param request
     * @param response
     * @throws IOException 
     */
    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Role role = Role.valueOf(request.getParameter("role"));

        User user = new User();
        user.setId(id);
        user.setUserName(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setRole(role);

        userDao.actualizar(user);
        response.sendRedirect("users");
    }

    /**
     * Permite la eliminacion de un usuario
     * @param request
     * @param response
     * @throws IOException 
     */
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDao.eliminar(id);
        response.sendRedirect("users");
    }
}