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


@WebServlet("/houses")
public class HouseServlet extends HttpServlet {
    private final PropertyService propertyService = new PropertyService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        propertyService.reloadProperties();

        PropertyService propertyService = new PropertyService();

        List<Property> houses = propertyService.getAllProperties().stream()
                .filter(p -> "House".equalsIgnoreCase(p.getType()))
                .collect(Collectors.toList());

        req.setAttribute("houses", houses);
        req.getRequestDispatcher("/pages/houses.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        propertyService.reloadProperties();

        String city = req.getParameter("city");
        String type = req.getParameter("type");
        String category = req.getParameter("category");

        List<Property> filteredHouses = propertyService.getAllProperties().stream()
                .filter(p -> "House".equalsIgnoreCase(p.getType())) // Must be only houses
                .filter(p -> {
                    boolean cityMatches = (city == null || city.isEmpty() || city.equals("All Districts") || p.getCity().equalsIgnoreCase(city));
                    boolean typeMatches = (type == null || type.isEmpty() || p.getType().equalsIgnoreCase(type));
                    boolean categoryMatches = (category == null || category.isEmpty() || p.getCategory().equalsIgnoreCase(category));
                    return cityMatches && typeMatches && categoryMatches;
                })
                .collect(Collectors.toList());


        req.setAttribute("houses", filteredHouses);
        req.getRequestDispatcher("/pages/houses.jsp").forward(req, resp);
    }

    private List<Property> filterHouses(List<Property> houses, String category, String city, String minPrice, String maxPrice, String keyword) {
        return houses.stream()
                .filter(p -> category == null || category.isEmpty() || p.getCategory().equalsIgnoreCase(category))
                .filter(p -> city == null || city.isEmpty() || p.getCity().equalsIgnoreCase(city))
                .filter(p -> {
                    try {
                        return minPrice == null || minPrice.isEmpty() || p.getPrice() >= Double.parseDouble(minPrice);
                    } catch (NumberFormatException e) {
                        return true; // Skip filter if minPrice is invalid
                    }
                })
                .filter(p -> {
                    try {
                        return maxPrice == null || maxPrice.isEmpty() || p.getPrice() <= Double.parseDouble(maxPrice);
                    } catch (NumberFormatException e) {
                        return true; // Skip filter if maxPrice is invalid
                    }
                })
                .filter(p -> keyword == null || keyword.isEmpty() || p.getAddress().toLowerCase().contains(keyword.toLowerCase()))
                .collect(Collectors.toList());
    }
}
