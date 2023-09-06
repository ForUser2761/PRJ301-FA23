import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static ArrayList<Account> accountList = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String role = request.getParameter("role");
        String[] hobbies = request.getParameterValues("hobbies");

        Account account = new Account(username, password, gender, role, hobbies);
        accountList.add(account);
        
        for (Account account1 : accountList) {
            System.out.println(account1);
        }
        request.setAttribute("accountList", accountList);
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }
}
