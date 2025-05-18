package com.realestate.service.bst;

import com.realestate.model.Property;

import java.util.ArrayList;
import java.util.List;

public class PropertyBST {
    private PropertyNode root;

    public PropertyBST() {
        this.root = null;
    }

    // Insert (Create)
    ublic void insert(Property property) {
        root = insertRec(root, property);
    }

    private PropertyNode insertRec(PropertyNode root, Property property) {
        if (root == null) {
            return new PropertyNode(property);
        }
        if (property.getId().compareTo(root.property.getId()) < 0) {
            root.left = insertRec(root.left, property);
        } else {
            root.right = insertRec(root.right, property);
        }
        return root;
    }

    // Search (Read)
    public Property search(String id) {
        return searchRec(root, id);
    }

    private Property searchRec(PropertyNode root, String id) {
        if (root == null || root.property.getId().equals(id)) {
            return root != null ? root.property : null;
        }
        if (id.compareTo(root.property.getId()) < 0) {
            return searchRec(root.left, id);
        }
        return searchRec(root.right, id);
    }

    // Delete
    public void delete(String id) {
        root = deleteRec(root, id);
    }

    private PropertyNode deleteRec(PropertyNode root, String id) {
        if (root == null) return null;

        if (id.compareTo(root.property.getId()) < 0) {
            root.left = deleteRec(root.left, id);
        } else if (id.compareTo(root.property.getId()) > 0) {
            root.right = deleteRec(root.right, id);
        } else {
            if (root.left == null) return root.right;
            if (root.right == null) return root.left;

            PropertyNode minNode = findMin(root.right);
            root.property = minNode.property;
            root.right = deleteRec(root.right, minNode.property.getId());
        }
        return root;
    }

    private PropertyNode findMin(PropertyNode root) {
        while (root.left != null) {
            root = root.left;
        }
        return root;
    }

    // Update
    public void update(Property updatedProperty) {
        delete(updatedProperty.getId());
        insert(updatedProperty);
    }

    // List all properties
    public List<Property> getAllProperties() {
        List<Property> properties = new ArrayList<>();
        inOrderTraversal(root, properties);
        return properties;
    }

    private void inOrderTraversal(PropertyNode root, List<Property> properties) {
        if (root != null) {
            inOrderTraversal(root.left, properties);
            properties.add(root.property);
            inOrderTraversal(root.right, properties);
        }
    }

    // Search by location (city)
    public List<Property> searchByLocation(String city) {
        List<Property> results = new ArrayList<>();
        searchByLocationRec(root, city, results);
        return results;
    }

    private void searchByLocationRec(PropertyNode root, String city, List<Property> results) {
        if (root != null) {
            searchByLocationRec(root.left, city, results);
            if (root.property.getCity().equalsIgnoreCase(city)) {
                results.add(root.property);
            }
            searchByLocationRec(root.right, city, results);
        }
    }

    // Search by type (Land or House)
    public List<Property> searchByType(String type) {
        List<Property> results = new ArrayList<>();
        searchByTypeRec(root, type, results);
        return results;
    }

    private void searchByTypeRec(PropertyNode root, String type, List<Property> results) {
        if (root != null) {
            searchByTypeRec(root.left, type, results);
            if (root.property.getType().equalsIgnoreCase(type)) {
                results.add(root.property);
            }
            searchByTypeRec(root.right, type, results);
        }
    }
}
