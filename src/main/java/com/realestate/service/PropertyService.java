package com.realestate.service;

import com.realestate.model.Property;
import com.realestate.service.bst.PropertyBST;
import com.realestate.util.FileUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PropertyService {
    private PropertyBST properties; // Changed to PropertyBST

    public PropertyService() {
        try {
            properties = new PropertyBST();
            List<Property> loadedProperties = FileUtil.loadProperties();
            for (Property property : loadedProperties) {
                properties.insert(property); // Load into BST
            }
            System.out.println("PropertyService initialized with " + loadedProperties.size() + " properties");
        } catch (IOException e) {
            properties = new PropertyBST();
            System.err.println("Failed to load properties: " + e.getMessage());
        }
    }

    private void saveProperties() {
        try {
            Property[] propertyArray = properties.getAllProperties();
            System.out.println("Saving " + propertyArray.length + " properties");
            FileUtil.saveProperties(propertyArray); // Use new FileUtil method
        } catch (IOException e) {
            System.err.println("Failed to save properties: " + e.getMessage());
        }
    }

    public List<Property> getAllProperties() {
        Property[] propertyArray = properties.getAllProperties();
        return arrayToList(propertyArray); // Convert to List for Servlets
    }

    public List<Property> searchByType(String type) {
        Property[] propertyArray = properties.searchByType(type);
        return arrayToList(propertyArray);
    }

    public List<Property> searchByLocation(String city) {
        Property[] propertyArray = properties.searchByLocation(city);
        return arrayToList(propertyArray);
    }

    public Property getProperty(String id) {
        return properties.search(id);
    }

    public void addProperty(Property property) throws IOException {
        reloadProperties(); // Ensure BST is up-to-date
        properties.insert(property); // Insert into BST
        saveProperties(); // Save to file
    }

    public void updateProperty(Property property) throws IOException {
        properties.update(property); // Use BST's update
        saveProperties(); // Save to file
        reloadProperties(); // Refresh BST
    }

    public void deleteProperty(String id) throws IOException {
        Property toDelete = properties.search(id);
        if (toDelete != null) {
            properties.delete(id); // Delete from BST
            saveProperties(); // Save to file
            reloadProperties(); // Refresh BST
        }
    }

    public void reloadProperties() throws IOException {
        properties = new PropertyBST(); // Clear BST
        List<Property> loadedProperties = FileUtil.loadProperties();
        for (Property property : loadedProperties) {
            properties.insert(property); // Rebuild BST
        }
    }

    public boolean deletePropertyById(String id) throws IOException {
        Property toDelete = properties.search(id);
        if (toDelete != null) {
            properties.delete(id); // Delete from BST
            FileUtil.saveProperties(properties.getAllProperties()); // Save to file
            return true;
        }
        return false;
    }

    //  Convert Property[] to List<Property> for Servlets
    private List<Property> arrayToList(Property[] array) {
        List<Property> list = new ArrayList<>();
        for (Property p : array) {
            if (p != null) {
                list.add(p);
            }
        }
        return list;
    }
}