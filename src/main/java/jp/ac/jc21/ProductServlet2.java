package jp.ac.jc21;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**

 * Servlet implementation class IndexServlet

 */

@WebServlet(urlPatterns = { "/item2" })

public class ProductServlet2 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	final String dbServer = "192.168.54.231";

	final String dbPort = "3306";

	final String dbName = "test2023";

	final String user = "test2023";

	final String pass = "test2023";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		//		response.getWriter().append("Served at: ").append(request.getContextPath());

		String url = "jdbc:mysql://" + dbServer + "/" + dbName;

		response.setContentType("text/html;charset=UTF-8");

		response.getWriter().append("<h2>Connect to : ").append(url).append("</h2>");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection conn = DriverManager.getConnection(url, user, pass);

			String sql = "SELECT PRODUCT_CODE, PRODUCT_NAME FROM PRODUCT" + " Where PRODUCT_CODE = ? ";

			PreparedStatement statement = conn.prepareStatement(sql);

			String id = request.getParameter("ID");

			statement.setString(1, id);

			ResultSet rs = statement.executeQuery();

			ArrayList<String[]> result = new ArrayList<>();

			while (rs.next() == true) {

				String[] s = new String[3];

				s[0] = rs.getString("PRODUCT_CODE");

				s[1] = rs.getString("PRODUCT_NAME");

				//s[2] = rs.getString("price");

				result.add(s);

			}

			request.setAttribute("result", result);

			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/product2.jsp");

			rd.forward(request, response);

		} catch (SQLException e) {

			e.printStackTrace();

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		}

	}

}
