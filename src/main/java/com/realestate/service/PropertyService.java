package com.realestate.service;

import com.realestate.model.Property;
import com.realestate.util.FileUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class PropertyService {
    private List<Property> properties;

    public PropertyService() {
        try {
            properties = FileUtil.loadProperties();
            System.out.println("PropertyService initialized with " + properties.size() + " properties");
        } catch (IOException e) {
            properties = new ArrayList<>();
            System.err.println("Failed to load properties: " + e.getMessage());
        }


    }

    private void saveProperties() {
        try {
            System.out.println("Saving " + properties.size() + " properties");
            FileUtil.saveProperties(properties);
        } catch (IOException e) {
            System.err.println("Failed to save properties: " + e.getMessage());
        }
    }

    public List<Property> getAllProperties() {
        return new ArrayList<>(properties);
    }

    public List<Property> searchByType(String type) {
        return properties.stream()
                .filter(p -> p.getType().equalsIgnoreCase(type))
                .collect(Collectors.toList());
    }

    public List<Property> searchByLocation(String city) {
        return properties.stream()
                .filter(p -> p.getCity().equalsIgnoreCase(city))
                .collect(Collectors.toList());
    }

    public Property getProperty(String id) {
        return properties.stream()
                .filter(p -> p.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public void addProperty(Property property) throws IOException {
        reloadProperties();
        properties.add(property);
        saveProperties();
    }

    public void updateProperty(Property property) throws IOException {
        properties.removeIf(p -> p.getId().equals(property.getId()));
        properties.add(property);
        saveProperties();
        reloadProperties();
    }

    public void deleteProperty(String id) throws IOException {
        Property toDelete = null;
        for (Property p : properties) {
            if (p.getId().equals(id)) {
                toDelete = p;
                break;
            }
        }
        if (toDelete != null) {
            properties.remove(toDelete);
            saveProperties();
            reloadProperties();
        }
    }



    public void reloadProperties() throws IOException {
    properties.clear();
    properties.addAll(FileUtil.loadProperties());
}

    public boolean deletePropertyById(String id) throws IOException {
        boolean removed = properties.removeIf(p -> p.getId().equals(id));
        if (removed) {
            FileUtil.saveProperties(properties);  //  save updated list to properties.txt immediately
        }
        return removed;
    }


}