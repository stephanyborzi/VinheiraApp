package controller;

import dao.WineDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Wine;

import java.io.IOException;
import java.util.List;

@WebServlet("/wine")
public class WineServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    WineDAO wineDAO = new WineDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
            if (action == null || action.equals("list")) {
                List<Wine> wines = wineDAO.list();
                request.setAttribute("wines", wines);
                request.getRequestDispatcher("/WEB-INF/list-wines.jsp")
                        .forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        Wine wine = new Wine();
        wine.setName(name);
        wine.setDescription(description);
        wine.setPrice(price);

        wineDAO.insertWine(wine);

        response.sendRedirect("wine?action=list");
    }

}
