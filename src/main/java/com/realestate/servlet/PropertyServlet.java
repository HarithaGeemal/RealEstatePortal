package com.realestate.servlet;

import com.realestate.model.Property;
import com.realestate.service.PropertyService;
import com.realestate.util.FileUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet("/property")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class PropertyServlet extends HttpServlet {
    private PropertyService propertyService;
    private static final String UPLOAD_DIR = "uploads";

    @Override
    public void init() throws ServletException {
        propertyService = new PropertyService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String id = req.getParameter("id");

        PropertyService propertyService = new PropertyService();

        if ("view".equals(action)) {
            id = req.getParameter("id");
            Property property = propertyService.getProperty(id);
            req.setAttribute("property", property);
            req.getRequestDispatcher("/pages/viewProperty.jsp").forward(req, resp);
        } else if ("edit".equals(action)) {
            id = req.getParameter("id");
            Property property = propertyService.getProperty(id);
            req.setAttribute("property", property);
            req.getRequestDispatcher("/pages/editProperty.jsp").forward(req, resp);
        } else if ("delete".equals(action)) {
            id = req.getParameter("id");
            propertyService.deleteProperty(id);
            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            req.getRequestDispatcher("/pages/sell.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("update".equals(action)) {
            // Update an existing property
            try {
                String id = req.getParameter("id");
                String address = req.getParameter("address");
                String type = req.getParameter("type");
                String category = req.getParameter("category");
                String city = req.getParameter("city");
                double price = Double.parseDouble(req.getParameter("price"));
                String sellerName = req.getParameter("sellerName");
                String sellerContact = req.getParameter("sellerContact");
                String sellerEmail = req.getParameter("sellerEmail");

                System.out.println("Updating property: ID=" + id + ", Address=" + address);

                // Handle file upload (only if a new file is provided)
                Part filePart = req.getPart("image");
                String imagePath = propertyService.getProperty(id).getImagePath(); // Keep existing image by default
                if (filePart != null && filePart.getSize() > 0) {
                    String applicationPath = req.getServletContext().getRealPath("");
                    String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }
                    String fileName = FileUtil.getFileName(filePart);
                    imagePath = FileUtil.saveImage(uploadDir, fileName, filePart.getInputStream());
                    imagePath = "/" + UPLOAD_DIR + "/" + fileName; // Store relative path for web access
                }

                Property property = new Property(id, address, type, category, city, price, imagePath, sellerName, sellerContact, sellerEmail);
                propertyService.updateProperty(property);

                resp.sendRedirect(req.getContextPath() + "/home");
            } catch (Exception e) {
                System.err.println("Error updating property: " + e.getMessage());
                req.setAttribute("error", "Failed to update property: " + e.getMessage());
                req.getRequestDispatcher("/pages/error.jsp").forward(req, resp);
            }
        } else {
            // Add a new property
            try {
                String id = "PROP" + System.currentTimeMillis();
                String address = req.getParameter("address");
                String type = req.getParameter("type");
                String category = req.getParameter("category");
                String city = req.getParameter("city");
                double price = Double.parseDouble(req.getParameter("price"));
                String sellerName = req.getParameter("sellerName");
                String sellerContact = req.getParameter("sellerContact");
                String sellerEmail = req.getParameter("sellerEmail");

                System.out.println("Adding property: ID=" + id + ", Address=" + address);

                // Handle file upload
                Part filePart = req.getPart("image");
                String imagePath = null;
                if (filePart != null && filePart.getSize() > 0) {
                    String applicationPath = req.getServletContext().getRealPath("");
                    String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }
                    String fileName = extractFileName(filePart); // Use a local method instead of FileUtil
                    filePart.write(uploadPath + File.separator + fileName);
                    imagePath = "/" + UPLOAD_DIR + "/" + fileName;
                }

                Property property = new Property(id, address, type, category, city, price, imagePath, sellerName, sellerContact, sellerEmail);
                propertyService.addProperty(property);
                

                resp.sendRedirect(req.getContextPath() + "/home");
            } catch (Exception e) {
                req.setAttribute("error", "Failed to add property: " + e.getMessage());
                req.getRequestDispatcher("/pages/error.jsp").forward(req, resp);
            }
        }
    }

    // Helper method to extract file name from Part
    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                String fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
                return fileName.substring(fileName.lastIndexOf("\\") + 1); // Handle Windows paths
            }
        }
        return "unknown";
    }
}
