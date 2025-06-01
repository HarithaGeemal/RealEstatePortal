package com.realestate.util;

import com.realestate.model.Property;
import jakarta.servlet.http.Part;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
    private static final String FILE_PATH = System.getProperty("user.home") + File.separator + "realestate/data" + File.separator + "properties.txt";

    public static void saveProperties(List<Property> properties) throws IOException {
        File file = new File(FILE_PATH);
        File parentDir = file.getParentFile();
        if (!parentDir.exists()) {
            boolean created = parentDir.mkdirs();
            System.out.println("Created directory " + parentDir.getAbsolutePath() + ": " + created);
            if (!created) {
                throw new IOException("Failed to create directory: " + parentDir.getAbsolutePath());
            }
        }
        if (!file.exists()) {
            boolean created = file.createNewFile();
            System.out.println("Created file " + file.getAbsolutePath() + ": " + created);
            if (!created) {
                throw new IOException("Failed to create file: " + file.getAbsolutePath());
            }
        }
        System.out.println("Saving properties to: " + file.getAbsolutePath());
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) { // false to overwrite
            for (Property property : properties) {
                String line = property.toString();
                System.out.println("Writing line: " + line);
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("IOException while saving properties: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
        System.out.println("Successfully saved " + properties.size() + " properties to " + file.getAbsolutePath());
    }

    public static void saveProperties(Property[] properties) throws IOException {
        File file = new File(FILE_PATH);
        File parentDir = file.getParentFile();
        if (!parentDir.exists()) {
            boolean created = parentDir.mkdirs();
            System.out.println("Created directory " + parentDir.getAbsolutePath() + ": " + created);
            if (!created) {
                throw new IOException("Failed to create directory: " + parentDir.getAbsolutePath());
            }
        }
        if (!file.exists()) {
            boolean created = file.createNewFile();
            System.out.println("Created file " + file.getAbsolutePath() + ": " + created);
            if (!created) {
                throw new IOException("Failed to create file: " + file.getAbsolutePath());
            }
        }
        System.out.println("Saving properties to: " + file.getAbsolutePath());
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
            int count = 0;
            for (Property property : properties) {
                if (property != null) {
                    String line = property.toString();
                    System.out.println("Writing line: " + line);
                    writer.write(line);
                    writer.newLine();
                    count++;
                }
            }
            System.out.println("Successfully saved " + count + " properties to " + file.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("IOException while saving properties: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    public static List<Property> loadProperties() throws IOException {
        List<Property> properties = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) {
            System.out.println("File does not exist: " + file.getAbsolutePath());
            return properties;
        }

        System.out.println("Loading properties from: " + file.getAbsolutePath());
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            int lineNumber = 0;
            while ((line = reader.readLine()) != null) {
                lineNumber++;
                if (line.trim().isEmpty()) continue;
                System.out.println("Reading line " + lineNumber + ": " + line);
                try {
                    properties.add(Property.fromString(line));
                } catch (Exception e) {
                    System.err.println("Failed to parse line " + lineNumber + ": " + line + " - Error: " + e.getMessage());
                }
            }
        } catch (IOException e) {
            System.err.println("IOException while loading properties: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
        System.out.println("Loaded " + properties.size() + " properties from " + file.getAbsolutePath());
        return properties;
    }

    public static String saveImage(File uploadDir, String fileName, InputStream inputStream) throws IOException {
        File file = new File(uploadDir, fileName);
        if (!uploadDir.exists()) {
            boolean created = uploadDir.mkdirs();
            System.out.println("Created upload directory " + uploadDir.getAbsolutePath() + ": " + created);
            if (!created) {
                throw new IOException("Failed to create upload directory: " + uploadDir.getAbsolutePath());
            }
        }
        System.out.println("Saving image to: " + file.getAbsolutePath());
        try (FileOutputStream outputStream = new FileOutputStream(file)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            System.err.println("IOException while saving image: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
        System.out.println("Successfully saved image to: " + file.getAbsolutePath());
        return file.getPath();
    }

    public static String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        System.out.println("Content-Disposition header: " + contentDisposition);
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                String fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
                String extractedFileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
                System.out.println("Extracted file name: " + extractedFileName);
                return extractedFileName;
            }
        }
        System.out.println("Could not extract file name, returning default: unknown");
        return "unknown";
    }
}
