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

@WebServlet("/land")
public class LandServlet extends HttpServlet {

    private final PropertyService propertyService = new PropertyService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        propertyService.reloadProperties();

//        if ("delete".equals(action) && id != null) {
//            PropertyService propertyService = new PropertyService();
//            boolean deleted = propertyService.deletePropertyById(id);  // Use the new method!
//
//            if (deleted) {
//                System.out.println("Property deleted successfully: " + id);
//            } else {
//                System.out.println("Property not found: " + id);
//            }
//
//            response.sendRedirect(request.getContextPath() + "/home");  // Redirect after deleting
//            return;  // Stop further processing
//        }

        List<Property> lands = propertyService.getAllProperties().stream()
                .filter(p -> "Land".equalsIgnoreCase(p.getType()))
                .collect(Collectors.toList());

        request.setAttribute("lands", lands);  // pass to JSP
        request.getRequestDispatcher("/pages/land.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        propertyService.reloadProperties();

        String city = req.getParameter("city");
        String type = req.getParameter("type");
        String category = req.getParameter("category");

        List<Property> filteredLands = propertyService.getAllProperties().stream()
                .filter(p -> "Land".equalsIgnoreCase(p.getType())) // Must be only lands
                .filter(p -> {
                    boolean cityMatches = (city == null || city.isEmpty() || city.equals("All Districts") || p.getCity().equalsIgnoreCase(city));
                    boolean typeMatches = (type == null || type.isEmpty() || p.getType().equalsIgnoreCase(type));
                    boolean categoryMatches = (category == null || category.isEmpty() || p.getCategory().equalsIgnoreCase(category));
                    return cityMatches && typeMatches && categoryMatches;
                })
                .collect(Collectors.toList());

        req.setAttribute("lands", filteredLands);
        req.getRequestDispatcher("/pages/land.jsp").forward(req, resp);
    }
}
