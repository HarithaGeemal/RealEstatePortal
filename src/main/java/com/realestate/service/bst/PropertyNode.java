package com.realestate.service.bst;

import com.realestate.model.Property;

public class PropertyNode {
    Property property;
    PropertyNode left;
    PropertyNode right;

    public PropertyNode(Property property) {
        this.property = property;
        this.left = null;
        this.right = null;
    }
}
