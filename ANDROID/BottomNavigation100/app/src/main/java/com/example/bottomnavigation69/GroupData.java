package com.example.bottomnavigation69;

public class GroupData {
    private String name;
    private int imageResourceId;
    private String zip;
    private String date;

    public static final GroupData[] classes = {
            new GroupData("요리 초보를 위한 길잡이 [소고기뭇국]", R.drawable.cookingclass,"서울특별시 금천구 가산디지털2로 123","2021-1-15"),
            new GroupData("이탈리아 파티요리 클래스 [토마토감자뇨끼]", R.drawable.cookingclass1,"서울특별시 송파구 중대로 135 IT벤처타워","2021-1-20"),
            new GroupData("방구석세계요리 - [일본편]", R.drawable.cookingclass2,"서울 중구 서소문로6길 16","2021-1-29"),
            new GroupData("한번배워서 맛있게 [간장찜닭]", R.drawable.cookingclass3,"서울 송파구 올림픽로 300","2021-2-5"),

    };

    public GroupData(String name, int imageResourceId, String zip, String date) {
        this.name = name;
        this.imageResourceId = imageResourceId;
        this.zip = zip;
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public int getImageResourceId() {
        return imageResourceId;
    }

    public String getZip() {
        return zip;
    }

    public String getDate() {
        return date;
    }


}
