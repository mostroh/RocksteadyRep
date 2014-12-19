/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SessionBeans;

import Entities.Post;

/**
 *
 * @author inftel13
 */
public class PostDataHelper {
    private String lat;
    private String lon;
    private Post p;
    
    public PostDataHelper() {
    }
    

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }

    public Post getP() {
        return p;
    }

    public void setP(Post p) {
        this.p = p;
    }

    
    
    
}
