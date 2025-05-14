package com.realestate.servlet;

import com.realestate.model.Property;
import com.realestate.service.PropertyService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private final PropertyService propertyService = new PropertyService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        String id = req.getParameter("id");

        f ("delete".equals(action) && id != null) {
            PropertyService propertyService = new PropertyService();
            boolean deleted = propertyService.deletePropertyById(id);  // Use the new method!

            if (deleted) {
                System.out.println("Property deleted successfully: " + id);
            } else {
                System.out.println("Property not found: " + id);
            }

            resp.sendRedirect(req.getContextPath() + "/home");  // Redirect after deleting
            return;  // Stop further processing
        }

        PropertyService propertyService = new PropertyService();
        propertyService.reloadProperties();
        List<Property> properties = propertyService.getAllProperties();
        req.setAttribute("properties", properties);
        req.getRequestDispatcher("/pages/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        propertyService.reloadProperties();

        String city = req.getParameter("city");
        String type = req.getParameter("type");
        String category = req.getParameter("category");

        List<Property> filteredProperties = propertyService.getAllProperties().stream()
                .filter(p -> {
                    boolean cityMatches = (city == null || city.isEmpty() || city.equals("All Districts") || p.getCity().equalsIgnoreCase(city));
                    boolean typeMatches = (type == null || type.isEmpty() || p.getType().equalsIgnoreCase(type));
                    boolean categoryMatches = (category == null || category.isEmpty() || p.getCategory().equalsIgnoreCase(category));
                    return cityMatches && typeMatches && categoryMatches;
                })
                .collect(Collectors.toList());

        req.setAttribute("properties", filteredProperties);
        req.getRequestDispatcher("/pages/home.jsp").forward(req, resp);
    }

    public PropertyService getPropertyService() {
        return propertyService;
    }
}
