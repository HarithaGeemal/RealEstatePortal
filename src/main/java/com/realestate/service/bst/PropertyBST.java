package com.realestate.service.bst;

import com.realestate.model.Property;

public class PropertyBST {
    private PropertyNode root;

    public PropertyBST() {
        this.root = null;
    }

    // Insert (Create)
    public void insert(Property property) {
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
    public Property[] getAllProperties() {
        int size = countNodes(root);
        Property[] properties = new Property[size];
        inOrderTraversal(root, properties, new int[]{0});
        return properties;
    }

    private void inOrderTraversal(PropertyNode root, Property[] properties, int[] index) {
        if (root != null) {
            inOrderTraversal(root.left, properties, index);
            properties[index[0]++] = root.property;
            inOrderTraversal(root.right, properties, index);
        }
    }

    // Search by location (city)
    public Property[] searchByLocation(String city) {
        int maxSize = countNodes(root); // Worst case: all nodes match
        Property[] results = new Property[maxSize];
        searchByLocationRec(root, city, results, new int[]{0});
        return trimArray(results);
    }

    private void searchByLocationRec(PropertyNode root, String city, Property[] results, int[] index) {
        if (root != null) {
            searchByLocationRec(root.left, city, results, index);
            if (root.property.getCity().equalsIgnoreCase(city)) {
                results[index[0]++] = root.property;
            }
            searchByLocationRec(root.right, city, results, index);
        }
    }

    // Search by type (Land or House)
    public Property[] searchByType(String type) {
        int maxSize = countNodes(root); // Worst case: all nodes match
        Property[] results = new Property[maxSize];
        searchByTypeRec(root, type, results, new int[]{0});
        return trimArray(results);
    }

    private void searchByTypeRec(PropertyNode root, String type, Property[] results, int[] index) {
        if (root != null) {
            searchByTypeRec(root.left, type, results, index);
            if (root.property.getType().equalsIgnoreCase(type)) {
                results[index[0]++] = root.property;
            }
            searchByTypeRec(root.right, type, results, index);
        }
    }

    // Helper: Count nodes in BST
    private int countNodes(PropertyNode root) {
        if (root == null) return 0;
        return 1 + countNodes(root.left) + countNodes(root.right);
    }

    // Helper: Trim array to remove trailing nulls
    private Property[] trimArray(Property[] array) {
        int size = 0;
        for (Property p : array) {
            if (p != null) size++;
            else break;
        }
        Property[] trimmed = new Property[size];
        System.arraycopy(array, 0, trimmed, 0, size);
        return trimmed;
    }
}
