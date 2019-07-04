package com.yu.pojo;

public class Product {
    private int id;
    private String image;
    private String licenseId;
    private String standardId;
    private String dateOfProduction;
    private String qualityTime;
    private String name;
    private int netWeight;
    private String packaging;
    private String brand;
    private String foodTech;
    private String level;
    private String placeOrigin;
    private int marketPrice;
    private int ourPrice;
    private int clickCount;
    private int commentCount;
    private int saleCount;
    private ProductDetailed productDetailed;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLicenseId() {
        return licenseId;
    }

    public void setLicenseId(String licenseId) {
        this.licenseId = licenseId;
    }

    public String getStandardId() {
        return standardId;
    }

    public void setStandardId(String standardId) {
        this.standardId = standardId;
    }

    public String getDateOfProduction() {
        return dateOfProduction;
    }

    public void setDateOfProduction(String dateOfProduction) {
        this.dateOfProduction = dateOfProduction;
    }

    public String getQualityTime() {
        return qualityTime;
    }

    public void setQualityTime(String qualityTime) {
        this.qualityTime = qualityTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNetWeight() {
        return netWeight;
    }

    public void setNetWeight(int netWeight) {
        this.netWeight = netWeight;
    }

    public String getPackaging() {
        return packaging;
    }

    public void setPackaging(String packaging) {
        this.packaging = packaging;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getFoodTech() {
        return foodTech;
    }

    public void setFoodTech(String foodTech) {
        this.foodTech = foodTech;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getPlaceOrigin() {
        return placeOrigin;
    }

    public void setPlaceOrigin(String placeOrigin) {
        this.placeOrigin = placeOrigin;
    }

    public int getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(int marketPrice) {
        this.marketPrice = marketPrice;
    }

    public int getOurPrice() {
        return ourPrice;
    }

    public void setOurPrice(int ourPrice) {
        this.ourPrice = ourPrice;
    }

    public int getClickCount() {
        return clickCount;
    }

    public void setClickCount(int clickCount) {
        this.clickCount = clickCount;
    }


    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public int getSaleCount() {
        return saleCount;
    }

    public void setSaleCount(int saleCount) {
        this.saleCount = saleCount;
    }

    public ProductDetailed getProductDetailed() {
        return productDetailed;
    }

    public void setProductDetailed(ProductDetailed productDetailed) {
        this.productDetailed = productDetailed;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", image='" + image + '\'' +
                ", licenseId='" + licenseId + '\'' +
                ", standardId='" + standardId + '\'' +
                ", dateOfProduction='" + dateOfProduction + '\'' +
                ", qualityTime='" + qualityTime + '\'' +
                ", name='" + name + '\'' +
                ", netWeight=" + netWeight +
                ", packaging='" + packaging + '\'' +
                ", brand='" + brand + '\'' +
                ", foodTech='" + foodTech + '\'' +
                ", level='" + level + '\'' +
                ", placeOrigin='" + placeOrigin + '\'' +
                ", marketPrice=" + marketPrice +
                ", ourPrice=" + ourPrice +
                ", clickCount=" + clickCount +
                ", commentCount=" + commentCount +
                ", saleCount=" + saleCount +
                '}';
    }
}
