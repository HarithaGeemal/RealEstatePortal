package com.realestate.model;

public class Property {
    private String id;          // Unique identifier
    private String address;     // Property address
    private String type;        // "Land" or "House"
    private String category;    // Specific type (e.g., "Residential", "Commercial")
    private String city;        // City or district
    private double price;       // Price of the property
    private String imagePath;   // Path to uploaded image
    private String sellerName;  // Seller contact info
    private String sellerContact; // 10-digit contact number
    private String sellerEmail; // Seller email

    // Constructor
    public Property(String id, String address, String type, String category, String city, double price,
                    String imagePath, String sellerName, String sellerContact, String sellerEmail) {
        this.id = id;
        this.address = address;
        this.type = type;
        this.category = category;
        this.city = city;
        this.price = price;
        this.imagePath = imagePath;
        this.sellerName = sellerName;
        this.sellerContact = sellerContact;
        this.sellerEmail = sellerEmail;
    }

    // Getters and Setters (Encapsulation)
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
    public String getSellerName() { return sellerName; }
    public void setSellerName(String sellerName) { this.sellerName = sellerName; }
    public String getSellerContact() { return sellerContact; }
    public void setSellerContact(String sellerContact) { this.sellerContact = sellerContact; }
    public String getSellerEmail() { return sellerEmail; }
    public void setSellerEmail(String sellerEmail) { this.sellerEmail = sellerEmail; }

    // For file storage (toString format)
    @Override
    public String toString() {
        String result = String.join("|",
                escape(id),
                escape(address),
                escape(type),
                escape(category),
                escape(city),
                String.valueOf(price),
                escape(imagePath != null ? imagePath : ""),
                escape(sellerName),
                escape(sellerContact),
                escape(sellerEmail));
        System.out.println("Serialized property: " + result);
        return result;
    }

    // fromString method for loading from file
    public static Property fromString(String line) {
        String[] parts = line.split("\\|"); // -1 to include empty trailing fields
        if (parts.length != 10) {
            throw new IllegalArgumentException("Invalid property format, expected 10 fields but got " + parts.length + ": " + line);
        }
        String id = unescape(parts[0]);
        String address = unescape(parts[1]);
        String type = unescape(parts[2]);
        String category = unescape(parts[3]);
        String city = unescape(parts[4]);
        double price;
        try {
            price = Double.parseDouble(parts[5]);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid price format: " + parts[5]);
        }
        String imagePath = unescape(parts[6]);
        if (imagePath.isEmpty()) imagePath = null;
        String sellerName = unescape(parts[7]);
        String sellerContact = unescape(parts[8]);
        String sellerEmail = unescape(parts[9]);
        System.out.println("Deserialized property: ID=" + id + ", Address=" + address);
        return new Property(id, address, type, category, city, price, imagePath, sellerName, sellerContact, sellerEmail);
    }

    // Escape special characters (e.g., |) to avoid breaking the format
    private String escape(String value) {
        if (value == null) return "";
        return value.replace("|", "\\|");
    }

    // Unescape special characters
    private static String unescape(String value) {
        if (value == null) return "";
        return value.replace("\\|", "|");
    }
}
